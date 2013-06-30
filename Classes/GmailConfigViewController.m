//
//  GmailConfigViewController.m
//
//  Displays credential entry screen to the user ...
//
//  Created by Liangjun Jiang on 1/22/09.
//  Copyright 2010 Google Inc.
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//   http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MailCoreTypes.h"
#import "GmailConfigViewController.h"
#import "ImapSync.h"
#import "AppSettings.h"
#import "HomeViewController.h"
#import "SyncManager.h"
#import "StringUtil.h"
#import "FolderSelectViewController.h"
#import "Reachability.h"

#import "libetpan/mailstorage_types.h"
#import "libetpan/imapdriver_types.h"

#define GMAIL_SERVER			@"imap.gmail.com"
#define GMAIL_PORT              993
#define GMAIL_CONNECTION_TYPE   CONNECTION_TYPE_TLS
#define GMAIL_AUTH_TYPE         IMAP_AUTH_TYPE_PLAIN

@implementation GmailConfigViewController

@synthesize serverMessage, activityIndicator, usernameField, passwordField;
@synthesize firstSetup, accountNum, newAccount;
@synthesize selectFoldersButton;
@synthesize scrollView;
@synthesize privacyNotice;

- (void)dealloc {
	[scrollView release];
	[serverMessage release];
	[activityIndicator release];
	[usernameField release];
	[passwordField release];
	[selectFoldersButton release];
	[privacyNotice release];
	
    [super dealloc];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	
	self.scrollView = nil;
	self.serverMessage = nil;
	self.activityIndicator = nil;
	self.usernameField = nil;
	self.passwordField = nil;
	self.selectFoldersButton = nil;
	self.privacyNotice = nil;
}

-(void)viewDidLoad {
	self.usernameField.delegate = self;
	self.passwordField.delegate = self;
	
	// no serverMessage, activityIndicator
	self.serverMessage.text = @"";
	[self.activityIndicator setHidden:YES];	
	
	// preset username, password if they exist
	if(!self.newAccount) {		
		if([AppSettings username:accountNum] != nil) {
			self.usernameField.text = [AppSettings username:accountNum];
		}
		if([AppSettings password:accountNum] != nil) {
			self.passwordField.text = [AppSettings password:accountNum];
		}
		[self.privacyNotice setHidden:YES];
	}  else {
		// if we're adding a new account, we shouldn't show select folders button
		[self.selectFoldersButton setHidden:YES];	
	}
	
	[self.scrollView setContentSize:CGSizeMake(320, 490)];
}

-(void)saveSettings:(NSDictionary*)config {
	// The user was editing the account and clicked "Check and Save", and it validated OK
	self.serverMessage.text = @"";
	[self.activityIndicator setHidden:YES];	
	[self.activityIndicator stopAnimating];
	
	[AppSettings setAccountType:AccountTypeImap accountNum:self.accountNum];
	[AppSettings setUsername:config[@"username"] accountNum:self.accountNum];
	[AppSettings setPassword:config[@"password"] accountNum:self.accountNum];
	[AppSettings setServerAuthentication:[config[@"authentication"] intValue] accountNum:self.accountNum];
	[AppSettings setServer:config[@"server"] accountNum:self.accountNum];
	[AppSettings setServerPort:[config[@"port"] intValue] accountNum:self.accountNum];
	[AppSettings setServerEncryption:[config[@"encryption"] intValue] accountNum:self.accountNum];
	
	[self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)showFolderSelect:(NSDictionary*)config {
	// The user was adding a new account and clicked "Check and Save", now let him/her select folders
	self.serverMessage.text = @"";
	[self.activityIndicator setHidden:YES];	
	[self.activityIndicator stopAnimating];
	
	// display home screen
	FolderSelectViewController *vc = [[FolderSelectViewController alloc] initWithNibName:@"FolderSelect" bundle:nil];
	vc.folderPaths = config[@"folderNames"];
	
	vc.username = config[@"username"];
	vc.password = config[@"password"];
	vc.server = config[@"server"];
	
	vc.encryption = [config[@"encryption"] intValue];
	vc.port = [config[@"port"] intValue];
	vc.authentication = [config[@"authentication"] intValue];
	
	vc.newAccount = self.newAccount;
	vc.firstSetup = self.firstSetup;
	vc.accountNum = self.accountNum;
	
	[self.navigationController pushViewController:vc animated:YES];
	[vc release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if(textField == self.usernameField) {
		// usernameField -> go to passwordField
		[self.passwordField becomeFirstResponder];
		return YES;
	} else {
		// passwordField -> login
		[self loginClick];
		return YES;
	}
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self.navigationController setToolbarHidden:YES animated:animated];
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.selectFoldersButton setEnabled:YES];
}


-(void)failedLoginWithMessage:(NSString*)message {
	self.serverMessage.text = message;
	[self.activityIndicator stopAnimating];
	[self.activityIndicator setHidden:YES];	
	[self.selectFoldersButton setEnabled:YES];
}

-(void)doLogin:(NSNumber*)forceSelectFolders {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSString* username = self.usernameField.text;
	NSString* password = self.passwordField.text;
	NSString* server = GMAIL_SERVER;
	int encryption = GMAIL_CONNECTION_TYPE;
	int port = GMAIL_PORT;
	int authentication = GMAIL_AUTH_TYPE;
	
	if(![StringUtil stringContains:username subString:@"@"]) {
		username = [NSString stringWithFormat:@"%@@gmail.com", username];
	}
	
	NSLog(@"Logging in with user %@", username);
	
	NSMutableArray* folderNames = [[[NSMutableArray alloc] initWithCapacity:20] autorelease];
	NSString* response = [ImapSync validate:username password:password server:GMAIL_SERVER port:GMAIL_PORT encryption:GMAIL_CONNECTION_TYPE authentication:GMAIL_AUTH_TYPE folders:folderNames]; 
	
	if([StringUtil stringContains:response subString:@"Parse error"]) {
		[[Reachability sharedReachability] setHostName:server];
		NetworkStatus status =[[Reachability sharedReachability] remoteHostStatus];
		if(status == NotReachable) {
			response = NSLocalizedString(@"Email server unreachable", nil);
		} else if(status == ReachableViaCarrierDataNetwork) {
			response = NSLocalizedString(@"Error connecting to server. Try over Wifi.", nil);
		} else {
			response = NSLocalizedString(@"Error connecting to server.", nil);
		}
	} else if([StringUtil stringContains:response subString:CTLoginErrorDesc]) {
		response = NSLocalizedString(@"Wrong username or password.", nil);
	}
	
	if([response isEqualToString:@"OK"]) { 
		NSDictionary* localConfig = @{@"username": username,
								@"password": password,
								@"server": server,
								@"encryption": @(encryption),
								@"port": @(port),
								@"authentication": @(authentication),
								@"folderNames": folderNames};
		
		if(self.newAccount || [forceSelectFolders boolValue]) {
			[self performSelectorOnMainThread:@selector(showFolderSelect:) withObject:localConfig waitUntilDone:NO];
		} else {
			[self performSelectorOnMainThread:@selector(saveSettings:) withObject:localConfig waitUntilDone:NO];
		}
				
	} else {
		[self performSelectorOnMainThread:@selector(failedLoginWithMessage:) withObject:response waitUntilDone:NO];
	}
	[pool release];
}

-(BOOL)accountExists:(NSString*)username server:(NSString*)server {
	for(int i = 0; i < [AppSettings numAccounts]; i++) {
		if([AppSettings accountDeleted:i]) {
			continue;
		}
		
		if([[AppSettings server:i] isEqualToString:server] && [[AppSettings username:i] isEqualToString:username]) {
			return YES;
		}
	}
	
	return NO;
}

-(IBAction)loginClick {
	[self backgroundClick]; // to deactivate all keyboards
	
	// check if account already exists
	if(self.newAccount) {
		NSString* username = self.usernameField.text;
		//TODO(gabor): need to extract and prettify this
		if(![StringUtil stringContains:username subString:@"@"]) {
			username = [NSString stringWithFormat:@"%@@gmail.com", username];
		}
		NSString* server = GMAIL_SERVER;
		
		if([self accountExists:username server:server]) {
			UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Account Exists",nil) message:NSLocalizedString(@"reMail already has an account for this username/server combination", nil) delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
			[alertView show];
			[alertView release];
			return;
		}
	}
	
	self.serverMessage.text = NSLocalizedString(@"Validating login ...", nil);
	[self.activityIndicator setHidden:NO];	
	[self.activityIndicator startAnimating];
	
	NSThread *driverThread = [[NSThread alloc] initWithTarget:self selector:@selector(doLogin:) object:@NO];
	[driverThread start];
	[driverThread release];
}


-(IBAction)backgroundClick {
	[self.usernameField resignFirstResponder];
	[self.passwordField resignFirstResponder];
}

-(IBAction)selectFoldersClicked {
	[self.selectFoldersButton setEnabled:NO];
	[self.usernameField resignFirstResponder];
	[self.passwordField resignFirstResponder];
	
	[self.activityIndicator setHidden:NO];	
	[self.activityIndicator startAnimating];
	
	NSThread *driverThread = [[NSThread alloc] initWithTarget:self selector:@selector(doLogin:) object:@YES];
	[driverThread start];
	[driverThread release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
	NSLog(@"GmailConfig received memory warning");
}
@end

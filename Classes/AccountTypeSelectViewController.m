//
//  AccountTypeSelectViewController.m
//  MyMail
//
//

#import "AppSettings.h"
#import "AccountTypeSelectViewController.h"
#import "IntroViewController.h"
#import "GmailConfigViewController.h"
#import "ImapConfigViewController.h"
//#import "StoreViewController.h"
#import "FlexiConfigViewController.h"
#import "CTCoreAccount.h"

@implementation AccountTypeSelectViewController
@synthesize newAccount;
@synthesize accountNum;
@synthesize firstSetup;
@synthesize imapLabel;
@synthesize imapButton;

//@synthesize rackspaceLabel;
//@synthesize rackspaceButton;
//@synthesize buyButton;

BOOL introShown = NO;



//- (void)viewDidUnload {
//	[super viewDidUnload];
//	self.imapLabel = nil;
//	self.imapButton = nil;
//    
////    self.rackspaceLabel = nil;
////	self.rackspaceButton = nil;
////	self.buyButton = nil;
//}


-(IBAction)gmailClicked {
	GmailConfigViewController* vc = [[GmailConfigViewController alloc] initWithNibName:@"GmailConfig" bundle:nil];
	vc.firstSetup = self.firstSetup;
	vc.accountNum = self.accountNum;
	vc.newAccount = YES;
	vc.title = NSLocalizedString(@"Gmail", nil);
	[self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)rackspaceClicked {
	FlexiConfigViewController* vc = [[FlexiConfigViewController alloc] initWithNibName:@"FlexiConfig" bundle:nil];
	vc.firstSetup = self.firstSetup;
	vc.accountNum = self.accountNum;
	vc.newAccount = YES;
	vc.title = NSLocalizedString(@"Rackspace", nil);
	vc.usernamePromptText = NSLocalizedString(@"Rackspace email address:", nil);
	
	vc.server = @"secure.emailsrvr.com";
	vc.port = 993;
	vc.authType = IMAP_AUTH_TYPE_PLAIN;
	vc.encryption = CONNECTION_TYPE_TLS;
	
	[self.navigationController pushViewController:vc animated:YES];
}

-(IBAction)imapClicked {
	ImapConfigViewController* vc = [[ImapConfigViewController alloc] initWithNibName:@"ImapConfig" bundle:nil];
	vc.firstSetup = self.firstSetup;
	vc.accountNum = self.accountNum;
	vc.newAccount = self.newAccount;
	vc.title = NSLocalizedString(@"IMAP", nil);
	[self.navigationController pushViewController:vc animated:YES];
	
}

//-(IBAction)buyClick {
//	StoreViewController* vc = [[StoreViewController alloc] initWithNibName:@"Store" bundle:nil];
//	vc.title = NSLocalizedString(@"reMail Store", nil);
//	[self.navigationController pushViewController:vc animated:YES];
//	[vc release];
//}

-(void)dismissIntro {
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated {
//	if(introShown) {
//		return;
//	}
//	if(self.firstSetup) {
//		IntroViewController *introVC = [[IntroViewController alloc] initWithNibName:@"Intro" bundle:nil];
//		introVC.dismissDelegate = self;
//		
//		[self presentViewController:introVC animated:NO completion:nil];
//	}
//	
//	introShown = YES;
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	// This is what pay us not to do :-)
//	if(![AppSettings featurePurchased:@"RM_RACKSPACE"]) {
//		[self.rackspaceLabel setHidden:YES];
//		[self.rackspaceButton setHidden:YES];
//	} else {
//		[self.rackspaceLabel setHidden:NO];
//		[self.rackspaceButton setHidden:NO];
//	}

	if(![AppSettings featurePurchased:@"RM_IMAP"]) {
		[self.imapLabel setHidden:YES];
		[self.imapButton setHidden:YES];
	} else {
		[self.imapLabel setHidden:NO];
		[self.imapButton setHidden:NO];
		
//		[self.buyButton setHidden:YES];
	}
	
	[self.navigationController setToolbarHidden:YES animated:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"Account Type", nil);
    
    ImapConfigViewController* vc = [[ImapConfigViewController alloc] initWithNibName:@"ImapConfig" bundle:nil];
	vc.firstSetup = self.firstSetup;
	vc.accountNum = self.accountNum;
	vc.newAccount = self.newAccount;
	vc.title = NSLocalizedString(@"IMAP", nil);
	[self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
@end

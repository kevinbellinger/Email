//
//  SettingsListViewController.m
//  MyMail
//

//
#import "AppSettings.h"
#import "AccountTypeSelectViewController.h"
#import "SettingsListViewController.h"
#import "ImapConfigViewController.h"
#import "GmailConfigViewController.h"
#import "AboutViewController.h"
#import "PastQuery.h"
#import "GlobalDBFunctions.h"
#import "UpsellViewController.h"
#import "WebViewController.h"
#import "PushSetupViewController.h"
#import "StoreViewController.h"

#define MULTI_ACCOUNT_LIMIT 10

@implementation SettingsListViewController
@synthesize accountIndices;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 90) {
        if (buttonIndex == 1) {
            [PastQuery clearAll];
        }
    } else {
        [GlobalDBFunctions deleteAllAttachments];
    }
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch(section) {
		case 0:
			return [self.accountIndices count];
		case 1:
			return 1;
		case 2:
			return 2;
		case 3:
			return 1;
		case 4:
			return 2;
		default:
			return 0;
	}
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch(section) {
		case 0:
			return NSLocalizedString(@"Email Accounts", nil);
		case 1:
			return @"";
		case 2:
			return NSLocalizedString(@"Clear Data", nil);
		case 3:
			return NSLocalizedString(@"Reminders", nil);
		case 4:
			return @"reMail";
		default:
			return @"";
	}
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return UITableViewCellEditingStyleDelete;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	if(indexPath.section == 0) {
		int index = [(self.accountIndices)[indexPath.row] intValue];
		cell.showsReorderControl = YES;
		cell.textLabel.text = [AppSettings username:index];
		if([[AppSettings server:index] isEqualToString:@"imap.gmail.com"]) {
			cell.imageView.image = [UIImage imageNamed:@"settingsAccountGmailIcon.png"];
		} else if([[AppSettings server:index] isEqualToString:@"secure.emailsrvr.com"]) {
			cell.imageView.image = [UIImage imageNamed:@"settingsAccountRackspaceIcon.png"];
		} else {
			cell.imageView.image = [UIImage imageNamed:@"settingsAccountImapIcon.png"];
		}
	} else if(indexPath.section == 1) {
		cell.textLabel.text = NSLocalizedString(@"Add Account ...", nil);
		cell.imageView.image = [UIImage imageNamed:@"settingsAddAccountIcon.png"];
	} else if(indexPath.section == 2) {
		cell.imageView.image = nil;
		if(indexPath.row == 0) {
			cell.textLabel.text = NSLocalizedString(@"Clear Search History", nil);
		} else {
			cell.textLabel.text = NSLocalizedString(@"Clear Attachment Cache", nil);
		}
	} else if(indexPath.section == 3) {
		cell.imageView.image = [UIImage imageNamed:@"pushIcon.png"];
		cell.textLabel.text = NSLocalizedString(@"Set up Sync Reminders", nil);
	} else {
		if(indexPath.row == 0) {
			cell.textLabel.text = NSLocalizedString(@"Support / Feedback", nil);
			cell.imageView.image = [UIImage imageNamed:@"settingsSupport.png"];
		} else {
			cell.textLabel.text = NSLocalizedString(@"About MyMail", nil);
			cell.imageView.image = [UIImage imageNamed:@"Icon.png"];
		}
	}
	
    return cell;
}

-(void)doLoad {
	NSMutableArray* y = [NSMutableArray arrayWithCapacity:[AppSettings numAccounts]];
	
	for(int i = 0; i < [AppSettings numAccounts]; i++) {
		if([AppSettings accountDeleted:i]) {
			continue;
		}
		
		[y addObject:@(i)];
	}
	
	self.accountIndices = y;
}

-(void)viewWillAppear:(BOOL)animated {
	self.title = NSLocalizedString(@"Settings", nil);
	
	[self doLoad];
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	[self.navigationController setToolbarHidden:NO animated:animated];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// deselect
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if(indexPath.section == 1) {
		// Add Account
		AccountTypeSelectViewController* vc = [[AccountTypeSelectViewController alloc] initWithNibName:@"AccountTypeSelect" bundle:nil];
		vc.firstSetup = NO;
		vc.newAccount = YES;
		vc.accountNum = [AppSettings numAccounts];
		
		vc.title = NSLocalizedString(@"Select New Account Type", nil);
		[self.navigationController pushViewController:vc animated:YES];
		[vc release];
	} else if (indexPath.section == 2) {
		// Clear Data
		if(indexPath.row == 0) {
			// Search History
//			ClearAttachmentsDelegate* d = [[ClearSearchHistoryDelegate alloc] init];
			UIAlertView* av = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Clear Search History?",nil)
														 message:NSLocalizedString(@"This will clear all the items in your search history.", nil) 
														 delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] autorelease];
            av.tag = 90;
			[av show];
		} else {
			UIAlertView* av = [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Clear Attachments?",nil)
														 message:NSLocalizedString(@"This will delete all attachments downloaded to reMail.", nil) 
														delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] autorelease];
			[av show];
		}		
	} else if (indexPath.section == 3) {
		PushSetupViewController* vc = [[PushSetupViewController alloc] initWithNibName:@"PushSetup" bundle:nil];
		vc.title = NSLocalizedString(@"Reminders", nil);
		vc.toolbarItems = [self.toolbarItems subarrayWithRange:NSMakeRange(0, 2)];
		[self.navigationController pushViewController:vc animated:YES];
		[vc release];
	} else if (indexPath.section == 4) {
		if(indexPath.row == 0) {
			if ([MFMailComposeViewController canSendMail]) {
				MFMailComposeViewController *mailCtrl = [[MFMailComposeViewController alloc] init];
				mailCtrl.mailComposeDelegate = self;
				
				NSString* body = [NSString stringWithFormat:@"(Your Feedback here)\n\n\nUDID: %@", [AppSettings udid]];
				
				//TODO(you): change this to your support email address
				[mailCtrl setToRecipients:@[@"support@yourcompany.com"]];
				[mailCtrl setMessageBody:body isHTML:NO];
				[mailCtrl setSubject:@"reMail Feedback"];
				
				[self presentViewController:mailCtrl animated:YES completion:nil];
				[mailCtrl release];
			} else {
				WebViewController* vc = [[WebViewController alloc] init];
				vc.title = NSLocalizedString(@"Love reMail?",nil);
				vc.serverUrl = [NSString stringWithFormat:NSLocalizedString(@"http://www.ljapps.com?lang=en&edition=%i", nil), 
								(int)[AppSettings reMailEdition]];
				vc.toolbarItems = [self.toolbarItems subarrayWithRange:NSMakeRange(0, 2)];
				[self.navigationController pushViewController:vc animated:YES];
				[vc release];
				[self.navigationController setNavigationBarHidden:NO animated:YES];
			}
		} else {
			AboutViewController* vc = [[AboutViewController alloc] initWithNibName:@"About" bundle:nil];
			
			vc.title = NSLocalizedString(@"About reMail", nil);
			vc.toolbarItems = [self.toolbarItems subarrayWithRange:NSMakeRange(0, 2)];
			[self.navigationController pushViewController:vc animated:YES];
			[vc release];
		}
	} else if (indexPath.section == 0) {
		int accountNum = [(self.accountIndices)[indexPath.row] intValue];
		
		ImapConfigViewController* vc = [[ImapConfigViewController alloc] initWithNibName:@"ImapConfig" bundle:nil];
		vc.accountNum = accountNum;
		vc.firstSetup = NO;
		vc.newAccount = NO;
		vc.title = NSLocalizedString(@"Edit Account", nil);
		[self.navigationController pushViewController:vc animated:YES];
		[vc release];
	}
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
	if(indexPath.section == 0) {
		return YES;
	}
	
    return NO; // "Add Account" button
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO(gabor): Potentially delete all emails for this account on the device. Or at least ask for it.
		
	// Delete the row from the data source
	int index = [(self.accountIndices)[indexPath.row] intValue];	
	[self.accountIndices removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
	
	// "Delete" account	
	[AppSettings setAccountDeleted:YES accountNum:index];
	[AppSettings setPassword:@"" accountNum:index];

	// stop showing edit button if there are no more accounts
	if([self.accountIndices count] == 0) {
		self.navigationItem.rightBarButtonItem = nil;
	}
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissViewControllerAnimated:YES completion:nil];
	
	return;
}
@end


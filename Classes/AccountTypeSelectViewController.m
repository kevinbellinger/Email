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
#import "FlexiConfigViewController.h"
#import "CTCoreAccount.h"

@interface AccountTypeSelectViewController(){
    
}

@property(nonatomic, strong) GmailConfigViewController *gmail;
@property(nonatomic, strong) ImapConfigViewController *imap;
@property(nonatomic, strong) FlexiConfigViewController *flexi;

@end

@implementation AccountTypeSelectViewController
@synthesize newAccount;
@synthesize accountNum;
@synthesize firstSetup;
@synthesize gmail, imap, flexi;

BOOL introShown = NO;

-(IBAction)gmailClicked {
	gmail = [[GmailConfigViewController alloc] initWithNibName:@"GmailConfig" bundle:nil];
	gmail.firstSetup = self.firstSetup;
	gmail.accountNum = self.accountNum;
	gmail.newAccount = YES;
	gmail.title = NSLocalizedString(@"Gmail", nil);
	[self.navigationController pushViewController:gmail animated:YES];
}

-(IBAction)rackspaceClicked {
	flexi = [[FlexiConfigViewController alloc] initWithNibName:@"FlexiConfig" bundle:nil];
	flexi.firstSetup = self.firstSetup;
	flexi.accountNum = self.accountNum;
	flexi.newAccount = YES;
	flexi.title = NSLocalizedString(@"Rackspace", nil);
	flexi.usernamePromptText = NSLocalizedString(@"Rackspace email address:", nil);
	
	flexi.server = @"secure.emailsrvr.com";
	flexi.port = 993;
	flexi.authType = IMAP_AUTH_TYPE_PLAIN;
	flexi.encryption = CONNECTION_TYPE_TLS;
	
	[self.navigationController pushViewController:flexi animated:YES];
}

-(IBAction)imapClicked {
	imap = [[ImapConfigViewController alloc] initWithNibName:@"ImapConfig" bundle:nil];
	imap.firstSetup = self.firstSetup;
	imap.accountNum = self.accountNum;
	imap.newAccount = self.newAccount;
	imap.title = NSLocalizedString(@"IMAP", nil);
	[self.navigationController pushViewController:imap animated:YES];
	
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setToolbarHidden:YES animated:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = NSLocalizedString(@"Account Type", nil);

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
    gmail = nil;
    flexi = nil;
    imap = nil;
	}
@end

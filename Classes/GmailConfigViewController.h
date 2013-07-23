//
//  GmailConfigViewController.h
//  GmailConfig
//
//  Created by Liangjun Jiang on 3/22/09.
//  Copyright LJApps Inc.

#import <UIKit/UIKit.h>

@interface GmailConfigViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
	IBOutlet UIScrollView* scrollView;
	
	IBOutlet UILabel* serverMessage;
	IBOutlet UIActivityIndicatorView* activityIndicator;
	IBOutlet UITextField* usernameField;
	IBOutlet UITextField* passwordField;
	IBOutlet UIButton* selectFoldersButton;
	
	IBOutlet UILabel* privacyNotice;
	
	int accountNum;
	BOOL newAccount;
	BOOL firstSetup;
}

-(IBAction)loginClick;
-(IBAction)backgroundClick;
-(IBAction)selectFoldersClicked;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;
@property (nonatomic, strong) IBOutlet UILabel* serverMessage;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (nonatomic, strong) IBOutlet UITextField* usernameField;
@property (nonatomic, strong) IBOutlet UITextField* passwordField;
@property (nonatomic, strong) IBOutlet UIButton* selectFoldersButton;
@property (nonatomic, strong) IBOutlet UILabel* privacyNotice;
@property (assign) int accountNum;
@property (assign) BOOL newAccount;
@property (assign) BOOL firstSetup;
@end


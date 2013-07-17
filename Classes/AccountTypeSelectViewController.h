//
//  AccountTypeSelectViewController.h
//  MyMail
//
//  Created by Liangjun Jiang on 7/15/09.

//

#import <UIKit/UIKit.h>


@interface AccountTypeSelectViewController : UIViewController {
	BOOL firstSetup;
	BOOL showIntro;
	BOOL newAccount;
	int accountNum;	
	
//	IBOutlet UILabel* rackspaceLabel;
//	IBOutlet UIButton* rackspaceButton;

//    UILabel* imapLabel;
//	UIButton* imapButton;
	
//	IBOutlet UIButton* buyButton;
}

@property (assign) BOOL firstSetup;
@property (assign) BOOL newAccount;
@property (assign) int accountNum;

//@property (nonatomic,retain) UILabel* rackspaceLabel;
//@property (nonatomic,retain) UIButton* rackspaceButton;
@property (nonatomic,weak) IBOutlet UILabel* imapLabel;
@property (nonatomic,weak) IBOutlet UIButton* imapButton;
//@property (nonatomic,retain) UIButton* buyButton;

//-(IBAction)gmailClicked;
//-(IBAction)rackspaceClicked;
//-(IBAction)imapClicked;
//-(IBAction)buyClick;
@end

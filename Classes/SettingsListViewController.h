//
//  SettingsListViewController.h
//  MyMail

//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SettingsListViewController : UITableViewController <MFMailComposeViewControllerDelegate,  UIAlertViewDelegate> {
	NSMutableArray* accountIndices; // stores the indices of non-deleted accounts
}

@property (nonatomic, retain) NSMutableArray* accountIndices;
@end

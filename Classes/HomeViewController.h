//
//  HomeViewController.h
//  Displays home screen to user, manages toolbar UI and responds to sync status updates
//
//  Created by Liangjun Jiang on 1/22/09.
//  Copyright LJApps Inc.
//  

#import <UIKit/UIKit.h>
#import "MailboxViewController.h"
#import "SearchEntryViewController.h"

@interface HomeViewController : UIViewController{
	IBOutlet UIButton* clientMessageButton;
	
	NSString* clientMessage;
	NSString* errorDetail;
}

-(void)loadIt;
//-(IBAction)accountListClick:(id)sender;
//-(IBAction)searchClick:(id)sender;
//-(IBAction)foldersClick:(id)sender;
-(IBAction)toolbarStatusClicked:(id)sender;
-(IBAction)toolbarRefreshClicked:(id)sender;
-(IBAction)clientMessageClick;
//-(IBAction)usageClick:(id)sender;
-(void)didChangeClientMessageTo:(id)object;

@property (nonatomic, strong) UIButton* clientMessageButton;
@property (nonatomic, strong) NSString* clientMessage;
@property (nonatomic, strong) NSString* errorDetail;
@end


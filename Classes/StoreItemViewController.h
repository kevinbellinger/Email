//
//  StoreItemViewController.h
//  MyMail
//
//
//  Note: This code isn't used anymore. We kept it in the project because you might
//        find it useful for implementing your own in-app stores.

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface StoreItemViewController : UIViewController {
	SKProduct* product;
	
	IBOutlet UILabel* productTitleLabel;
	IBOutlet UILabel* productDescriptionLabel;
	IBOutlet UIImageView* productImageView;
	IBOutlet UIButton* buyButton;
	IBOutlet UILabel* recommendLabel;
	IBOutlet UIButton* recommendButton;	
	
	IBOutlet UIActivityIndicatorView* activityIndicator;
}

@property (nonatomic, retain) SKProduct* product;
@property (nonatomic, retain) IBOutlet UILabel* productTitleLabel;
@property (nonatomic, retain) IBOutlet UILabel* productDescriptionLabel;
@property (nonatomic, retain) IBOutlet UIImageView* productImageView;
@property (nonatomic, retain) IBOutlet UIButton* buyButton;
@property (nonatomic, retain) IBOutlet UILabel* recommendLabel;
@property (nonatomic, retain) IBOutlet UIButton* recommendButton;	
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView* activityIndicator;


-(IBAction)purchase;
-(IBAction)recommend;
@end

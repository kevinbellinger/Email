//
//  StoreViewController.h
//  MyMail
//
//
//  Note: This code isn't used anymore. We kept it in the project because you might
//        find it useful for implementing your own in-app stores.

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface StoreViewController : UITableViewController <SKProductsRequestDelegate> {
	NSArray *products;
}

@property (nonatomic,retain) NSArray *products;
@end

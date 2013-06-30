//
//  StoreItemCell.h
//  MyMail
//
//  Note: This code isn't used anymore. We kept it in the project because you might
//        find it useful for implementing your own in-app stores.

#import <UIKit/UIKit.h>


@interface StoreItemCell : UITableViewCell {
	IBOutlet UILabel *titleLabel;
	IBOutlet UILabel *priceLabel;
	IBOutlet UIImageView *productIcon;
	IBOutlet UIImageView *purchasedIcon;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UIImageView *productIcon;
@property (nonatomic, retain) UIImageView *purchasedIcon;
@end

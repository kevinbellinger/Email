//
//  PushSetupViewController.h
//  MyMail
//
//  Created by Liangjun Jiang on 10/22/09.
//  Copyright 2010 Google Inc.
//  

//

#import <UIKit/UIKit.h>


@interface PushSetupViewController : UIViewController {
	IBOutlet UIButton* disableButton;
	IBOutlet UIButton* okButton;

	IBOutlet UIDatePicker* timePicker;

	IBOutlet UILabel* remindDescriptionLabel;
	IBOutlet UILabel* remindTitleLabel;
	
	IBOutlet UIActivityIndicatorView* activityIndicator;
}

@property (nonatomic,retain) UIButton* disableButton;
@property (nonatomic,retain) UIButton* okButton;

@property (nonatomic,retain) UIDatePicker* timePicker;

@property (nonatomic,retain) UILabel* remindDescriptionLabel;
@property (nonatomic,retain) UILabel* remindTitleLabel;

@property (nonatomic,retain) UIActivityIndicatorView* activityIndicator;


-(IBAction)disableClicked;
-(IBAction)okClicked;

@end

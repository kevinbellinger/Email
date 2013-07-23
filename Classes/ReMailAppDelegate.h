//
//  NextMailAppDelegate.h
//  NextMail iPhone Application
//
//  Created by Liangjun Jiang on 1/16/09.
//  Copyright LJApps Inc.
//  

//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@class ReMailViewController;

@interface ReMailAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
	id pushSetupScreen;
}

//-(void)pingHome;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) id pushSetupScreen;
@end


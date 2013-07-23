//
//  FlexiConfigViewController.h
//  FlexiConfig
//
//  Created by Liangjun Jiang on 3/22/09.
//  Copyright LJApps Inc.
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//   http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <UIKit/UIKit.h>

@interface FlexiConfigViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
	IBOutlet UIScrollView* scrollView;
	
	IBOutlet UILabel* serverMessage;
	IBOutlet UIActivityIndicatorView* activityIndicator;
	IBOutlet UITextField* usernameField;
	IBOutlet UITextField* passwordField;
	
	IBOutlet UILabel* usernamePrompt;
	IBOutlet UILabel* passwordPrompt;
	IBOutlet UIButton* checkAndSaveButton;
	
	int accountNum;
	BOOL newAccount;
	BOOL firstSetup;
	
	NSString* usernamePromptText;
	
	NSString* server;
	int encryption;
	int port;
	int authType;
}

-(IBAction)loginClick;
-(IBAction)backgroundClick;

@property (nonatomic, strong) IBOutlet UIScrollView* scrollView;
@property (nonatomic, strong) IBOutlet UILabel* serverMessage;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (nonatomic, strong) IBOutlet UITextField* usernameField;
@property (nonatomic, strong) IBOutlet UITextField* passwordField;

@property (nonatomic, strong) IBOutlet UILabel* usernamePrompt;
@property (nonatomic, strong) IBOutlet UILabel* passwordPrompt;
@property (nonatomic, strong) IBOutlet UIButton* checkAndSaveButton;

@property (assign) int accountNum;
@property (assign) BOOL newAccount;
@property (assign) BOOL firstSetup;

@property (nonatomic, strong) NSString* usernamePromptText;

@property (nonatomic, strong) NSString* server;
@property (assign) int encryption;
@property (assign) int port;
@property (assign) int authType;

@end


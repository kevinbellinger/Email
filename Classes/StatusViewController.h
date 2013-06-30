//
//  StatusViewController.h
//  MyMail
//
//  Created by Liangjun Jiang on 6/26/09.
//  Copyright 2010 Google Inc.
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


@interface StatusViewController : UIViewController {
	IBOutlet UILabel* totalEmailLabel;
	IBOutlet UILabel* onDeviceEmailLabel;
	IBOutlet UILabel* estimatedTimeLabel;
	IBOutlet UILabel* freeSpaceLabel;
	IBOutlet UILabel* fileSizeLabel;
	IBOutlet UILabel* attachmentsFileSizeLabel;
	IBOutlet UILabel* estimatedFileSizeLabel;
	
	IBOutlet UILabel* versionLabel;
	
	NSDate* startTime;
}

@property (nonatomic,strong) UILabel* attachmentsFileSizeLabel;
@property (nonatomic,strong) UILabel* fileSizeLabel;
@property (nonatomic,strong) UILabel* estimatedFileSizeLabel;
@property (nonatomic,strong) UILabel* estimatedTimeLabel;
@property (nonatomic,strong) UILabel* freeSpaceLabel;
@property (nonatomic,strong) UILabel* totalEmailLabel;
@property (nonatomic,strong) UILabel* onDeviceEmailLabel;
@property (nonatomic,strong) UILabel* versionLabel;
@property (nonatomic,strong) NSDate* startTime;

-(void)didChangeProgressNumbersTo:(NSDictionary*)dict;
@end

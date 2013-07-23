//
//  MailItemCell.h
//  ConversationsPrototype
//
//  Created by Liangjun Jiang on 1/23/09.
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
//#import "Three20/Three20.h"

@interface MailItemCell : UITableViewCell {
	IBOutlet UILabel* senderLabel;
	IBOutlet UILabel* sideNoteLabel;
	IBOutlet UILabel* dateLabel;
	IBOutlet UILabel* dateDetailLabel;
	IBOutlet UIButton* showDetailsButton;
	id __weak showDetailsDelegate;
	IBOutlet UIImageView* senderBubbleImage;
	NSNumber* convoIndex;
//	TTStyledTextLabel *theBodyLabel;
    UILabel *theBodyLabel;
}

-(void)setupText;
-(void)setText:(NSString*)string;
-(IBAction)showDetailsClicked;

@property (nonatomic,strong) UILabel* senderLabel;
@property (nonatomic,strong) UILabel* sideNoteLabel;
@property (nonatomic,strong) UILabel* dateLabel;
@property (nonatomic,strong) UILabel* dateDetailLabel;
@property (nonatomic,strong) UIButton* showDetailsButton;
@property (nonatomic,strong) UIImageView* senderBubbleImage;
@property (nonatomic,strong) NSNumber* convoIndex;
@property (nonatomic,weak) id showDetailsDelegate; // don't retain or the ConvoViewController will be retained forever!
//@property (nonatomic,assign) TTStyledTextLabel *theBodyLabel;
@property (nonatomic,strong) UILabel *theBodyLabel;

@end

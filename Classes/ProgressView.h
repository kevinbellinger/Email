//
//  ProgressView.h
//  MyMail
//
//  Created by Liangjun Jiang on 3/16/09.
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


@interface ProgressView : UIView {
	IBOutlet UILabel* progressLabel;
	IBOutlet UIProgressView* progressView;
	IBOutlet UIActivityIndicatorView* activity;

	IBOutlet UILabel* updatedLabel;
	IBOutlet UILabel* updatedLabelTop;
	IBOutlet UILabel* clientMessageLabelBottom;

}

@property(nonatomic,strong) UILabel* progressLabel;
@property(nonatomic,strong) UILabel* updatedLabel;
@property(nonatomic,strong) UIProgressView* progressView;
@property(nonatomic,strong) UIActivityIndicatorView* activity; 
@property(nonatomic,strong) UILabel* updatedLabelTop;
@property(nonatomic,strong) UILabel* clientMessageLabelBottom;

@end

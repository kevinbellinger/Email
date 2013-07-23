//
//  DateUtil.h
//  MyMail
//
//  Created by Liangjun Jiang on 3/17/09.
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

#import <Foundation/Foundation.h>


@interface DateUtil : NSObject {
	NSDate *today;
	NSDate *yesterday;
	NSDate *lastWeek;
	
	NSDateFormatter* dateFormatter;
	NSDateComponents* todayComponents;
	NSDateComponents* yesterdayComponents;
}

@property (nonatomic, strong) NSDate *today;
@property (nonatomic, strong) NSDate *yesterday;
@property (nonatomic, strong) NSDate *lastWeek;
@property (nonatomic, strong) NSDateFormatter* dateFormatter;
@property (nonatomic, strong) NSDateComponents* todayComponents;
@property (nonatomic, strong) NSDateComponents* yesterdayComponents;


+(id)getSingleton;
-(NSString*)humanDate:(NSDate*)date;
+(NSDate *)datetimeInLocal:(NSDate *)utcDate;
@end

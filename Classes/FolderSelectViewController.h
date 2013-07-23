//
//  FolderSelectViewController.h
//  MyMail
//
//  Created by Liangjun Jiang on 7/15/09.
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


@interface FolderSelectViewController : UITableViewController {
	NSArray* folderPaths;
	NSDictionary* utf7Decoder;
	NSMutableSet* folderSelected;
	
	NSString* username;
	NSString* password;
	NSString* server;
	
	int encryption;
	int port;
	int authentication;
	
	int firstSetup;
	int accountNum;
	BOOL newAccount;
}

@property (nonatomic, strong) NSDictionary* utf7Decoder;
@property (nonatomic, strong) NSArray* folderPaths;
@property (nonatomic, strong) NSMutableSet* folderSelected;

@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* server;

@property (assign) int encryption;
@property (assign) int port;
@property (assign) int authentication;

@property (assign) int firstSetup;
@property (assign) int accountNum;
@property (assign) BOOL newAccount;
@end

//
//  GlobalDBFunctions.h
//  MyMail
//
//  Created by Gabor Cselle on 6/29/09.
//  Copyright 2013 LJApps Inc. All rights reserved.
//

// Functions that go beyond a single database

#import <Foundation/Foundation.h>


@interface GlobalDBFunctions : NSObject {

}

+(void)tableCheck;
+(void)deleteAll;
+(NSString*)addDBFilename;
+(NSString*)dbFileNameForNum:(int)dbNum;
+(NSArray*)emailDBNumbers;
+(NSArray*)emailDBNames;
+(int)highestDBNum;
+(BOOL)enoughFreeSpaceForSync;
+(unsigned long long)freeSpaceOnDisk;
+(unsigned long long)totalFileSize;
+(unsigned long long)totalAttachmentsFileSize;

+(void)deleteAllAttachments;
+(void)deleteAll;
@end

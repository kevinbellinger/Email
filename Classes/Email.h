//
//  Email.h
//  MyMail
//

//

#import <Foundation/Foundation.h>	

@interface Email : NSObject {
	int pk;
	NSString* senderName;
	NSString* senderAddress;
	
	NSString* tos;
	NSString* ccs;
	NSString* bccs;
	
	NSDate* datetime;
	
	NSString* msgId;
	
	NSString* attachments;
	
	NSString* folder;
	int folderNum;
	NSString* uid;
	
	NSString* subject;
	NSString* body;
	NSString* metaString;
}

@property (assign) int pk;
@property (nonatomic,readwrite,retain) NSString* senderName;
@property (nonatomic,readwrite,retain) NSString* senderAddress;

@property (nonatomic,readwrite,retain) NSString* tos;
@property (nonatomic,readwrite,retain) NSString* ccs;
@property (nonatomic,readwrite,retain) NSString* bccs;

@property (nonatomic,readwrite,retain) NSDate* datetime;

@property (nonatomic,readwrite,retain) NSString* msgId;

@property (nonatomic,readwrite,retain) NSString* attachments;

@property (nonatomic,readwrite,retain) NSString* folder;
@property (assign) int folderNum;
@property (nonatomic,readwrite,retain) NSString* uid;

@property (nonatomic,readwrite,retain) NSString* subject;
@property (nonatomic,readwrite,retain) NSString* body;
@property (nonatomic,readwrite,retain) NSString* metaString;

+(void)tableCheck;
+(void)deleteWithPk:(int)pk;
-(void)loadData:(int)pkToLoad;
-(BOOL)hasAttachment;
@end





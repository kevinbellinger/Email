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
@property (nonatomic,readwrite,strong) NSString* senderName;
@property (nonatomic,readwrite,strong) NSString* senderAddress;

@property (nonatomic,readwrite,strong) NSString* tos;
@property (nonatomic,readwrite,strong) NSString* ccs;
@property (nonatomic,readwrite,strong) NSString* bccs;

@property (nonatomic,readwrite,strong) NSDate* datetime;

@property (nonatomic,readwrite,strong) NSString* msgId;

@property (nonatomic,readwrite,strong) NSString* attachments;

@property (nonatomic,readwrite,strong) NSString* folder;
@property (assign) int folderNum;
@property (nonatomic,readwrite,strong) NSString* uid;

@property (nonatomic,readwrite,strong) NSString* subject;
@property (nonatomic,readwrite,strong) NSString* body;
@property (nonatomic,readwrite,strong) NSString* metaString;

+(void)tableCheck;
+(void)deleteWithPk:(int)pk;
-(void)loadData:(int)pkToLoad;
-(BOOL)hasAttachment;
@end





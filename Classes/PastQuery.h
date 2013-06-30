//
//  PastQuery.h
//  MyMail
//
//
//  Represents a query that the user has run in the past.

#import <Foundation/Foundation.h>

@interface PastQuery : NSObject {
	NSDate *datetime;
	NSString *text;
}

+(void)clearAll;
+(void)tableCheck;
+(NSDictionary*)recentQueries;
+(void)recordQuery:(NSString*)queryText withType:(int)type;

@property (nonatomic,readwrite,retain) NSDate *datetime;
@property (nonatomic,readwrite,retain) NSString *text;
@end


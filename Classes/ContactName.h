//
//  Contact.h
//  MyMail
//

//

#import <Foundation/Foundation.h>

@interface ContactName : NSObject {
	NSString* name;
	NSString* addresses;
	NSNumber* occurrences;
}

+(int)contactCount;
+(void)tableCheck;
+(void)recordContact:(NSString*)name withAddress:(NSString*)address;
+(void)autocomplete:(NSString*)query; 

@property(nonatomic,readwrite,retain) NSNumber* occurrences;
@property(nonatomic,readwrite,retain) NSString* name;
@property(nonatomic,readwrite,retain) NSString* addresses;
@end




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

@property(nonatomic,readwrite,strong) NSNumber* occurrences;
@property(nonatomic,readwrite,strong) NSString* name;
@property(nonatomic,readwrite,strong) NSString* addresses;
@end




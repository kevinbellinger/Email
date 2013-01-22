//
//  NSString+StrippingHTML.h
//  ReMailIPhone
//
//  Created by LIANGJUN JIANG on 1/22/13.
//
//
// http://stackoverflow.com/questions/277055/remove-html-tags-from-an-nsstring-on-the-iphone
#import <Foundation/Foundation.h>

@interface NSString (StrippingHTML)

-(NSString *) stringByStrippingHTML;
@end

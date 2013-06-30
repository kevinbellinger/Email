//
//  NSString+StrippingHTML.m
//  MyMail
//
//  Created by LIANGJUN JIANG on 1/22/13.
//
//

#import "NSString+StrippingHTML.h"
#import "StringUtil.h"

@implementation NSString (StrippingHTML)

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}


@end

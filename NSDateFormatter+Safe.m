//
//  NSDateFormatter+Safe.m
//  ReMailIPhone
//
//  Created by LIANGJUN JIANG on 1/11/13.
//
//

#import "NSDateFormatter+Safe.h"

@implementation NSDateFormatter (Safe)

+ (NSDateFormatter *)dateReader
{
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateReader = [dictionary objectForKey:@"SCDateReader"];
    if (!dateReader)
    {
        dateReader = [[[NSDateFormatter alloc] init] autorelease];
        dateReader.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"] autorelease];
        dateReader.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        dateReader.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss Z";
        [dictionary setObject:dateReader forKey:@"SCDateReader"];
    }
    return dateReader;
}

+ (NSDateFormatter *)dateWriter
{
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateWriter = [dictionary objectForKey:@"SCDateWriter"];
    if (!dateWriter)
    {
        dateWriter = [[[NSDateFormatter alloc] init] autorelease];
        dateWriter.locale = [NSLocale currentLocale];
        dateWriter.timeZone = [NSTimeZone defaultTimeZone];
        dateWriter.dateStyle = NSDateFormatterMediumStyle;
        [dictionary setObject:dateWriter forKey:@"SCDateWriter"];
    }
    return dateWriter;
}

@end

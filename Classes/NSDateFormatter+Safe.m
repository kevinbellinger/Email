//
//  NSDateFormatter+Safe.m
//  MyMail
//
//  Created by LIANGJUN JIANG on 1/11/13.
//
//

#import "NSDateFormatter+Safe.h"

@implementation NSDateFormatter (Safe)

+ (NSDateFormatter *)dateReader
{
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateReader = dictionary[@"SCDateReader"];
    if (!dateReader)
    {
        dateReader = [[NSDateFormatter alloc] init];
        dateReader.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateReader.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        dateReader.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss Z";
        dictionary[@"SCDateReader"] = dateReader;
    }
    return dateReader;
}

+ (NSDateFormatter *)dateWriter
{
    NSMutableDictionary *dictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateWriter = dictionary[@"SCDateWriter"];
    if (!dateWriter)
    {
        dateWriter = [[NSDateFormatter alloc] init];
        dateWriter.locale = [NSLocale currentLocale];
        dateWriter.timeZone = [NSTimeZone defaultTimeZone];
        dateWriter.dateStyle = NSDateFormatterMediumStyle;
        dictionary[@"SCDateWriter"] = dateWriter;
    }
    return dateWriter;
}

@end

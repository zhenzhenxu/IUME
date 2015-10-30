//
//  NSDate+Format.m
//  xiwu
//
//  Created by yzk on 14-7-21.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

- (NSString *)stringWithDateFormat:(DateFormat)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
	[dateFormatter setDateFormat:[self formatString:format]];
    NSString * date_time =  [NSString stringWithString:[dateFormatter stringFromDate:self]];
    return date_time;
}

- (NSString *)formatString:(DateFormat)format
{
    NSString *formatString;
    switch (format) {
        case DateFormatWithAll:
            formatString = @"yyyy-MM-dd HH:mm:ss:SS";
            break;
        case DateFormatWithAllOther:
            formatString = @"yyyy-MM-dd HH:mm:ss.SS";
            break;
        case DateFormatWithDateAndTime:
            formatString = @"yyyy-MM-dd HH:mm:ss";
            break;
        case DateFormatWithDateAndMinite:
            formatString = @"yyyy-MM-dd HH:mm";
            break;
        case DateFormatWithTime:
            formatString = @"HH:mm:ss";
            break;
        case DateFormatWithPreciseTime:
            formatString = @"HH:mm:ss:SS";
            break;
        case DateFormatWithYearMonthDay:
            formatString = @"yyyy-MM-dd";
            break;
        case DateFormatWithYearMonthDayOther:
            formatString = @"yyyy年MM月dd日";
            break;
        case DateFormatWithYearMonth:
            formatString = @"yyyy-MM";
            break;
        case DateFormatWithMonthDay:
            formatString = @"MM-dd";
            break;
        case DateFormatWithYear:
            formatString = @"yyyy";
            break;
        case DateFormatWithMonth:
            formatString = @"MM";
            break;
        case DateFormatWithDay:
            formatString = @"dd";
            break;
        
        default:
            break;
    }
    return formatString;
}

- (NSDateComponents *)dateComponents
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//设置成中国阳历
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components = [calendar components:unitFlags fromDate:now];
    return components;
}

@end

@implementation NSString (Format)

- (NSString *)stringConverToDateFormat:(DateFormat)toFormat
                        fromDateFormat:(DateFormat)fromFormat
{
    return [[self dateWithDateFormat:fromFormat] stringWithDateFormat:toFormat];
}

- (NSDate *)dateWithDateFormat:(DateFormat)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
    [dateFormatter setDateFormat:[self formatString:format]];
    NSDate *date = [dateFormatter dateFromString:self];
    
    return date;
}

- (NSString *)formatString:(DateFormat)format
{
    NSString *formatString;
    switch (format) {
        case DateFormatWithAll:
            formatString = @"yyyy-MM-dd HH:mm:ss:SS";
            break;
        case DateFormatWithAllOther:
            formatString = @"yyyy-MM-dd HH:mm:ss.SS";
            break;
        case DateFormatWithDateAndTime:
            formatString = @"yyyy-MM-dd HH:mm:ss";
            break;
        case DateFormatWithDateAndMinite:
            formatString = @"yyyy-MM-dd HH:mm";
            break;
        case DateFormatWithTime:
            formatString = @"HH:mm:ss";
            break;
        case DateFormatWithPreciseTime:
            formatString = @"HH:mm:ss:SS";
            break;
        case DateFormatWithYearMonthDay:
            formatString = @"yyyy-MM-dd";
            break;
        case DateFormatWithYearMonthDayOther:
            formatString = @"yyyy年MM月dd日";
            break;
        case DateFormatWithYearMonth:
            formatString = @"yyyy-MM";
            break;
        case DateFormatWithMonthDay:
            formatString = @"MM-dd";
            break;
        case DateFormatWithYear:
            formatString = @"yyyy";
            break;
        case DateFormatWithMonth:
            formatString = @"MM";
            break;
        case DateFormatWithDay:
            formatString = @"dd";
            break;
            
        default:
            break;
    }
    return formatString;
}

@end

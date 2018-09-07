//
//  NSDate+SUDate.m
//  SmartUtil
//
//  Created by roki on 2017/12/26.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

#import "NSDate+SUDate.h"

@implementation NSDate (SUDate)
+ (NSString *)su_stringFromTimestamp:(NSString *)timestamp format:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue] / 1000.0];
    return [date su_dateToString:format];
}

+ (NSDate *)su_dateFromTimestamp:(NSString *)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue] / 1000.0];
}

+ (NSDate *)su_dateFromString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:dateString];
}

- (NSString *)su_dateToString:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

- (NSInteger )gapDaysCompareTo:(NSDate *)date {
    
    
    NSDateComponents *selfComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:self];
    selfComp.hour = 6;
    NSDate *selfDate = [[NSCalendar currentCalendar] dateFromComponents:selfComp];
    
    
    NSDateComponents *comparedComp = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour fromDate:date];
    comparedComp.hour = 6;
    NSDate *compareDate = [[NSCalendar currentCalendar] dateFromComponents:comparedComp];
    
    
    NSTimeInterval gapSeconds = [selfDate timeIntervalSince1970] - [compareDate timeIntervalSince1970];
    NSInteger gapDays = gapSeconds / (24.0 * 60.0 * 60.0);
    
    return gapDays;
}

- (NSString *)weekend {
    
    NSDateComponents *component = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitWeekday fromDate:self];
    
    NSArray *weekDays = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    NSString *weekend = weekDays[component.weekday - 1];
    
    
    return weekend;
    
    
}
@end

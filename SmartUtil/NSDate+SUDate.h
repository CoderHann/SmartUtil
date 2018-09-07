//
//  NSDate+SUDate.h
//  SmartUtil
//
//  Created by roki on 2017/12/26.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSString *const DateFormatStyleCN = @"yyyy年MM月dd日";
//NSString *const DateFormatStyleCNDetail = @"yyyy-MM-dd HH:mm:ss";

@interface NSDate (SUDate)

/**
 根据时间戳生成对应的时间字符串
 */
+ (NSString *)su_stringFromTimestamp:(NSString *)timestamp format:(NSString *)format;

/**
 根据时间戳生成对应的时间
 */
+ (NSDate *)su_dateFromTimestamp:(NSString *)timestamp;

/**
 根据时间字符生成对应的日期
 */
+ (NSDate *)su_dateFromString:(NSString *)dateString format:(NSString *)format;

/**
 日期对应的字符串
 */
- (NSString *)su_dateToString:(NSString *)format;

/**
 如果date在self之前，返回值是个正数，否则负数
 
 @param date 比较的日期
 @return 天数
 */
- (NSInteger )gapDaysCompareTo:(NSDate *)date;


/**
 周一到周日
 */
- (NSString *)weekend;
@end

//
//  NSString+Util.h
//  SmartUtil
//
//  Created by roki on 2018/5/2.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/**
 根据字体大小和最大矩形算出适合的size
 */
- (CGSize)su_needSizeWithFont:(CGFloat)font maxSize:(CGSize)size;
@end
static inline NSString* su_noBlankString(NSString *string) {
    if (!string || [string isKindOfClass:[NSNull class]]) {
        return @"";
    } else if (![string isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@",string];
    } else {
        return string;
    }
}

static inline BOOL su_isBlankString(NSString *string) {
    if (string && [string isKindOfClass:[NSString class]] && string.length > 0) {
        return NO;
    } else {
        return YES;
    }
}

static inline NSString* su_replaceBlankString(NSString *string, NSString *replaceString) {
    if (su_isBlankString(string)) {
        return replaceString;
    } else {
        return string;
    }
}

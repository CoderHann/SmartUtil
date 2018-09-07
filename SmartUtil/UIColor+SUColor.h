//
//  UIColor+SUColor.h
//  SmartUtil
//
//  Created by roki on 2017/12/24.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SUColor)

/**
 tool for color
 
 @return uicolor
 */
+ (UIColor *)su_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;


/**
 16进制标示颜色，默认alpha 1.0

 @param hex 0xffffff类似的值
 */
+ (UIColor *)su_colorWithHex:(int)hex;

/**
 16进制标示颜色
 
 @param hex 0xffffff类似的值
 */
+ (UIColor *)su_colorWithHex:(int)hex alpha:(CGFloat)alpha;

@end

#pragma mark -Inline

static inline UIColor* su_colorWithHexAlpha(int hex, CGFloat alpha) {
    int red = (hex & 0xff0000) >> 16;
    int green = (hex & 0xff00) >> 8;
    int blue = (hex & 0xff);
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

static inline UIColor* su_colorWithHex(int hex) {
    return su_colorWithHexAlpha(hex, 1.0);
}


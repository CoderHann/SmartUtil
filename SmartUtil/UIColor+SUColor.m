//
//  UIColor+SUColor.m
//  SmartUtil
//
//  Created by roki on 2017/12/24.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

#import "UIColor+SUColor.h"

@implementation UIColor (SUColor)
+ (UIColor *)su_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (UIColor *)su_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(float)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+ (UIColor *)su_colorWithHex:(int)hex {
    
    return [self su_colorWithHex:hex alpha:1.0];
}
+ (UIColor *)su_colorWithHex:(int)hex alpha:(CGFloat)alpha {
    int red = (hex & 0xff0000) >> 16;
    int green = (hex & 0xff00) >> 8;
    int blue = (hex & 0xff);
    
    return [self su_colorWithRed:red green:green blue:blue alpha:alpha];
}

@end

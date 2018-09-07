//
//  UIView+SUConvenience.h
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SUConvenience)

/**
 快速创建line

 @return line
 */
+ (UIView *)lineWithColor:(UIColor *)color;
@end
static inline UIView* su_line(UIColor *color) {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    return line;
}

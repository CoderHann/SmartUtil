//
//  UIView+SUConvenience.m
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIView+SUConvenience.h"

@implementation UIView (SUConvenience)
+ (UIView *)lineWithColor:(UIColor *)color {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = color;
    return line;
}
@end

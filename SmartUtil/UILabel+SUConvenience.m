//
//  UILabel+SUConvenience.m
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UILabel+SUConvenience.h"

@implementation UILabel (SUConvenience)
+ (UILabel *)su_labelWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)algin {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = algin;
    return label;
}
@end

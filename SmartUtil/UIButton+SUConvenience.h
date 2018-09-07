//
//  UIButton+SUConvenience.h
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SUConvenience)

/**
 创建normalstate下的按钮
 */
+ (UIButton *)su_normalButtonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color target:(id)target action:(SEL)action;

+ (UIButton *)su_buttonWithTarget:(id)target action:(SEL)action;
@end

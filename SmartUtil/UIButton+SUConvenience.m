//
//  UIButton+SUConvenience.m
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIButton+SUConvenience.h"

@implementation UIButton (SUConvenience)
+ (UIButton *)su_buttonWithTarget:(nullable id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] init];
    if (target) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}
+ (UIButton *)su_normalButtonWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color target:(nullable id)target action:(SEL)action {
    UIButton *btn = [self su_buttonWithTarget:target action:action];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    
    return btn;
}
@end

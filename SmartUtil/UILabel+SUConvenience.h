//
//  UILabel+SUConvenience.h
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SUConvenience)
+ (UILabel *)su_labelWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)algin;
@end

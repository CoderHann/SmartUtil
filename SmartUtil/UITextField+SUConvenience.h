//
//  UITextField+SUConvenience.h
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SUConvenience)

/**
 便捷UITextField构造器
 */
+ (UITextField *)su_textFieldWithPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor textColor:(UIColor *)textColor delegate:(id)delegate;
@end

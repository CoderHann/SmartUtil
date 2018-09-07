//
//  UITextField+SUConvenience.m
//  SmartUtil
//
//  Created by roki on 2018/3/10.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UITextField+SUConvenience.h"

@implementation UITextField (SUConvenience)
+ (UITextField *)su_textFieldWithPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor textColor:(UIColor *)textColor delegate:(id)delegate {
    
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    [textField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    textField.textColor = textColor;
    textField.delegate = delegate;
    return textField;
}
@end

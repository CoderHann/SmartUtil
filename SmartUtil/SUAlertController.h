//
//  SUAlertController.h
//  SmartUtil
//
//  Created by roki on 2018/6/9.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SUAlertOperationBlock)(NSInteger index);

@interface SUAlertController : UIAlertController
+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message operation:(SUAlertOperationBlock)operation cancelTitle:(NSString *)cancelTitle otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message operation:(SUAlertOperationBlock)operation cancelTitle:(NSString *)cancelTitle otherTitleArray:(NSArray *)otherTitleArray;
@end

//
//  SUAlertController.m
//  SmartUtil
//
//  Created by roki on 2018/6/9.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "SUAlertController.h"

@interface SUAlertController ()

@end

@implementation SUAlertController

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message operation:(SUAlertOperationBlock)operation cancelTitle:(NSString *)cancelTitle otherTitles:(NSString *)otherTitles, ...{
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    va_list args;
    va_start(args, otherTitles);
    for (NSString *str = otherTitles; str != nil; str = va_arg(args, NSString*)) {
        [array addObject:str];
    }
    va_end(args);
    
    //
    return [[self class] alertWithTitle:title message:message operation:operation cancelTitle:cancelTitle otherTitleArray:array];
}

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message operation:(SUAlertOperationBlock)operation cancelTitle:(NSString *)cancelTitle otherTitleArray:(NSArray *)otherTitleArray {
    
    SUAlertController *alertController = [[self class] alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (operation) {
            operation(0);
        }
    }];
    [alertController addAction:cancelAction];
    
    for (NSInteger i = 0; i < otherTitleArray.count; i++) {
        NSString *string = otherTitleArray[i];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:string style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (operation) {
                operation(i+1);
            }
        }];
        [alertController addAction:action];
    }
    // root vc
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    UIViewController *controller = rootWindow.rootViewController;
    if (controller) {
        [controller presentViewController:alertController animated:YES completion:nil];
    }
    
    return alertController;
}

@end

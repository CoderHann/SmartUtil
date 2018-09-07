//
//  UIDevice+SUDevice.m
//  SmartUtil
//
//  Created by roki on 2018/2/25.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIDevice+SUDevice.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <Photos/Photos.h>

@implementation UIDevice (SUDevice)
+ (CGFloat)su_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)su_screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

#pragma mark -Privacy Authorization
+ (void)su_requestCameraAuthorization:(authorizationStatus)authStatus {
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (authStatus) {
        authStatus((SUAuthorizationStatus)status);
    }
}

+ (void)su_requestPhotoAuthorization:(authorizationStatus)authStatus {
    NSInteger result = 0;
    
    if (([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)) {
        result = [PHPhotoLibrary authorizationStatus];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [ALAssetsLibrary authorizationStatus];
#pragma clang diagnostic pop
    }
    
    if (result == SUAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (authStatus) {
                    authStatus((NSInteger)status);
                }
            });
        }];
    } else {
        if (authStatus) {
            authStatus(result);
        }
    }
}

@end

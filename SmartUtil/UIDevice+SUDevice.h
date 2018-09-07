//
//  UIDevice+SUDevice.h
//  SmartUtil
//
//  Created by roki on 2018/2/25.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SUAuthorizationStatus) {
    
    SUAuthorizationStatusNotDetermined = 0,
    SUAuthorizationStatusRestricted = 1,
    SUAuthorizationStatusDenied = 2,
    SUAuthorizationStatusAuthorized = 3
};

typedef void (^authorizationStatus)(SUAuthorizationStatus status);

@interface UIDevice (SUDevice)
/**
 屏幕尺寸-宽度
 */
@property (class,nonatomic,assign,readonly)CGFloat su_screenWidth;


/**
 屏幕尺寸-高度
 */
@property (class,nonatomic,assign,readonly)CGFloat su_screenHeight;

#pragma mark -Privacy Authorization

/**
 查询相机的授权状态
 */
+ (void)su_requestCameraAuthorization:(authorizationStatus)authStatus;

/**
 查询浏览相册的授权状态
 */
+ (void)su_requestPhotoAuthorization:(authorizationStatus)authStatus;

/**
 查询麦克风的授权状态
 */
+ (void)su_requestMicrophoneAuthorization:(authorizationStatus)authStatus;

@end

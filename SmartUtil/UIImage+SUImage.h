//
//  UIImage+SUImage.h
//  SmartUtil
//
//  Created by roki on 2018/6/18.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SUImage)

/**
 截屏
 */
+ (UIImage *)su_screenShot;

/**
 自动填充中心点的图片
 */
- (UIImage *)su_resizingImage;

/**
 创建方形图片
 */
+ (UIImage *)su_createImageWithColor:(UIColor *)color size:(CGSize)size;

/**
 生成二维码的工具
 
 @param url 二维码链接
 @param size 二维码大小（sizexsize）默认为200x200
 @return 二维码图片
 */
+ (UIImage *)su_QRCodeImageWithUrl:(NSString *)url size:(CGFloat)size;

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)su_cutImageFromView:(UIView *)view;


/**
 图片压缩

 @param thumbSize 期望的size
 */
- (UIImage *)thumbImageWithExpectSize:(CGSize)thumbSize;

- (UIImage *)squareImageWithExpectEdge:(CGFloat)expectEdge;

@end

static inline UIImage* su_imageWithName(NSString *name) {
    return [UIImage imageNamed:name];
}

//
//  UIImage+SUImage.m
//  SmartUtil
//
//  Created by roki on 2018/6/18.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIImage+SUImage.h"

@implementation UIImage (SUImage)
+ (UIImage *)su_screenShot {
    return [self su_cutImageFromView:[UIApplication sharedApplication].keyWindow];
}

- (UIImage *)su_resizingImage {
    UIImage *image = self;
    CGFloat top = image.size.height * 0.5;
    CGFloat bottom = top;
    CGFloat left = image.size.width * 0.5;
    CGFloat right = left;
    // 设置端盖的值
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    // 设置拉伸的模式
    UIImageResizingMode mode = UIImageResizingModeStretch;
    
    // 拉伸图片
    return [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
}

+ (UIImage *)su_createImageWithColor:(UIColor *)color size:(CGSize)size;

{
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
    
}

+ (UIImage *)su_QRCodeImageWithUrl:(NSString *)url size:(CGFloat)size {
    
    // 0.initial
    if (size == 0) {
        size = 200.0;
    }
    
    // 1.实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复滤镜的默认属性（因为滤镜可能保存上一次的属性）
    [filter setDefaults];
    
    // 3.讲字符串转换为NSData
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4.通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5.通过了滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 6.因为生成的二维码模糊，所以通过createNonInterpolatedUIImageFormCIImage:outputImage来获得高清的二维码图片
    
    UIImage *image = [self dealHDImageWithCIImage:outputImage size:size];
    
    return image;
    
    
}

+ (UIImage *)dealHDImageWithCIImage:(CIImage *)image size:(CGFloat)size {
    {
        CGRect extent = CGRectIntegral(image.extent);
        CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
        
        // 1.创建bitmap;
        size_t width = CGRectGetWidth(extent) * scale;
        size_t height = CGRectGetHeight(extent) * scale;
        CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
        CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
        CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);
        
        // 2.保存bitmap到图片
        CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
        UIImage *qrImage = [UIImage imageWithCGImage:scaledImage];
        CGContextRelease(bitmapRef);
        CGImageRelease(bitmapImage);
        CGImageRelease(scaledImage);
        
        return qrImage;
    }
}

+ (UIImage *)su_cutImageFromView:(UIView *)view {
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}
- (UIImage *)thumbImageWithExpectSize:(CGSize)thumbSize {
    UIImage *thumbImage = nil;
    
    CGSize originalSize = self.size;//获取原始图片size
    CGFloat originalWidth = originalSize.width;
    CGFloat originalHeight = originalSize.height;
    
    if ((originalWidth <= thumbSize.width) && (originalHeight <= thumbSize.height)) {
        
        thumbImage = self;//宽和高同时小于要压缩的尺寸时返回原尺寸
    } else {
        //新图片的宽和高
        CGFloat scale = MIN(thumbSize.width/originalWidth, thumbSize.height/originalHeight);
        CGSize newImageSize = CGSizeMake(originalWidth*scale , originalHeight*scale);
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(newImageSize.width , newImageSize.height ), NO, 0);
        UIGraphicsBeginImageContext(newImageSize);
        [self drawInRect:CGRectMake(0, 0, newImageSize.width, newImageSize.height) blendMode:kCGBlendModeNormal alpha:1.0];
        thumbImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    }
    
    return thumbImage;
}

- (UIImage *)squareImageWithExpectEdge:(CGFloat)expectEdge {
    UIImage *thumbImage = nil;
    
    CGSize originalSize = self.size;//获取原始图片size
    CGFloat originalWidth = originalSize.width;
    CGFloat originalHeight = originalSize.height;
    
    CGFloat minEdge = MIN(originalWidth, originalHeight);
    CGSize expectSize = CGSizeMake(expectEdge, expectEdge);
    
    if (minEdge < expectEdge) {
        expectSize = CGSizeMake(minEdge, minEdge);
    }
    
    CGSize fitSize = CGSizeZero;
    
    if (expectSize.width / originalWidth >= expectSize.height / originalHeight) {
        // 高挑的图片
        fitSize = CGSizeMake(expectSize.width, expectSize.width * originalHeight / originalWidth);
    } else {
        // 较宽的图片
        
        fitSize = CGSizeMake(expectSize.height * originalWidth / originalHeight, expectSize.height);
        
    }
    
    UIGraphicsBeginImageContext(expectSize);
    [self drawInRect:CGRectMake((expectSize.width - fitSize.width) * 0.5, (expectSize.height - fitSize.height) * 0.5, fitSize.width, fitSize.height) blendMode:kCGBlendModeNormal alpha:1.0];
    thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return thumbImage;
}
@end

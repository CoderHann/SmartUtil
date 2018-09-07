//
//  UIView+SUProperty.m
//  SmartUtil
//
//  Created by roki on 2018/1/1.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIView+SUProperty.h"
#import "UIView+SUAdapt.h"

@implementation UIView (SUProperty)

- (CGFloat)su_originX {
    return self.frame.origin.x;
}

- (void)setSu_originX:(CGFloat)su_originX {
    CGRect frame = self.frame;
    frame.origin.x = su_originX;
    self.frame = frame;
}

- (CGFloat)su_originY {
    return self.frame.origin.y;
}

- (void)setSu_originY:(CGFloat)su_originY {
    CGRect frame = self.frame;
    frame.origin.y = su_originY;
    self.frame = frame;
}

- (CGPoint)su_center {
    return self.center;
}

- (void)setSu_center:(CGPoint)su_center {
    self.center = su_center;
}

- (CGFloat)su_centerX {
    return self.center.x;
}

- (void)setSu_centerX:(CGFloat)su_centerX {
    CGPoint center = self.center;
    center.x = su_centerX;
    self.center = center;
}

- (CGFloat)su_centerY {
    return self.center.y;
}

- (void)setSu_centerY:(CGFloat)su_centerY {
    CGPoint center = self.center;
    center.y = su_centerY;
    self.center = center;
}

- (CGFloat)su_maxX {
    return self.su_originX + self.su_sizeW;
}

- (void)setSu_maxX:(CGFloat)su_maxX {
    self.su_originX = su_maxX - self.su_sizeW;
}

- (CGFloat)su_maxY {
    return self.su_originY + self.su_sizeH;
}

- (void)setSu_maxY:(CGFloat)su_maxY {
    self.su_originY = su_maxY - self.su_sizeH;
}

- (void)setSu_sizeH:(CGFloat)su_sizeH {
    CGRect frame = self.frame;
    frame.size.height = su_sizeH;
    self.frame = frame;
}

- (CGFloat)su_sizeH {
    return self.frame.size.height;
}

- (void)setSu_sizeW:(CGFloat)su_sizeW {
    CGRect frame = self.frame;
    frame.size.width = su_sizeW;
    self.frame = frame;
}

- (CGFloat)su_sizeW {
    return self.frame.size.width;
}
@end

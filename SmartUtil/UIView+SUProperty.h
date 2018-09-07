//
//  UIView+SUProperty.h
//  SmartUtil
//
//  Created by roki on 2018/1/1.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SUProperty)


/**
 控件起始X
 */
@property (assign, nonatomic) CGFloat su_originX;
/**
 控件起始Y
 */
@property (assign, nonatomic) CGFloat su_originY;

/**
 控件中心
 */
@property (assign, nonatomic) CGPoint su_center;
/**
 控件X中心
 */
@property (assign, nonatomic) CGFloat su_centerX;
/**
 控件Y中心
 */
@property (assign, nonatomic) CGFloat su_centerY;

/**
 控件最大的X
 */
@property (assign, nonatomic) CGFloat su_maxX;
/**
 控件最大的Y
 */
@property (assign, nonatomic) CGFloat su_maxY;

/**
 控件的宽度
 */
@property (assign, nonatomic) CGFloat su_sizeW;


/**
 控件的高度
 */
@property (assign, nonatomic) CGFloat su_sizeH;

@end

//
//  UIFont+SUFont.h
//  SmartUtil
//
//  Created by roki on 2018/2/26.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (SUFont)

@end
static inline UIFont* su_font(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

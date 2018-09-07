//
//  UIView+SUAdapt.m
//  SmartUtil
//
//  Created by roki on 2018/1/1.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIView+SUAdapt.h"
#import <objc/runtime.h>
#import "UIView+SUProperty.h"

static const void *KeySuAdaptWidth = @"suAdaptWidthKey";
static const void *KeySuOriginHeight = @"suOriginHeight";

@implementation UIView (SUAdapt)

- (void)setSu_adaptWidth:(BOOL)su_adaptWidth {
    objc_setAssociatedObject(self, KeySuAdaptWidth, [NSNumber numberWithBool:su_adaptWidth], OBJC_ASSOCIATION_ASSIGN);
    if (su_adaptWidth) {
        self.su_originHeight = self.su_sizeH;
    }
}

- (BOOL)su_adaptWidth {
    return [objc_getAssociatedObject(self, KeySuAdaptWidth) boolValue];
}

- (void)setSu_originHeight:(CGFloat)su_originHeight {
    objc_setAssociatedObject(self, KeySuOriginHeight, [NSNumber numberWithFloat:su_originHeight], OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)su_originHeight {
    return [objc_getAssociatedObject(self, KeySuOriginHeight) floatValue];
}

@end

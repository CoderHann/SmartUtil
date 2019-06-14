//
//  NSString+Util.m
//  SmartUtil
//
//  Created by roki on 2018/5/2.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

- (CGSize)su_needSizeWithFont:(CGFloat)font maxSize:(CGSize)size {
    return [self boundingRectWithSize:size
                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}
                              context:nil].size;
}

@end

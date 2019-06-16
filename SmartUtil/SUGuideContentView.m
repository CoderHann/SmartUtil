//
//  SUGuideContentView.m
//  SmartUtil
//
//  Created by roki on 6/16/19.
//

#import "SUGuideContentView.h"
#import "UIColor+SUColor.h"

@interface SUGuideContentView()

@property(strong, nonatomic)CAShapeLayer *shapeLayer;

@end

@implementation SUGuideContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.backgroundColor = su_colorWithHexAlpha(0x000000, 0.7);
    
}

#pragma mark - Setter&Getter
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        
    }
    
    return _shapeLayer;
}

- (void)setCoverColor:(UIColor *)coverColor {
    _coverColor = coverColor;
    
    self.backgroundColor = coverColor;
}

#pragma mark - Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    
    if (CGRectEqualToRect(_hollowFrame, CGRectZero)) {
        // 非镂空形式
        [self.layer setMask:nil];
        
    } else {
        // 外层的路径
        UIBezierPath *outerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:0];
        // 内层路径
        UIBezierPath *innerPath = [UIBezierPath bezierPathWithRoundedRect:_hollowFrame cornerRadius:_hollowRadius];
        [outerPath appendPath:innerPath];
        
        outerPath.usesEvenOddFillRule = YES;
        
        
        self.shapeLayer.path = outerPath.CGPath;
        self.shapeLayer.fillColor= [UIColor blackColor].CGColor;  //其他颜色都可以，只要不是透明的
        self.shapeLayer.fillRule = kCAFillRuleEvenOdd;
        
        [self.layer setMask:self.shapeLayer];
    }
    
    
    
    
}

@end

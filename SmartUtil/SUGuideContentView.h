//
//  SUGuideContentView.h
//  SmartUtil
//
//  Created by roki on 6/16/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SUGuideContentView : UIView

@property(strong, nonatomic)UIColor *coverColor;

@property(assign,nonatomic)CGRect hollowFrame;
@property(assign,nonatomic)CGFloat hollowRadius;
@end

NS_ASSUME_NONNULL_END

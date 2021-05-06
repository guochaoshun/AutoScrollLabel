//
//  YZTranslationAnimationLabel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZTranslationAnimationLabel : UIView

/// 更新文案
/// @param text text
- (void)updateContentText:(NSString *)text;

/// 开启动画
- (void)startAnimiation;

@end

NS_ASSUME_NONNULL_END

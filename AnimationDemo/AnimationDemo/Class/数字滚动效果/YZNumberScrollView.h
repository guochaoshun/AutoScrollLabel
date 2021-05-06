//
//  YZNumberScrollView.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZNumberScrollView : UIView

//字体颜色
@property (nonatomic, strong) UIColor *textColor;
//每个转到时长
@property (nonatomic, assign) CGFloat duration;
//相邻转动间隔时间
@property (nonatomic, assign) CGFloat dealyTime;
//获取宽度
- (CGFloat)getWidth:(NSString *)string;

/// 设置字体,建议在设置configNumber:方法之后调用
/// @param font 字体
- (void)configFont:(UIFont *)font;

/// 设置数字,在startAnimation之前调用,建议别的操作之后调用.
/// @param number 数字
- (void)configNumber:(NSNumber *)number;

/// 开始动画
- (void)startAnimation;

@end

NS_ASSUME_NONNULL_END

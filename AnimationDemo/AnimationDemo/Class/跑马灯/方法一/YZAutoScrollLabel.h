//
//  YZAutoScrollLabel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZAutoScrollLabel : UIView

/**
 跑马灯文字
 */
@property (nonatomic ,copy) NSString *labelText;

/**
 字体大小 默认13
 */
@property (nonatomic, strong) UIFont *textFont;

/**
 字体颜色 默认黑色
 */
@property (nonatomic, strong) UIColor *textColor;

/**
 背景颜色 默认clear
 */
@property (nonatomic, strong) UIColor *bgColor;

/**
 字体对齐 默认左对齐
 */
@property(nonatomic) NSTextAlignment textAlignment;

/**
 滚动次数，默认是循环滚动
 */
@property (nonatomic, assign) CGFloat repeatCount;

/**
 滚动速度，默认是0.5
 */
@property (nonatomic, assign) CGFloat speed;

/**
 开始计时器
 */
- (void)startAnimation;

/**
 暂停
 */
- (void)pauseAnimation;

/**
 停止滚动，状态复原，停止计时器；如果是无限次滚动的话，调用的视图销毁时，要调用 此方法，不然该视图无法销毁
 */
- (void)stopAnimation;


@end

NS_ASSUME_NONNULL_END

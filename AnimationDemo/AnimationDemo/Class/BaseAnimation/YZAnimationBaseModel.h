//
//  YZAnimationBaseModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZAnimationBaseModel : NSObject

///循环次数 default is 0,不循环
@property (nonatomic, assign) CGFloat repeatCount;
///动画总时长
@property (nonatomic, assign) CFTimeInterval duration;
///动画开始时间 default is 0
@property (nonatomic, assign) CFTimeInterval beginTime;
///是否反向播放 default is NO
@property (nonatomic, assign) BOOL autoreverses;
///是否在完成移除
///removedOnCompletion default is NO
@property (nonatomic, assign) BOOL removedOnCompletion;
///fillMode default is kCAFillModeForwards
@property (nonatomic, copy) CAMediaTimingFillMode fillMode;
///时间曲线,默认为nil,即线性曲线
@property (nonatomic, strong) CAMediaTimingFunction *timingFunction;

//====== 子类重写以下两个方法实现动画自定义 =======//
/**
 动画的key值,子类重写该方法标记自己的动画类型
 */
- (NSString *)animationKeyPath;

/**
 根据model的相关数据生成相关动画
 自定义动画时子类重写该方法
 */
- (CAAnimation *)animationFromModel;


/**
 根据自身animationKeyPath生成的带有base param参数配置的动画model
 */
- (CAKeyframeAnimation *)keyFrameAnimation;
- (CABasicAnimation *)baseAnimation;
- (CAAnimationGroup *)animationGroup;

@end

NS_ASSUME_NONNULL_END

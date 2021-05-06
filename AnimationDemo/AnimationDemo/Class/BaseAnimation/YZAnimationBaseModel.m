//
//  YZAnimationBaseModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

@implementation YZAnimationBaseModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _removedOnCompletion = NO;
        _fillMode = kCAFillModeForwards;
        _repeatCount = 0;
        _beginTime = 0;
        _autoreverses = NO;
        _duration = 0.5f;
    }
    return self;
}

- (NSString *)animationKeyPath {
    return nil;
}

- (CAAnimation *)animationFromModel {
    return nil;
}

- (CAKeyframeAnimation *)keyFrameAnimation {
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:[self animationKeyPath]];
    [self configAnimationCommonParam:ani];
    return ani;
}

- (CABasicAnimation *)baseAnimation {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:[self animationKeyPath]];
    [self configAnimationCommonParam:ani];
    return ani;
}

- (CAAnimationGroup *)animationGroup {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [self configAnimationCommonParam:group];
    return group;
}

/// 配置公共参数
- (void)configAnimationCommonParam:(CAAnimation *)ani {
    if (!ani) {
        //没有参数不配置
        return;
    }
    ani.removedOnCompletion = self.removedOnCompletion;
    ani.fillMode = self.fillMode;
    ani.duration = self.duration;
    ani.repeatCount = self.repeatCount;
    ani.autoreverses = self.autoreverses;
    ani.beginTime = self.beginTime;
    if (self.timingFunction) {
        ani.timingFunction = self.timingFunction;
    }
}

@end

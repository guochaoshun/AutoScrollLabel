//
//  YZScaleAnimationModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZScaleAnimationModel.h"

@implementation YZScaleAnimationModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _fromValue = -1.0f;
    }
    return self;
}

- (NSString *)animationKeyPath {
    return @"transform.scale";
}

- (CAAnimation *)animationFromModel {
    CABasicAnimation *ani = [self baseAnimation];
    if (self.fromValue >= 0) {
        ani.fromValue = [NSNumber numberWithFloat:self.fromValue];
    }
    if (self.toValue >= 0) {
        ani.toValue = [NSNumber numberWithFloat:self.toValue];
    }
    return ani;
}

@end

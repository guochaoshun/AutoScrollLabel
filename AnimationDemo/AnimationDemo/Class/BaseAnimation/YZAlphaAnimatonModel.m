//
//  YZAlphaAnimatonModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAlphaAnimatonModel.h"

@implementation YZAlphaAnimatonModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _fromValue = 1.0f;
    }
    return self;
}


- (NSString *)animationKeyPath {
    return @"opacity";
}

- (CAAnimation *)animationFromModel {
    CABasicAnimation *ani = [self baseAnimation];
    ani.fromValue = [NSNumber numberWithFloat:self.fromValue];
    ani.toValue = [NSNumber numberWithFloat:self.toValue];
    return ani;
}

@end

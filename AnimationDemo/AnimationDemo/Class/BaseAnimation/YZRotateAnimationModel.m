//
//  YZRotateAnimationModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZRotateAnimationModel.h"

@implementation YZRotateAnimationModel

- (NSString *)animationKeyPath {
    NSString *key = @"transform.rotation.z";
    if (self.direction == YZRotationAniDirectionZ) {
        key = @"transform.rotation.z";
    } else if (self.direction == YZRotationAniDirectionX) {
        key = @"transform.rotation.x";
    } else if (self.direction == YZRotationAniDirectionY) {
        key = @"transform.rotation.y";
    }
    return key;
}

- (CAAnimation *)animationFromModel {
    CABasicAnimation *ani = [self baseAnimation];
    ani.fromValue = [NSNumber numberWithFloat:self.fromValue];
    ani.toValue = [NSNumber numberWithFloat:self.toValue];
    return ani;
}

@end

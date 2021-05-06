//
//  YZGroupAnimationModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZGroupAnimationModel.h"

@implementation YZGroupAnimationModel

- (CAAnimation *)animationFromModel {
    CAAnimationGroup *group = [self animationGroup];
    if (self.animations.count > 0) {
        NSMutableArray *array = [NSMutableArray array];
        for (YZAnimationBaseModel *subAni in self.animations) {
            CAAnimation *subAnimation = [subAni animationFromModel];
            if (subAnimation) {
                [array addObject:subAnimation];
            }
        }
        group.animations = array;
    }
    return group;
}

@end

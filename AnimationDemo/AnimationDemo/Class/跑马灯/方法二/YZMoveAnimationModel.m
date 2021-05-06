//
//  YZMoveAnimationModel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZMoveAnimationModel.h"

@implementation YZMoveAnimationModel

- (NSString *)animationKeyPath {
    return @"position";
}

- (CAAnimation *)animationFromModel {
   CAKeyframeAnimation *ani = [self keyFrameAnimation];
   UIBezierPath *path = nil;
   if (self.customPath) {
       path = self.customPath;
   } else {
       path = [UIBezierPath bezierPath];
       CGPoint startPoint = self.startPoint;
       CGPoint endPoint = self.endPoint;
       CGPoint control1 = self.controlPoint1;
       CGPoint control2 = self.controlPoint2;
       BOOL isValidControl1 = !CGPointEqualToPoint(control1, CGPointZero);
       BOOL isValidControl2 = !CGPointEqualToPoint(control2, CGPointZero);
       [path moveToPoint:startPoint];
       if (isValidControl1 && isValidControl2) {
           //三次贝塞尔
           [path addCurveToPoint:endPoint controlPoint1:control1 controlPoint2:control2];
       } else if (isValidControl1) {
           //二次贝塞尔
           [path addQuadCurveToPoint:endPoint controlPoint:control1];
       } else if (isValidControl2) {
           //二次贝塞尔
           [path addQuadCurveToPoint:endPoint controlPoint:control2];
       } else {
           //直线
           [path addLineToPoint:endPoint];
       }
   }
   ani.path = path.CGPath;
   return ani;
}


@end

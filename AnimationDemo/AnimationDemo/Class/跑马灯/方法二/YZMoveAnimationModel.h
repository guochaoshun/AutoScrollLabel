//
//  YZMoveAnimationModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZMoveAnimationModel : YZAnimationBaseModel

///自定义路径,会忽律其他点位
@property (nonatomic, strong) UIBezierPath *customPath;
/**
 贝塞尔曲线点位
 两个控制点均为CGPointZero时为直线动画
 */
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint controlPoint1;
@property (nonatomic, assign) CGPoint controlPoint2;
@property (nonatomic, assign) CGPoint endPoint;

@end

NS_ASSUME_NONNULL_END

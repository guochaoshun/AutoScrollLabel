//
//  YZRotateAnimationModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,YZRotationAniDirection) {
    ///绕z轴旋转
    YZRotationAniDirectionZ = 0,
    ///绕y轴旋转
    YZRotationAniDirectionY,
    ///绕x轴旋转
    YZRotationAniDirectionX
};

@interface YZRotateAnimationModel : YZAnimationBaseModel

/// 旋转方向默认 ULRotationAniDirectionZ
@property (nonatomic, assign) YZRotationAniDirection direction;
@property (nonatomic, assign) CGFloat fromValue;
@property (nonatomic, assign) CGFloat toValue;

@end

NS_ASSUME_NONNULL_END

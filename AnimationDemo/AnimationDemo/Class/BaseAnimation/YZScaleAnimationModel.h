//
//  YZScaleAnimationModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZScaleAnimationModel : YZAnimationBaseModel

///fromValue default is -1.0
///fromValue <=0 或者 toValue<=0 时会忽律该参数的配置
@property (nonatomic, assign) CGFloat fromValue;
@property (nonatomic, assign) CGFloat toValue;

@end

NS_ASSUME_NONNULL_END

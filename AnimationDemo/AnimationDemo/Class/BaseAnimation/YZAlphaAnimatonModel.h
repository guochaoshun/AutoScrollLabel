//
//  YZAlphaAnimatonModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZAlphaAnimatonModel : YZAnimationBaseModel

///fromValue default is 1.0
@property (nonatomic, assign) CGFloat fromValue;
@property (nonatomic, assign) CGFloat toValue;

@end

NS_ASSUME_NONNULL_END

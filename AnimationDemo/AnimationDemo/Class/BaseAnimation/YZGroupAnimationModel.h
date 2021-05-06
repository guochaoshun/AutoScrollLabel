//
//  YZGroupAnimationModel.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAnimationBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZGroupAnimationModel : YZAnimationBaseModel

///组动画使用
@property (nonatomic, strong) NSArray<YZAnimationBaseModel *> *animations;

@end

NS_ASSUME_NONNULL_END

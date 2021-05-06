//
//  YZCollectAnimationButton.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZCollectAnimationButton : UIButton


- (instancetype)initCollectionButton:(NSString *)selectImageName
                   unselectImageName:(NSString *)unselectImageName;

/// 当前收藏状态
/// @param isCollect 是否收藏
- (void)updateCollectionButtonState:(BOOL)isCollect animation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END

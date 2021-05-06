//
//  YZCollectAnimationButton.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZCollectAnimationButton.h"
#import "UIImage+YZ.h"
#import "YZAlphaAnimatonModel.h"
#import "YZScaleAnimationModel.h"
#import "YZGroupAnimationModel.h"

@interface YZCollectAnimationButton ()<CAAnimationDelegate>

/// 收藏图片
@property (nonatomic, strong) UIImageView *collectButtonImageView;
/// 未收藏图片
@property (nonatomic, strong) UIImageView *unCollectButtonImageView;
/// 是不是在播放按钮动画中
@property (nonatomic, assign) BOOL isCollectButtonAnimation;
/// 选中的图片
@property (nonatomic, copy) NSString *selectImageName;
/// 未选中的图片
@property (nonatomic, copy) NSString *unSelectImageName;

@end

@implementation YZCollectAnimationButton

- (instancetype)initCollectionButton:(NSString *)selectImageName
                   unselectImageName:(NSString *)unselectImageName {
    self = [super init];
    if (self) {
        self.selectImageName = selectImageName;
        self.unSelectImageName = unselectImageName;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    // 根据未选中图片的大小，设置一个展位的图片
    UIImage *defaultImage = [UIImage imageNamed:self.unSelectImageName];
    UIImage *clearImage = [UIImage imageWithColor:[UIColor clearColor] size:defaultImage.size];
    [self setImage:clearImage forState:UIControlStateNormal];
    //收藏按钮图片
    self.collectButtonImageView = [[UIImageView alloc] init];
    [self addSubview:self.collectButtonImageView];
    self.collectButtonImageView.hidden = YES;
    [self.collectButtonImageView setImage:[UIImage imageNamed:self.selectImageName]];

    //未收藏按钮
    self.unCollectButtonImageView = [[UIImageView alloc] init];
    [self addSubview:self.unCollectButtonImageView];
    [self.unCollectButtonImageView setImage:[UIImage imageNamed:self.unSelectImageName]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectButtonImageView.frame = self.imageView.frame;
    self.unCollectButtonImageView.frame = self.collectButtonImageView.frame;
}

/// 当前收藏状态
/// @param isCollect 是否收藏
- (void)updateCollectionButtonState:(BOOL)isCollect animation:(BOOL)animation {
    if (animation) {
        if (isCollect != self.isSelected) {
            if (isCollect) {
                self.selected = YES;
                [self collectButtonAnimation:YES];
            } else {
                self.selected = NO;
                [self collectButtonAnimation:NO];
            }
        }
    } else {
        if (isCollect) {
            self.selected = YES;
            self.collectButtonImageView.hidden = NO;
            self.unCollectButtonImageView.hidden = YES;
        } else {
            self.selected = NO;
            self.collectButtonImageView.hidden = YES;
            self.unCollectButtonImageView.hidden = NO;
        }
    }
}

// 收藏按钮切换动画
- (void)collectButtonAnimation:(BOOL)isCollect {
    self.collectButtonImageView.hidden = NO;
    self.unCollectButtonImageView.hidden = NO;
    self.isCollectButtonAnimation = YES;

    CGFloat animationDur = 0.2f;
    CGFloat collectAlphaFromValue;
    CGFloat collectAlphaToValue;
    CGFloat collectScaleFromValue;
    CGFloat collectScaleToValue;

    CGFloat unCollectAlphaFromValue;
    CGFloat unCollectAlphaToValue;
    CGFloat unCollectScaleFromValue;
    CGFloat unCollectScaleToValue;

    if (isCollect) {
        //从未收藏态 -> 收藏态
        collectAlphaFromValue = 0;
        collectAlphaToValue = 1;
        collectScaleFromValue = 0.4;
        collectScaleToValue = 1;

        unCollectAlphaFromValue = 1;
        unCollectAlphaToValue = 0;
        unCollectScaleFromValue = 1;
        unCollectScaleToValue = 0.4;
    } else {
        //从收藏态 -> 未收藏态
        collectAlphaFromValue = 1;
        collectAlphaToValue = 0;
        collectScaleFromValue = 1;
        collectScaleToValue = 0.4;

        unCollectAlphaFromValue = 0;
        unCollectAlphaToValue = 1;
        unCollectScaleFromValue = 0.4;
        unCollectScaleToValue = 1;
    }

    //播放图
    YZAlphaAnimatonModel *alphaAnimation = [[YZAlphaAnimatonModel alloc] init];
    alphaAnimation.fromValue = collectAlphaFromValue;
    alphaAnimation.toValue = collectAlphaToValue;
    alphaAnimation.duration = animationDur;

    YZScaleAnimationModel *scaleAnimation = [[YZScaleAnimationModel alloc] init];
    scaleAnimation.fromValue = collectScaleFromValue;
    scaleAnimation.toValue = collectScaleToValue;
    scaleAnimation.duration = animationDur;

    YZGroupAnimationModel *groupAnimation = [[YZGroupAnimationModel alloc] init];
    groupAnimation.duration = animationDur;
    groupAnimation.animations = @[alphaAnimation,scaleAnimation];
    CAAnimation *animation = [groupAnimation animationFromModel];
    animation.delegate = self;
    [self.collectButtonImageView.layer addAnimation:animation forKey:@"collectAnimation"];

    //暂停图
    YZAlphaAnimatonModel *pauseAlphaAnimation = [[YZAlphaAnimatonModel alloc] init];
    pauseAlphaAnimation.fromValue = unCollectAlphaFromValue;
    pauseAlphaAnimation.toValue = unCollectAlphaToValue;
    pauseAlphaAnimation.duration = animationDur;

    YZScaleAnimationModel *pauseScaleAnimation = [[YZScaleAnimationModel alloc] init];
    pauseScaleAnimation.fromValue = unCollectScaleFromValue;
    pauseScaleAnimation.toValue = unCollectScaleToValue;
    pauseScaleAnimation.duration = animationDur;

    YZGroupAnimationModel *pauseGroupAnimation = [[YZGroupAnimationModel alloc] init];
    pauseGroupAnimation.duration = animationDur;
    pauseGroupAnimation.animations = @[pauseAlphaAnimation,pauseScaleAnimation];
    [self.unCollectButtonImageView.layer addAnimation:[pauseGroupAnimation animationFromModel] forKey:@"unCollectAnimation"];
}

#pragma mark -
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.isCollectButtonAnimation = NO;
}

@end

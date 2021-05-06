//
//  YZStarSimilarController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/3.
//

#import "YZStarSimilarController.h"

@interface YZStarSimilarController ()

/** 背景图 */
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (nonatomic, weak) UIImageView *backgroundImageView1;
@property (nonatomic, weak) UIImageView *backgroundImageView2;

@end

@implementation YZStarSimilarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupSubviews];
    [self addAnmimation];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor blackColor];
    
    self.backgroundImageView = [self createImageWithImageName:@"star_animation"];
    self.backgroundImageView1 = [self createImageWithImageName:@"star_animation"];
    self.backgroundImageView2 = [self createImageWithImageName:@"star_animation"];
}

- (void)addAnmimation {
    [self addGuideAnimationWithView:self.backgroundImageView duration:2 delay:0];
    [self addGuideAnimationWithView:self.backgroundImageView1 duration:2 delay:1];
    [self addGuideAnimationWithView:self.backgroundImageView2 duration:2 delay:2];
}

- (void)addGuideAnimationWithView:(UIView *)view duration:(CGFloat)duration delay:(CGFloat)delay {
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1];
    opacityAnimation.duration = duration * 0.5;
    opacityAnimation.autoreverses = NO;

    CABasicAnimation *opacityAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation1.fromValue = [NSNumber numberWithFloat:1];
    opacityAnimation1.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation1.duration = duration * 0.5;
    opacityAnimation1.beginTime = duration * 0.5;
    opacityAnimation1.autoreverses = NO;

    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithDouble:1];
    animation2.toValue = [NSNumber numberWithDouble:2.5];
    animation2.duration = duration;
    animation2.autoreverses = NO;
    animation2.removedOnCompletion = YES;

    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    group.beginTime = CACurrentMediaTime() + delay;
    group.repeatCount = MAXFLOAT;
    group.duration = duration;
    [group setAnimations:@[opacityAnimation, opacityAnimation1, animation2]];
    [view.layer addAnimation:group forKey:@"starAnimation"];
    view.layer.opacity = 0;
}

- (UIImageView *)createImageWithImageName:(NSString *)imageName {
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_animation"]];
    [self.view addSubview:backgroundImageView];
    backgroundImageView.frame = self.view.frame;
    backgroundImageView.contentMode = UIViewContentModeCenter ;
    return backgroundImageView;
}

@end

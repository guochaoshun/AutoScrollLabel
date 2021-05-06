//
//  YZTranslationAnimationLabel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZTranslationAnimationLabel.h"
#import "NSString+YZ.h"
#import "YZMoveAnimationModel.h"

@interface YZTranslationAnimationLabel ()<CAAnimationDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isAnimation;

@end

@implementation YZTranslationAnimationLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.clipsToBounds = YES;

    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.frame = CGRectMake(0, 0, 1000, 40);
}

/// 开启动画
- (void)startAnimiation {
    if (self.title.length) {
        [self.superview layoutIfNeeded];
        CGSize titleSize = [self.title sizeWithSystemFontOfSize:[UIFont boldSystemFontOfSize:14] maxHeight:16];
        CGFloat viewWidth = self.frame.size.width;
        if (titleSize.width > viewWidth) {
            self.titleLabel.text = [NSString stringWithFormat:@"%@ %@",self.title,self.title];
            [self layoutIfNeeded];
            YZMoveAnimationModel *moveAni = [[YZMoveAnimationModel alloc] init];
            moveAni.duration = self.title.length*0.2;
            moveAni.repeatCount = MAXFLOAT;
            moveAni.removedOnCompletion = YES;
            moveAni.startPoint = CGPointMake(self.titleLabel.frame.size.width/2, self.titleLabel.frame.size.height/2);
            moveAni.endPoint = CGPointMake(0, self.frame.size.height/2);
            CAAnimation *animation = [moveAni animationFromModel];
            animation.delegate = self;
            [self.titleLabel.layer addAnimation:animation forKey:@"moveAnimation"];
        }
    }
}

- (void)updateContentText:(NSString *)text {
    self.title = text;
    if (text.length) {
        self.titleLabel.text = text;
    } else {
        self.titleLabel.text = nil;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        self.titleLabel.text = self.title;
    }
}

- (void)dealloc {
    NSLog(@"啦啦啦啦");
}

@end

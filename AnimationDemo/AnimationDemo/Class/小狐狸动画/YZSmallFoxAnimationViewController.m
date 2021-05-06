//
//  YZSmallFoxAnimationViewController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/5.
//

#import "YZSmallFoxAnimationViewController.h"

@interface YZSmallFoxAnimationViewController ()

/// 小狐狸
@property (nonatomic, strong) UIView *smallFoxView;

@end

@implementation YZSmallFoxAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    [self setupSmallFoxViewAnimation];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.smallFoxView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 238, 190)];
    [self.view addSubview:self.smallFoxView];
}

- (void)setupSmallFoxViewAnimation {
    // 创建CAKeyframeAnimation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    // 动画结束之后的回调
    animation.duration = 4;
    animation.repeatCount = CGFLOAT_MAX;
    animation.values = [self animationImageArray];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.smallFoxView.layer addAnimation:animation forKey:@"smallFoxViewKey"];
}

/// 获取图片
- (NSArray *)animationImageArray {
    NSMutableArray *imagesArray = [NSMutableArray array];
    // 获取帧图名称
    NSArray *imagesStringArray = [self radioDramaStateAnimationImageNames];
    // 解析图片
    for (NSString *imageString in imagesStringArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:imageString ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (image) {
            [imagesArray addObject:(__bridge id)image.CGImage];
        }
    }
    return imagesArray.copy;
}

/// 获取图片名称数组
- (NSArray *)radioDramaStateAnimationImageNames {
    return @[
        @"mb_image_tabbar_radiodrama_72",
        @"mb_image_tabbar_radiodrama_73",
        @"mb_image_tabbar_radiodrama_74",
        @"mb_image_tabbar_radiodrama_75",
        @"mb_image_tabbar_radiodrama_76",
        @"mb_image_tabbar_radiodrama_77",
        @"mb_image_tabbar_radiodrama_78",
        @"mb_image_tabbar_radiodrama_79",
        @"mb_image_tabbar_radiodrama_80",
        @"mb_image_tabbar_radiodrama_81",
        @"mb_image_tabbar_radiodrama_82",
        @"mb_image_tabbar_radiodrama_83",
        @"mb_image_tabbar_radiodrama_84",
        @"mb_image_tabbar_radiodrama_85",
        @"mb_image_tabbar_radiodrama_86",
        @"mb_image_tabbar_radiodrama_87",
        @"mb_image_tabbar_radiodrama_88",
        @"mb_image_tabbar_radiodrama_89",
        @"mb_image_tabbar_radiodrama_90",
        @"mb_image_tabbar_radiodrama_91",
        @"mb_image_tabbar_radiodrama_92",
        @"mb_image_tabbar_radiodrama_93",
        @"mb_image_tabbar_radiodrama_94",
        @"mb_image_tabbar_radiodrama_95",
        @"mb_image_tabbar_radiodrama_96",
        @"mb_image_tabbar_radiodrama_97",
        @"mb_image_tabbar_radiodrama_98"
    ];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.smallFoxView.layer removeAnimationForKey:@"smallFoxViewKey"];
}

@end

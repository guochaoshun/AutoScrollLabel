//
//  YZNumberScrollAnimationController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/5.
//

#import "YZNumberScrollAnimationController.h"
#import "YZNumberScrollView.h"

@interface YZNumberScrollAnimationController ()

/// textView
@property (nonatomic, strong) YZNumberScrollView *textView;

@end

@implementation YZNumberScrollAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textView = [[YZNumberScrollView alloc] initWithFrame:CGRectMake(100, 200, 60, 39)];
    [self.view addSubview:self.textView];
    
    self.textView.textColor = [UIColor greenColor];
    self.textView.duration = 2;
    [self.textView configNumber:@(239)];
    [self.textView configFont:[UIFont systemFontOfSize:24]];
    
    [self.textView startAnimation];
}


@end

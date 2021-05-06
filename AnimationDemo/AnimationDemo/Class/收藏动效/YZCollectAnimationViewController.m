//
//  YZCollectAnimationViewController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZCollectAnimationViewController.h"
#import "YZCollectAnimationButton.h"

@interface YZCollectAnimationViewController ()

/// 收藏动画
@property (nonatomic, strong) YZCollectAnimationButton *collectionButton;
/// 是否收藏
@property (nonatomic, assign) BOOL isCollect;

@end

@implementation YZCollectAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.collectionButton = [[YZCollectAnimationButton alloc] initCollectionButton:@"mb_icon_radio_player_page_collect_s" unselectImageName:@"mb_icon_radio_player_page_collect_p"];
    [self.view addSubview:self.collectionButton];
    self.collectionButton.frame = CGRectMake(100, 200, 100, 100);
    [self.collectionButton addTarget:self action:@selector(collectAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)collectAction {
    self.isCollect = !self.isCollect;
    [self.collectionButton updateCollectionButtonState:self.isCollect animation:YES];
}


@end

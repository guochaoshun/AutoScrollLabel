//
//  YZLabelAnimationController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZLabelAnimationController.h"
#import "YZTranslationAnimationLabel.h"

@interface YZLabelAnimationController ()

@property (nonatomic, strong) YZTranslationAnimationLabel *anmationLabel;

@end

@implementation YZLabelAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.anmationLabel = [[YZTranslationAnimationLabel alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    [self.view addSubview:self.anmationLabel];
    [self.anmationLabel updateContentText:@"十年生死两茫茫,不思量,自难忘。千里孤坟,无处话凄凉"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.anmationLabel startAnimiation];
}

@end

//
//  YZAutoScrollLabel.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "YZAutoScrollLabel.h"

@interface YZAutoScrollLabel ()

@property (nonatomic, strong) UIScrollView *scrollView;
/// 滚动label
@property (nonatomic, strong) UILabel *sportsLabel;
/// 占位显示label
@property (nonatomic, strong) UILabel *holderLabel;
/// displayLink
@property (nonatomic, strong) CADisplayLink *displayLink;
/// 当前的位移
@property (nonatomic, assign) CGFloat currentX;
/// 纯文本的宽度
@property (nonatomic, assign) CGFloat textWidth;
/// 文本和空格的宽度
@property (nonatomic, assign) CGFloat textBlankWidth;
/// 记录循环次数
@property (nonatomic, assign) CGFloat recordRepeatCount;

@end

@implementation YZAutoScrollLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        [self setupSubViews];
        self.currentX = 0.0f;
        self.speed = 0.5;
        self.repeatCount = MAXFLOAT;
        self.textFont = [UIFont systemFontOfSize:13];
        self.textAlignment = NSTextAlignmentLeft;
        self.bgColor = [UIColor clearColor];
        self.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)setupSubViews {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    self.sportsLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [scrollView addSubview:self.sportsLabel];
    
    self.holderLabel = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:self.holderLabel];
    self.holderLabel.lineBreakMode = NSLineBreakByClipping;
    self.holderLabel.hidden = NO;
    self.sportsLabel.hidden = YES;
}

- (void)startAnimation {
    [self stopAnimation];
    self.currentX = 0.0f;
    self.recordRepeatCount = self.repeatCount;
    if (self.textWidth > self.frame.size.width) { //当文字超出边界才需要滚动
        self.holderLabel.hidden = YES;
        self.sportsLabel.hidden = NO;
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updatePosition)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)pauseAnimation {
    if (self.displayLink) {
        self.displayLink.paused = YES;
    }
}

- (void)stopAnimation {
    if (self.displayLink) {
        self.displayLink.paused = YES;
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    self.holderLabel.hidden = NO;
    self.sportsLabel.hidden = YES;
    [self.scrollView setContentOffset:CGPointZero];
}

- (void)updatePosition {
    if (self.currentX > self.textBlankWidth ) {
        self.currentX = 0;
        if (self.recordRepeatCount != MAXFLOAT) {
            self.recordRepeatCount --;
        }
    }
    NSLog(@"currentX --- %@",@(self.currentX));
    [self.scrollView setContentOffset:CGPointMake(self.currentX, self.scrollView.contentOffset.y)];
    self.currentX += self.speed;
    if (self.recordRepeatCount == 0) {//滚到左对齐时停止
        [self.scrollView setContentOffset:CGPointMake(self.textBlankWidth, self.scrollView.contentOffset.y)];
        [self stopAnimation];
    }
}

#pragma mark - interface methods

- (void)setLabelText:(NSString *)labelText {
    [self stopAnimation];
    /** 计算label的长度 */
    //计算纯文本的宽度
    self.sportsLabel.text = [NSString stringWithFormat:@"%@",labelText];
    [self.sportsLabel sizeToFit];
    self.textWidth = self.sportsLabel.bounds.size.width;

    //计算文本+空格的宽度
    self.sportsLabel.text = [NSString stringWithFormat:@"%@%@",labelText,[self blank]];
    [self.sportsLabel sizeToFit];
    self.textBlankWidth = self.sportsLabel.bounds.size.width;

    //当前的位置大小
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

    CGFloat sportsLabelHeight = self.sportsLabel.bounds.size.height;
    CGFloat sportsLabelY = (self.frame.size.height - sportsLabelHeight) * 0.5;

    self.sportsLabel.frame = CGRectMake(0, sportsLabelY, self.frame.size.width, sportsLabelHeight);
    self.sportsLabel.text = [NSString stringWithFormat:@"%@%@%@", labelText, [self blank], labelText];

    [self.sportsLabel sizeToFit];

    [self.holderLabel setFrame:CGRectMake(0, sportsLabelY, self.frame.size.width, self.sportsLabel.bounds.size.height)];
    self.holderLabel.text = labelText;

    [self.scrollView setContentSize:self.sportsLabel.bounds.size];
    self.currentX = 0.0f;
}

// 文字拼接间隔
- (NSString *)blank {
    return @"     ";
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    self.sportsLabel.font = self.textFont;
    self.holderLabel.font = self.textFont;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.sportsLabel.textColor = self.textColor;
    self.holderLabel.textColor = self.textColor;
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = self.bgColor;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    self.sportsLabel.textAlignment = textAlignment;
    self.holderLabel.textAlignment = textAlignment;
}

- (void)setRepeatCount:(CGFloat)repeatCount{
    _repeatCount = repeatCount;
    self.recordRepeatCount = repeatCount;
}

- (void)dealloc {
    NSLog(@"zhuzhu--%s", __func__);
}

@end

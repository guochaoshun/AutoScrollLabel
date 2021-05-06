//
//  YZNumberScrollView.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/5.
//

#import "YZNumberScrollView.h"

@interface YZNumberScrollView ()

@property (nonatomic, strong) NSMutableArray *textShowArray;
@property (nonatomic, strong) NSMutableArray *textViewArray;
@property (nonatomic, strong) NSMutableArray *textLayerArray;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) UIFont *font;

@end

@implementation YZNumberScrollView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:25];
        self.textColor = [UIColor whiteColor];
        self.duration = 1;
        self.dealyTime = 0.2;
    }
    return self;
}

- (void)configFont:(UIFont *)font {
    self.font = font;
    //设置number后设置font
    if (self.number) {
        [self removeAll];
        [self configNumber:self.number];
    }
}

- (void)configNumber:(NSNumber *)number {
    self.number = number;
    [self removeAll];
    NSString *exreaShowNumber = @"1234567890";
    NSString *numberString = [NSString stringWithFormat:@"%@",number];
    for (NSInteger index = 0; index < numberString.length; index ++) {
        [self.textShowArray addObject:[numberString substringWithRange:NSMakeRange(index, 1)]];
    }
    CGFloat everySeperate = self.frame.size.width / self.textShowArray.count;
    CGFloat fontSize = self.font.pointSize;
    CGFloat textHeight = 15;
    CGFloat margin = (fontSize - textHeight)/2.0;
    CGFloat layerHeight = fontSize + 4;
    for (NSInteger index = 0; index < numberString.length; index ++) {
        UITextView *yyTextView = [[UITextView alloc] init];
        yyTextView.frame = CGRectMake(0, margin, fontSize, textHeight);
        NSString *currentString = [self.textShowArray objectAtIndex:index];
        yyTextView.text = [NSString stringWithFormat:@"%@%@",exreaShowNumber,currentString];
        yyTextView.font = self.font;
        [yyTextView sizeToFit];
        self.contentHeight = yyTextView.frame.size.height;
        yyTextView.backgroundColor = [UIColor clearColor];
        yyTextView.textAlignment = NSTextAlignmentCenter;
        yyTextView.textColor = self.textColor;
        yyTextView.showsHorizontalScrollIndicator = NO;
        yyTextView.showsVerticalScrollIndicator = NO;
        [self.textViewArray addObject:yyTextView];

        CAScrollLayer *containerLayer = [[CAScrollLayer alloc] init];
        [self.layer addSublayer:containerLayer];
        containerLayer.frame = CGRectMake(everySeperate * index, 0,fontSize , layerHeight);
        [containerLayer addSublayer:yyTextView.layer];
        [self.textLayerArray addObject:containerLayer];
    }
}

- (void)startAnimation {
    for (UITextView *textView in self.textViewArray) {
        textView.textColor = [UIColor clearColor];
    }
    for (NSInteger index = self.textShowArray.count - 1; index >= 0; index--) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(index * self.dealyTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self createAnimateForIndex:self.textShowArray.count - 1 - index];
        });
    }
}

- (void)createAnimateForIndex:(NSInteger)index {
    UITextView *textView = [self.textViewArray objectAtIndex:index];
    textView.textColor = self.textColor;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sublayerTransform.translation.y"];
    animation.duration = self.duration;
    animation.fromValue = @(0);
    NSString *currentString = [self.textShowArray objectAtIndex:index];
    animation.toValue = @(-self.contentHeight + [self getHeight: currentString] * 1.05);
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CALayer *currentLayer = [self.textLayerArray objectAtIndex:index];
    [currentLayer addAnimation:animation forKey:@"ULNumberAnimatedView"];
}

- (void)removeAllAnimation {
    for (UITextView *textView in self.textViewArray) {
        [textView.layer removeAllAnimations];
    }
    for (CALayer *layer in self.textLayerArray) {
        [layer removeAllAnimations];
    }
}

- (void)removeAll {
    for (UITextView *textView in self.textViewArray) {
        [textView.layer removeAllAnimations];
        [textView.layer removeFromSuperlayer];
    }
    for (CALayer *layer in self.textLayerArray) {
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
    }
    [self.textShowArray removeAllObjects];
    [self.textViewArray removeAllObjects];
    [self.textLayerArray removeAllObjects];
}

- (CGFloat)getHeight:(NSString *)string {
    return [string boundingRectWithSize:CGSizeMake(self.font.pointSize, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : self.font} context:nil].size.height;
}
- (CGFloat)getWidth:(NSString *)string {
    // 1.5 是为了缩小字间距
    return self.font.pointSize /1.5 * string.length;
}

- (NSMutableArray *)textViewArray {
    if (!_textViewArray) {
        _textViewArray = [NSMutableArray array];
    }
    return  _textViewArray;
}

- (NSMutableArray *)textShowArray {
    if (!_textShowArray) {
        _textShowArray = [NSMutableArray array];
    }
    return  _textShowArray;
}

- (NSMutableArray *)textLayerArray {
    if (!_textLayerArray) {
        _textLayerArray = [NSMutableArray array];
    }
    return  _textLayerArray;
}

- (void)dealloc {
    [self removeAllAnimation];
}

@end

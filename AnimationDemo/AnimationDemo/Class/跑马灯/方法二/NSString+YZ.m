//
//  NSString+YZ.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/4.
//

#import "NSString+YZ.h"

@implementation NSString (YZ)

- (CGSize)sizeWithSystemFontOfSize:(UIFont *)font maxHeight:(CGFloat)hegiht {
    CGSize textSize = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName:font};
    textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, hegiht)
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:attribute
                                  context:nil].size;
    textSize.width = ceilf(textSize.width);
    textSize.height = ceilf(textSize.height);
    return textSize;
}

@end

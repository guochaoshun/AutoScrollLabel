//
//  YZListRowNode.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/3.
//

#import "YZListRowNode.h"

@implementation YZListRowNode

+ (YZListRowNode *)listRowNode:(NSString *)title jumpClassName:(NSString *)jumpClassName {
    YZListRowNode *rowNode = [[YZListRowNode alloc] init];
    rowNode.title = title;
    rowNode.jumpClassName = jumpClassName;
    return rowNode;
}

@end

//
//  YZListRowNode.h
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZListRowNode : NSObject

/// 名字
@property (nonatomic, copy) NSString *title;
/// 跳转的类
@property (nonatomic, copy) NSString *jumpClassName;

+ (YZListRowNode *)listRowNode:(NSString *)title jumpClassName:(NSString *)jumpClassName;

@end

NS_ASSUME_NONNULL_END

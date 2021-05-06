//
//  YZLabelScrollViewOneController.m
//  AnimationDemo
//
//  Created by liyazhu on 2021/5/3.
//  跑马灯第一种实现方法：用CADisplayLink

#import "YZLabelScrollViewOneController.h"
#import "YZAutoScrollLabel.h"

@interface YZLabelScrollViewOneController ()

/// 跑马灯
@property (nonatomic, strong) YZAutoScrollLabel *scrollLabel;

@end

@implementation YZLabelScrollViewOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollLabel = [[YZAutoScrollLabel alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    [self.view addSubview:self.scrollLabel];
    self.scrollLabel.labelText = @"十年生死两茫茫,不思量,自难忘。千里孤坟,无处话凄凉";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.scrollLabel startAnimation];
}

- (void)dealloc {
    [self.scrollLabel stopAnimation];
}

/*
 在开发中我们经常会遇到使用计时器的情况,例如图片轮播,进度条的绘制等就是比较常见的应用场景.
 常用的计时器有CADisplayLink和NSTimer.

 CADisplayLink概括

 CADisplayLink是用于同步屏幕刷新频率的计时器.下面会对CADisplayLink的用法进行介绍,除外,还会对CADisplayLink的扩展用法进行说明,继续看下去,相信你会有所收获.

 CADisplayLink使用方法

 初始化

 通过+ (CADisplayLink *)displayLinkWithTarget:(id)target selector:(SEL)sel初始化link对象

 添加到runloop

 如果想开启link需要把link加入到runloop中: - (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode.除非计时器被停止,否则每次屏幕刷新时,计时器的方法都会被触发.

 每个计时器对象只能加入到一个runloop中,但是可以被添加到不同的模式中,当CADisplayLink被加入到runloop时,会被runloop隐式retain.如果想从所有的模式中移除计时器,需要执行-invalidate()方法.

 从runloop中移除

 移除计时器有两个方法:- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode和- (void)invalidate.
 我们来分析一下他们的异同

 - removeFromRunLoop: forMode:会将接收者从给定的模式中移除,这个方法会对计时器进行隐式的release.在调用removeFromRunloop方法,需要做判断,如果当期计时器不在runloop的话,会出现野指针的crash.出现crash的原因是runloop多次调用了release方法,进行了over-release.

 - (void)invalidate是从runloop所有模式中移除计时器,并取消计时器和target的关联关系.多次调用这个方法,不会出现crash.

 CADisplayLink的扩展用法

 通过对CADisplayLink的属性分析和讲解,来阐述计时器的扩展用法.

 时间戳

 时间戳timestamp,这个属性用来返回上一次屏幕刷新的时间戳.如果视频播放的应用,可以通过时间戳来获取上一帧的具体时间,来计算下一帧.

 间隔时间

 duration属性用于提供屏幕最大刷新频率(maximumFramesPerSecond)下每一帧的时间间隔.这个属性可以用于在应用中获取帧率.

 暂停和开启

 isPaused设置为true时可以用于暂停通知.

 修改帧率

 修改帧率 : 如果在特定帧率内无法提供对象的操作,可以通过降低帧率解决.一个拥有持续稳定但是较慢帧率的应用要比跳帧的应用顺滑的多.
 可以通过preferredFramesPerSecond来设置每秒刷新次数.preferredFramesPerSecond默认值为屏幕最大帧率(maximumFramesPerSecond),目前是60.
 实际的屏幕帧率会和preferredFramesPerSecond有一定的出入,结果是由设置的值和屏幕最大帧率(maximumFramesPerSecond)相互影响产生的.规则大概如下:

 如果屏幕最大帧率(preferredFramesPerSecond)是60,实际帧率只能是15, 20, 30, 60中的一种.如果设置大于60的值,屏幕实际帧率为60.如果设置的是26~35之间的值,实际帧率是30.如果设置为0,会使用最高帧率.

 作者：sea_biscute
 链接：https://www.jianshu.com/p/a96a65093c3b
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

@end

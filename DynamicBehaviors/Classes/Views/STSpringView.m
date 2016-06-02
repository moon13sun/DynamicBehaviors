//
//  STSpringView.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STSpringView.h"

@implementation STSpringView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置附着行为的振幅和频率
        // 振幅
        _attachment.damping = 0.5;
        // 频率
        _attachment.frequency = 0.5;
        
        // 方案1:
//        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
//        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
        // 方案2:
        [_boxView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionOld context:nil];
        
    }
    return self;
}



// KVO的监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    [self setNeedsDisplay];
    
}

#pragma mark - 2.移除监听者
- (void)dealloc {
    
    [_boxView removeObserver:self forKeyPath:@"center"];
}

#pragma mark - 1.定时器监听方法
- (void)refresh{
    
    [self setNeedsDisplay];
}


@end










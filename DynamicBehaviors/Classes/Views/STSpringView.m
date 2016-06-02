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
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];


    }
    return self;
}

- (void)refresh{
    
    [self setNeedsDisplay];
}


@end










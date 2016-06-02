//
//  STSnapView.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STSnapView.h"

@implementation STSnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 点按
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        [self addGestureRecognizer:tap];
        
    }
    return self;
}


#pragma mark - 1.实现点按方法
- (void)tapAction:(UITapGestureRecognizer *)recognizer{
    
    /**
     *  每次进来,首先移除所有行为,否则,只能吸附一次
     */
    [_animator removeAllBehaviors];
    
    //MARK: - 1.获取点击的点
    CGPoint location = [recognizer locationInView:recognizer.view];
    
    //MARK: - 2.添加仿真行为 - 吸附
    // 1.创建仿真行为 - snap
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:_boxView snapToPoint:location];
    
    // 2.将仿真行为交给 仿真者
    [_animator addBehavior:snap];
}




@end













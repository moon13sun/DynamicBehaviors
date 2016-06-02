//
//  STBasicView.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STBasicView.h"

@implementation STBasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 设置界面
        [self setupUI];
        
    }
    return self;
}

#pragma mark - 1.设置界面
- (void)setupUI{
    
    //MARK: - 1.设置背景
    self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
    
    //MARK: - 2.添加 boxView
    UIImageView *boxView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
    
    CGSize size = self.frame.size;
    
    boxView.center = CGPointMake(size.width * 0.5, 100);
    
    [self addSubview:boxView];
    
    //MARK: - 3.赋值
    _boxView = boxView;
    
    //MRAK: - 4.创建仿真者
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
}



@end

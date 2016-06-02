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
    
    boxView.center = CGPointMake(size.width / 2, 100);
    
//    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    [self addSubview:boxView];
    
}



@end

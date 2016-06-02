//
//  STAttachmentView.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STAttachmentView.h"

@interface STAttachmentView (){
    
    /**
     *  附着行为
     */
    UIAttachmentBehavior *_attachment;
    
    /**
     *  offset 图框
     */
    UIImageView *_offsetImgView;
    
    
    /**
     * 附着点图框
     */
    UIImageView *_anchorImgView;
}

@end

@implementation STAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //MARK: - 1.需要先添加仿真行为 - 附着行为
        
        // 1.附着点 和 offSet 点
        CGPoint anchorPoint = CGPointMake(self.center.x, 300);
        UIOffset offset = UIOffsetMake(20, 20);
        
        // 2.创建附着仿真行为
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:_boxView offsetFromCenter:offset attachedToAnchor:anchorPoint];
        
        // 3.添加给仿真者
        [_animator addBehavior:attachment];
        
        // 4.赋值
        _attachment = attachment;
        
        //MARK: - 2.添加附着点图框 和 offset 图框
        // 1.加载图片
        UIImage *circle = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        
        // 2.添加 附着点图片框
        UIImageView *anchorImgView = [[UIImageView alloc] initWithImage:circle];
        
        anchorImgView.center = anchorPoint;
        
        // 添加
        [self addSubview:anchorImgView];
        
        // 赋值
        _anchorImgView = anchorImgView;
        
        // 3.添加 offset 图片框
        UIImageView *offsetView = [[UIImageView alloc] initWithImage:circle];
        
        CGSize boxViewSize = _boxView.bounds.size;
        
        // 设置 center
        offsetView.center = CGPointMake(boxViewSize.width * 0.5 + offset.horizontal, boxViewSize.height * 0.5 + offset.vertical);
        
        // 添加
        [_boxView addSubview:offsetView];
        
        // 赋值
        _offsetImgView = offsetView;
        
        //MARK: 3.- 添加拖拽手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
        
    }
    return self;
}


#pragma mark - 1.实现拖拽方法
- (void)panAction:(UIPanGestureRecognizer *)recognizer{
    
    // 获取触摸点
    CGPoint location = [recognizer locationInView:recognizer.view];
    
    // 修改附着点
    _attachment.anchorPoint = location;
    
    // 修改附着点图框位置
    _anchorImgView.center = location;
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    // 1.创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.设置起点
    [path moveToPoint:_anchorImgView.center];
    
    // 3.画线
    // 3.1转换offsetView 的坐标系
    CGPoint endPoint = [self convertPoint:_offsetImgView.center fromView:_boxView];
    
    // 3.2 画线
    [path addLineToPoint:endPoint];
    
    // 3.2.2 设置线属性
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0] setStroke];
    
    // 4.渲染
    [path stroke];

    
    
}



@end

















//
//  STPushView.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STPushView.h"

@interface STPushView (){
    
    /**
     *  当前点
     */
    CGPoint _currentPoint;
    
    /**
     * 起点view
     */
    UIImageView *_smallCircleView;
    
}

@end

@implementation STPushView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
#warning - 注意,看看为什么?
        // 初始化界面  --> 这里不能调用 setupUI 方法
//        [self setupUI];
        
        //MARK: - 1.图片框
        UIImageView *smallCircleV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        // 1.2隐藏图片框
        smallCircleV.hidden = YES;
        
        smallCircleV.center = CGPointZero;
        
        //MARK: - 2.添加到view 上
        [self addSubview:smallCircleV];
        
        //MARK: - 3.添加拖拽手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        //MARK: - 4.赋值
        _smallCircleView = smallCircleV;
        
    }
    return self;
}

#pragma mark - 拖拽手势的方法
- (void)panAction:(UIPanGestureRecognizer *)recognizer{
    
    //MARK: - 1.获取当前点
    CGPoint location = [recognizer locationInView:recognizer.view];
    
    //MARK: - 2.根据不同状态,执行不同操作
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        // 将起点图片框移到当前点
        _smallCircleView.center = location;
        
        // 显示图片框
        _smallCircleView.hidden = NO;
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        // 记录当前点
        _currentPoint = location;
        
        // 重绘
        [self setNeedsDisplay];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        // 隐藏 起点
        _smallCircleView.hidden = YES;
        
        // 清除线条
        _smallCircleView.center = CGPointZero;
        
        _currentPoint = CGPointZero;
        
        [self setNeedsDisplay];
    }
    
    
}

#pragma mark - 2.重写 drawRect 方法

- (void)drawRect:(CGRect)rect{
    
#warning 为什么,开始运行,左上角总是有一个点
    
    // 1.创建 路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 2.起点
    [path moveToPoint:_smallCircleView.center];
    
    // 3.划线
    [path addLineToPoint:_currentPoint];
    
    NSLog(@"%@--%@",NSStringFromCGPoint(_currentPoint),NSStringFromCGPoint(_smallCircleView.center));
    
    // 3.1 设置线条属性
    // 宽度
    path.lineWidth = 10;
    
    // 颜色
    [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0] setStroke];
    
    // 线头样式
    path.lineCapStyle = kCGLineCapRound;
    
    // 4.渲染
    [path stroke];
}




@end










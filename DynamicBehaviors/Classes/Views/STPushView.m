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
     *  push 仿真
     */
    
    UIPushBehavior *_push;
    
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
        
        //MARK: - 1.添加起点图片框
        // 1.图片框
        UIImageView *smallCircleV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        // 1.2隐藏图片框
        smallCircleV.hidden = YES;
        
//        smallCircleV.center = CGPointZero;
        
        // 2.添加到view 上
        [self addSubview:smallCircleV];
        
        // 3.赋值
        _smallCircleView = smallCircleV;
        
        //MARK: - 2.添加仿真推动行为
        // 1.创建仿真推动行为
        UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[_boxView] mode:UIPushBehaviorModeContinuous];
        
        // 2.交给仿真者
        [_animator addBehavior:push];
        
        // 3.赋值
        _push = push;
        
        //MARK: - 3.添加仿真碰撞检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[_boxView]];
        
        // 添加边界
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        // 交给仿真者
        [_animator addBehavior:collision];
        
        //MARK: - 3.添加手势行为
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];

        
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
        
        // 1.隐藏 起点
        _smallCircleView.hidden = YES;
        
        // 2.让 boxView 移动
        
        // 计算力度 和角度
        // 计算偏移量
        CGFloat offsetX = _smallCircleView.center.x - _currentPoint.x;
        CGFloat offsetY = _smallCircleView.center.y - _currentPoint.y;
        
        // 计算力度(斜边长度)
        CGFloat distance = hypot(offsetY, offsetX);
        
        // 计算角度
        CGFloat angle = atan2(offsetY, offsetX);
        
        // 3.设置仿真行为属性
        _push.angle = angle;
        _push.magnitude = distance;
        _push.active = YES; // 单次推动需要打开
        
        // 4.清除线条
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










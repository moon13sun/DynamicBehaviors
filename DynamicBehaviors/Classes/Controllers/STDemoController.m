//
//  STDemoController.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STDemoController.h"
#import "STBasicView.h"
#import "STSnapView.h"
#import "STPushView.h"
#import "STAttachmentView.h"
#import "STSpringView.h"
#import "STCollisionView.h"

typedef NS_ENUM(NSInteger,DynamicType) {
    
    DynamicSnap,
    DynamicPush,
    DynamicAttachment,
    DynamicSpring,
    DynamicCollision
};

@interface STDemoController ()


@end

@implementation STDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
//    [self.view addSubview:basicView];
    // 根据 index 值,来判断加载哪个仿真视图
    
    // 定义一个父 view---> 这里是多态,父view对象 指向子类对象
    STBasicView *basicView;
    
    switch (self.index) {
            
        case DynamicSnap:
        {
            basicView = [[STSnapView alloc] initWithFrame:self.view.bounds];
            
        }
            break;
            
        case DynamicAttachment:
        {
            
            basicView = [[STPushView alloc] initWithFrame:self.view.bounds];
        }
            break;
            
        case DynamicPush:
        {
            
            basicView = [[STAttachmentView alloc] initWithFrame:self.view.bounds];
        }
            break;
            
        case DynamicSpring:
        {
            basicView = [[STSpringView alloc] initWithFrame:self.view.bounds];
            
        }
            break;
            
        case DynamicCollision:
        {
            
            basicView = [[STCollisionView alloc] initWithFrame:self.view.bounds];
        }
            break;

            
        default:
            break;
    }
    
    [self.view addSubview:basicView];
    
}




@end















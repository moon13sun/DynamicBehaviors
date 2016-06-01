//
//  STDemoController.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STDemoController.h"
#import "STBasicView.h"

@interface STDemoController ()

@end

@implementation STDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor magentaColor];
    
    self.navigationController.navigationBar.translucent = NO;
    
    STBasicView *basicView = [[STBasicView alloc] initWithFrame:self.view.bounds];
    
//    basicView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    [self.view addSubview:basicView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
@end















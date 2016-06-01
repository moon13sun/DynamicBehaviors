//
//  AppDelegate.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "AppDelegate.h"
#import "STListController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //MARK: - 1.创建窗口
    self.window = [[UIWindow alloc] init];
    
    //MARK: - 2.设置跟控制器
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[STListController alloc] init]];
    
    //MARK: - 3.成为主窗口,并可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end






















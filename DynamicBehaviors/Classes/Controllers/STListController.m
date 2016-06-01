//
//  STListController.m
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STListController.h"
#import "STDemoController.h"

@interface STListController (){
    
    /**
     *  绑定仿真行为名称数组
     */
    NSArray *_behavioursArr;
    
    
}




@end

@implementation STListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: 1.设置 导航栏
    self.navigationItem.title = @"仿真行为列表";
    
    _behavioursArr = @[
                              @"吸附行为",
                              @"推动行为",
                              @"刚性附着行为",
                              @"弹性附着行为",
                              @"碰撞检测行为"
                              ];
}

#pragma mark - 1.实现数据源方法
// sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

// rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _behavioursArr.count;
}

// cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //MARK: - 1.创建cell
    static NSString *ID = @"behaviours";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //MARK: - 2.设置数据
    cell.textLabel.text = _behavioursArr[indexPath.row];
    
    //MARK: - 3.返回cell
    return cell;
}

#pragma mark - 2.实现代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    STDemoController *demoCv = [[STDemoController alloc] init];
    
    [self.navigationController pushViewController:demoCv animated:YES];
}

@end



















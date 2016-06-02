//
//  STBasicView.h
//  DynamicBehaviors
//
//  Created by leergou on 16/6/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBasicView : UIView {
    
    
    /**
     *  定义属性 boxView 在子类中访问
     */
    UIImageView *_boxView;
    
    /**
     *  仿真者 :在子类中访问
     */
    UIDynamicAnimator *_animator;
}




@end

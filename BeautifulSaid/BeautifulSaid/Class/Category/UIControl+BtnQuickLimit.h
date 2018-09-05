//
//  UIButton+BtnQuickLimit.h
//  NSObjectMethod
//
//  Created by power on 2018/9/5.
//  Copyright © 2018年 NumberFive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BtnQuickLimit)
//添加两个属性

// 间隔多少秒才能响应事件
@property(nonatomic, assign) NSTimeInterval  acceptEventInterval;
//是否能执行方法
@property(nonatomic, assign) BOOL ignoreEvent;


@end

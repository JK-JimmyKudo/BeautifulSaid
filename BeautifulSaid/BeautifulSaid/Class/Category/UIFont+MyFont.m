//
//  UIFont+MyFont.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "UIFont+MyFont.h"
#import <objc/runtime.h>
//1. 首先需要创建一个UIFont的分类
//2. 自己UI设计原型图的手机尺寸宽度
#define MyUIScreen  375 // UI设计原型图的手机尺寸宽度(6), 6p的--414


@implementation UIFont (MyFont)

+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/MyUIScreen];
    return newFont;
}

@end

//
//  NSNotifitionHook.m
//  NSObjectMethod
//
//  Created by lzy on 17/1/22.
//  Copyright © 2017年 NumberFive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>
#import <objc/objc.h>
#import <objc/message.h>

static NSMutableDictionary *notifitionInfo;

void notifition_hookMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(cls,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@implementation NSNotificationCenter(_pandaTVWork)
/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notifitionInfo = @{}.mutableCopy;
        notifition_hookMethod([self class] ,@selector(addObserver:selector:name:object:) ,@selector(v_addObserver:selector:name:object:));
        
        notifition_hookMethod([self class] ,@selector(removeObserver:name:object:) ,@selector(v_addObserver:selector:name:object:));
    });
}
*/
/// 删除
- (void)v_removeObserver:(id)observer name:(NSNotificationName)aName object:(id)anObject {
    
    [self v_removeObserver:observer
                      name:aName
                    object:anObject];
    
    NSString *str = [NSString stringWithFormat:@"%lu",(unsigned long)[observer hash]];
    NSArray *list = notifitionInfo[str];
    if (list) {
        NSMutableArray *mlist = list.mutableCopy;
        if ([mlist containsObject:aName]) {
            [mlist removeObject:aName];
            notifitionInfo[str] = mlist;
        }
        if (!mlist || mlist.count == 0) {
            [notifitionInfo removeObjectForKey:str];
        }
    }
}

/// 添加
- (void)v_addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {
    id obj = anObject;
    [self v_addObserver:observer
               selector:aSelector
                   name:aName
                 object:obj];
}

@end
/*
@interface NSObject (pandaTVNSnotifition)

@end


@implementation NSObject (pandaTVNSnotifition)
- (void)myDealloc {
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self myDealloc];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method myDealloc = class_getInstanceMethod(self, @selector(myDealloc));
        Method dealloc = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        method_exchangeImplementations(dealloc, myDealloc);
    });
}


@end
*/

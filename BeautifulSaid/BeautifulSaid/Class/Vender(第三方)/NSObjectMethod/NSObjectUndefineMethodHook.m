//
//  NSObjectUndefineMethodHook.m
//  NSObjectMethod
//
//  Created by lzy on 17/1/22.
//  Copyright © 2017年 NumberFive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <objc/runtime.h>
#import <objc/objc.h>
#import <objc/message.h>

#import "NSObject+DLIntrospection.h"


///< 拷贝一下代码，到项目中 防止 instance 出现 方法找不到的情况
static int pandaTVCC(id slf, SEL selector) {
    return 0;
}

static NSLock *_lock;
/// 所有找不到的方法会走到这个方法

@implementation NSObject(pandaTV)

+ (void)_hookMethod:(Class)cls OriginSelector:(SEL)originalSelector SwizzledSelector:(SEL)swizzledSelector {
    
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

- (id)v_forwardingTargetForSelector:(SEL)sel1 {
#ifdef DEBUG
    //return [self v_forwardingTargetForSelector:sel1];
#endif
    
    SEL sel = NSSelectorFromString(@"forwardingTargetForSelector:");
    Method method = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel);
    
    
    Method _m = class_getInstanceMethod([self class],sel);
    /// 类本身有没有实现消息转发流程
    BOOL transmit = method_getImplementation(_m) == method_getImplementation(method);
    /// 有木有实现下一步消息转发流程
    if (transmit) {
        /// 判断有没有实现
        SEL sel1 = NSSelectorFromString(@"methodSignatureForSelector:");
        Method method1 = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel1);
        
        Method _m1 = class_getInstanceMethod([self class],sel1);
        transmit = method_getImplementation(_m1) == method_getImplementation(method1);
    }
    if (transmit) {        /// 创建一个新类
        
        NSString *errClassName = NSStringFromClass([self class]);
        NSString *errSel = NSStringFromSelector(sel1);
        NSLog(@"出问题的类，出问题的方法 == %@ %@",errClassName, errSel);
        
        NSString *className = @"PandaClass";
        Class cls = NSClassFromString(className);
        
        if (!cls) {
            Class superCls = [NSObject class];
            cls = objc_allocateClassPair(superCls, className.UTF8String, 0);
            class_addMethod(cls, sel1, (IMP)pandaTVCC, "@@:@");
            objc_registerClassPair(cls);
        }
        
        if (!class_getInstanceMethod(NSClassFromString(className), sel1)) {
            class_addMethod(cls, sel1, (IMP)pandaTVCC, "@@:@");
        }
        
#ifdef DEBUG
        /// 打印出 PandaClass 动态添加的所有方法
        NSLog(@"⚠️⚠️⚠️所有出问题的方法 %@ ",[cls instanceMethods]);
#endif
        
        
        return [[NSClassFromString(className) alloc] init];
    }
    /// 走正常的消息转发流程
    return [self v_forwardingTargetForSelector:sel1];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _lock = [NSLock new];
        [self _hookMethod:[NSObject class]
           OriginSelector:@selector(forwardingTargetForSelector:)
         SwizzledSelector:@selector(v_forwardingTargetForSelector:)];
        
    });
}

@end

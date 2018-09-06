//
//  MBProgressHUD+KJExtensuon.m
//  CustomCamera
//
//  Created by apple on 2017/6/20.
//  Copyright © 2017年 jiankangzhan. All rights reserved.
//

#import "MBProgressHUD+KJExtension.h"
#import <MBProgressHUD.h>
#import "UIView+Extension.h"

@implementation MBProgressHUD (KJExtension)

+ (void)showHUD
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    hud.margin = 12;
    hud.square = YES;
    hud.animationType = MBProgressHUDAnimationZoomOut;
    //    hud.offset = CGPointMake(0.f, 0.f);
    hud.label.text = @"加载中...";
    hud.label.font = [UIFont systemFontOfSize:14.f];
}

+ (void)showHUDWithText:(NSString *)msg
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.margin = 12;
    hud.square = YES;
    hud.animationType = MBProgressHUDAnimationZoomOut;
    //    hud.offset = CGPointMake(0.f, 0.f);
    hud.label.text = msg;
    hud.label.font = [UIFont systemFontOfSize:14.f];
}

+ (void)showCustonHUDWithText:(NSString *)msg {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    
    hud.margin = 12;
    hud.square = YES;
    
    hud.label.text = msg;
    hud.label.font = [UIFont systemFontOfSize:14.f];
    
    [hud hideAnimated:YES afterDelay:2.5];
}


+ (void)showMessageWithText:(NSString *)msg
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    
    hud.bezelView.backgroundColor = [UIColor blackColor];
    
    hud.animationType = MBProgressHUDAnimationZoomOut;
    
    hud.margin = 12;

    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    hud.label.font = [UIFont systemFontOfSize:14.f];
    hud.label.textColor = [UIColor whiteColor];

    hud.offset = CGPointMake(0.f, 0.f);
    [hud hideAnimated:YES afterDelay:2.5];
}

+ (MBProgressHUD *)showImageMessage:(NSString *)message ToView:(UIView *)view {
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    if (message == nil) {message = @"加载中...";}
    // 快速显示一个提示信息
    
    UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  50,  50)];
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    for(int i = 1; i <= 10 ; i++){
        NSString *imgName = [NSString stringWithFormat:@"Refresh%d",i];
        [imageArray addObject:[UIImage imageNamed:imgName]];
    }
    images.animationDuration = 0.7;
    images.animationImages = imageArray;
    //开始播放
    [images startAnimating];
    //自定义
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = [UIColor clearColor];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = images;
    hud.labelText = message;
    hud.labelColor = [UIColor grayColor];
    return hud;
    
}


+ (void)hideHUD
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:keyWindow animated:YES];
}

@end

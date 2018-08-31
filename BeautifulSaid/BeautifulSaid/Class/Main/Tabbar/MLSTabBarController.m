//
//  MLSTabBarController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSTabBarController.h"
#import "MLSNavigationController.h"
#import "MLSHomeViewController.h"
#import "MLSCateViewController.h"
#import "MLSShopViewController.h"
#import "MLSMEViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "MLSColor.h"
//#import "YYFPSLabel.h"

@interface MLSTabBarController ()

@end

@implementation MLSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addChildVC:[[MLSHomeViewController alloc]init] title:@"首页" image:@"nav_home_30x30_" selectedImage:@"nav_home_s_30x30_"];
    
    [self addChildVC:[[MLSCateViewController alloc]init] title:@"分类" image:@"nav_cat_30x30_" selectedImage:@"nav_cat_s_30x30_"];
    
    [self addChildVC:[[MLSShopViewController alloc]init] title:@"购物车" image:@"nav_cart_30x30_" selectedImage:@"nav_cart_s_30x30_"];
    
    [self addChildVC:[[MLSMEViewController alloc]init] title:@"我" image:@"nav_me_30x30_" selectedImage:@"nav_me_s_30x30_"];
    
}

#pragma mark - 添加控制器
/**
 *  添加一个子控制器
 *
 *  @param vc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
-(void) addChildVC:(UIViewController *)vc title:(NSString *) title image:(NSString *) image selectedImage:(NSString *)selectedImage{
    
    //设置子控制器的文字
    vc.title = title;
    //设置控制器的tabBarItem的tupian
    vc.tabBarItem.image = [UIImage imageNamed:image];
    //设置控制器选中的图片,禁止图片的渲染
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    MLSNavigationController *navc = [[MLSNavigationController alloc] initWithRootViewController:vc];

    //设置item的按钮
    navc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //设置按钮的未选中的颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[MLSColor colorWithRed:136 withGreen:134 withBlue:135 withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11 ]} forState:UIControlStateNormal];
    //设置选中的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[MLSColor colorWithRed:255 withGreen:0 withBlue:90 withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    
//    [navc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 4)];
    navc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 2);
//    navc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
    
    [self addChildViewController:navc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

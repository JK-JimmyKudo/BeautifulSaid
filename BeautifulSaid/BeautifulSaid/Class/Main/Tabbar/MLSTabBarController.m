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
#import "PWColor.h"
#import "YYFPSLabel.h"


@interface MLSTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MLSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self addChildVC:[[MLSHomeViewController alloc]init] title:@"首页" image:@"nav_home_30x30_" selectedImage:@"nav_home_s_30x30_"];
    
    [self addChildVC:[[MLSCateViewController alloc]init] title:@"分类" image:@"nav_cat_30x30_" selectedImage:@"nav_cat_s_30x30_"];
    
    [self addChildVC:[[MLSShopViewController alloc]init] title:@"购物车" image:@"nav_cart_30x30_" selectedImage:@"nav_cart_s_30x30_"];
    
    [self addChildVC:[[MLSMEViewController alloc]init] title:@"我" image:@"nav_me_30x30_" selectedImage:@"nav_me_s_30x30_"];
    
    self.delegate = self;
    
#if DEBUG
    //显示当前帧率
    [self setupFPSLabel];
#endif
}

#pragma mark -    FPS Label 显示当前帧率
- (void)setupFPSLabel{
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    label.frame = CGRectMake(10, kScreenHeight - 49 - 30 - 10, 60, 30);
    [self.view addSubview:label];
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
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[PWColor colorWithRed:136 withGreen:134 withBlue:135 withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11 ]} forState:UIControlStateNormal];
    //设置选中的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[PWColor colorWithRed:255 withGreen:0 withBlue:90 withAlpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    
//    [navc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 4)];
    navc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 2);
//    navc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1, 0, 1, 0);
    
    [self addChildViewController:navc];
    
    
    
//    self.selectedIndex = 2;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if ( [viewController.tabBarItem.title isEqualToString:@"我"]) {
        
        PWLoginViewController * login = [[PWLoginViewController alloc] init];
        
        [self presentViewController:login animated:YES completion:nil];
        
        return NO;
    }else{
        return YES;
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    
    [self playSound];//点击时音效
    [self animationWithIndex:index];
}

-(void) playSound{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"like" ofType:@"caf"];
    SystemSoundID soundID;
    NSURL *soundURL = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,&soundID);
    AudioServicesPlaySystemSound(soundID);
}
- (void)animationWithIndex:(NSInteger) index {
    if (self.selectedIndex == index) {
        return;
    }
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CATransition* animation = [CATransition animation];
    [animation setDuration:0.3f];
    //动画切换风格
    [animation setType:kCATransitionFade];
    //animation.type = @"cube";
    //动画切换方向
    [animation setSubtype:kCATransitionFromBottom];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[tabbarbuttonArray[index] layer]addAnimation:animation forKey:@"UITabBarButton.transform.scale"];
    
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

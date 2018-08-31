//
//  MLSBaseViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSBaseViewController.h"
#import "MLSHeaderPrefix.pch"
@interface MLSBaseViewController ()

@end

@implementation MLSBaseViewController

-(ZMNavView *)navView{
    if (!_navView) {
        ZMNavView *navView = [[ZMNavView alloc] init];
        [self.view addSubview:navView];
        navView.backgroundColor = [MLSColor whiteColor];
        self.navView = navView;
        [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(64 + KStatusBarHeight);
        }];
        [self.navView.superview layoutIfNeeded];
    }
    return _navView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //禁止自动布局
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    //隐藏自带的导航栏
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - 加载自定义导航
- (void)setupNavView{
    [self navView];
}

#pragma mark - 接收到系统的内存警告时
- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
    /**
     *  YYWebImage 清除缓存
     */
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    
    /**
     *  UIWebView 清除缓存
     */
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    /**
     *  SDWebImage 清除缓存
     */
    [[SDImageCache sharedImageCache] clearMemory];
    
}


@end

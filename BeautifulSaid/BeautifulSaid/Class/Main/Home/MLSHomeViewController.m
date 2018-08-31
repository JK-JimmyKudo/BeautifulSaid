//
//  MLSHomeViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSHomeViewController.h"
@interface MLSHomeViewController ()

@end

@implementation MLSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupNavView];
//    [self setupMainView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//    if (self.mainView) {
//        [self.mainView showUI:[ZMUserInfo shareUserInfo].isLogin];
//    }
    
}
- (void)setupNavView{
    [super setupNavView];
//    [self.navView.centerButton setTitle:@"首页" forState:UIControlStateNormal];
    
}

- (void)setupMainView{
//    self.mainView = [[ZMHomeView alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:self.mainView];
//    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(self.navView.mas_bottom);
//        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-KTabBarHeight);
//    }];
//    self.mainView.nav = self.navView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}



@end

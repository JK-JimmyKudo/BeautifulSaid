//
//  MLSLoginViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSLoginViewController.h"

@interface MLSLoginViewController ()

@end

@implementation MLSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
}

- (void)setupNavView{
    [super setupNavView];
    [self.navView.leftButton setImage:backArrowIcon forState:UIControlStateNormal];
    [self.navView.rightButton setImage:[UIImage imageNamed:@"login_navbar_more"] forState:UIControlStateNormal];
    [self.navView.centerButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.navView.lineLabel.backgroundColor = [UIColor whiteColor];

    WEAKSELF;
    self.navView.leftButtonBlock = ^{
//        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        
        NSLog(@"======");
    };
    
    self.navView.rightButtonBlock = ^{
        NSLog(@"点击右边的按钮");
    };
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

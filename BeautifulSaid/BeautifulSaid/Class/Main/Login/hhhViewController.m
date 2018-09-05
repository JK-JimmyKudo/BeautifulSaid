//
//  hhhViewController.m
//  BeautifulSaid
//
//  Created by PW on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "hhhViewController.h"

@interface hhhViewController ()


@end

@implementation hhhViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
    [self.navView.centerButton setTitle:@"我的订单" forState:UIControlStateNormal];
    
    [self setupUI];
}

-(void)setupUI{

}

//// 触发segmentView事件
//- (void)contenntViewScroll:(CGFloat)pacentage index:(NSInteger)index direction:(NSInteger)direction;
//- (void)contenntViewScrollToIndex:(NSInteger)index;
//- (void)contenntSelectButtonIndex:(NSInteger)index;

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

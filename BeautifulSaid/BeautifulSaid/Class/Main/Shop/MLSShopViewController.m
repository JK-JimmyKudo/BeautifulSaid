//
//  MLSShopViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSShopViewController.h"

@interface MLSShopViewController ()

@end

@implementation MLSShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavView];
}

-(void) setNavView{
    [self setupNavView];
    [self.navView.centerButton setTitle:@"购物车" forState:UIControlStateNormal];
    self.navView.lineLabel.backgroundColor = [UIColor whiteColor];
    
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

//
//  MLSLoginViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSLoginViewController.h"
#import "YCMenuView.h"

@interface MLSLoginViewController ()

@property(nonatomic,strong)NSArray      *arr;

@end

@implementation MLSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
    [self setupYCMenuView];
}

-(void) setupYCMenuView{
    UIImage *image = [UIImage imageNamed:@"ic_filter_category_0"];

    YCMenuAction *action = [YCMenuAction actionWithTitle:@"忘记密码" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    YCMenuAction *action1 = [YCMenuAction actionWithTitle:@"帮助支持" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    
    self.arr = @[action,action1];
}


- (void)setupNavView{
    [super setupNavView];
    [self.navView.leftButton setImage:backArrowIcon forState:UIControlStateNormal];
    [self.navView.rightButton setImage:[UIImage imageNamed:@"login_navbar_more"] forState:UIControlStateNormal];
    [self.navView.centerButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.navView.lineLabel.backgroundColor = [UIColor whiteColor];

    WEAKSELF;
    self.navView.leftButtonBlock = ^{
        
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        
        NSLog(@"======");
    };
    
    self.navView.rightButtonBlock = ^(UIButton *rightButton) {

        YCMenuView *view = [YCMenuView menuWithActions:weakSelf.arr width:140 relyonView:rightButton];
        view.backgroundColor = [UIColor grayColor];
        view.textColor = [UIColor whiteColor];
        [view show];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}



@end

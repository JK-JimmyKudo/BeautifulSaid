//
//  MLSLoginViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "PWLoginViewController.h"
#import "YCMenuView.h"
#import "PWGDViewController.h"

#define kMyNavi  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController


@interface PWLoginViewController ()

@property(nonatomic,strong)NSArray *arr;


@property (nonatomic,strong) UITextField *IPTextField;
@property (nonatomic,strong) UITextField *PSTextField;

@property (nonatomic,strong) UIView *mainView;

@property (nonatomic,strong) YYLabel *loginLabel;








@end

@implementation PWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
    [self setupYCMenuView];
    [self getRecommendData];
    [self setupUI];
    [self setupMainView];
    [self setupLoginUI];
    [self setupThredLoginUI];

   
}


-(void)setupUI{
    YYLabel *label = [[YYLabel alloc] init];
    label.textColor = [PWColor colorWithRed:126 withGreen:126 withBlue:126 withAlpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"美丽说账号";
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(KItemHeight + 30);
    }];
    
    
    self.IPTextField = [[UITextField alloc] init];
    self.IPTextField.placeholder = @"昵称/邮箱/手机";
    self.IPTextField.textAlignment = NSTextAlignmentCenter;
    self.IPTextField.textColor = [PWColor appTextFieldColor];
    self.IPTextField.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:self.IPTextField];
    [self.IPTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(label.mas_bottom);
    }];
    
    
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[PWColor appTextFieldColor];
    [self.IPTextField addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.IPTextField);
        make.right.mas_equalTo(self.IPTextField);
        make.bottom.mas_equalTo(self.IPTextField.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    
    YYLabel *passLabel = [[YYLabel alloc] init];
    passLabel.textAlignment = NSTextAlignmentCenter;
    passLabel.textColor = [PWColor colorWithRed:126 withGreen:126 withBlue:126 withAlpha:1];
    passLabel.text = @"密码";
    passLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:passLabel];
    [passLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.IPTextField.mas_bottom).offset(20);
    }];
    
    
    self.PSTextField = [[UITextField alloc] init];
    self.PSTextField.placeholder = @"输入密码";
    self.PSTextField.textAlignment = NSTextAlignmentCenter;
    self.PSTextField.textColor = [PWColor appTextFieldColor];
    self.PSTextField.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:self.PSTextField];
    [self.PSTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(passLabel.mas_bottom);
    }];
    
    {
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=[PWColor appTextFieldColor];
        [self.PSTextField addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.PSTextField);
            make.right.mas_equalTo(self.PSTextField);
            make.bottom.mas_equalTo(self.PSTextField.mas_bottom);
            make.height.mas_equalTo(1);
        }];
    }
}



-(void) setupMainView{
    
    self.mainView = [[UIView alloc] init];
    self.mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.PSTextField.mas_bottom).offset(1);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
}

-(void)setupLoginUI{
    
//    210
    
    self.loginLabel = [[YYLabel alloc] init];
    self.loginLabel.backgroundColor = [PWColor colorWithRed:210 withGreen:210 withBlue:210 withAlpha:1];
    self.loginLabel.text = @"登录";
    self.loginLabel.textColor = [UIColor whiteColor];
    self.loginLabel.layer.masksToBounds = YES;
    self.loginLabel.layer.cornerRadius = 2;
    [self.view addSubview:self.loginLabel];
    [self.loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.mainView.mas_bottom).offset(10);
    }];
    
    NSArray *arrs = @[@"海外手机",@"免密登录",@"注册账号"];
    NSMutableArray *views = [NSMutableArray array];
    for (NSString *title in arrs) {
        YYLabel *label = [[YYLabel alloc] init];
        label.backgroundColor = LRRandomColor;
        label.text = title;
        [self.view addSubview:label];
        [views addObject:label];
        
    
        label.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
             NSLog(@"====text == %@",text);
        };
    }
    
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:40 tailSpacing:40];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(45);
    }];
     
   
}

-(void)setupThredLoginUI{
    
    
    NSArray *arrs = @[@"login_qq_icon",@"login_wechat_icon",@"login_sina_icon"];
    NSMutableArray *views = [NSMutableArray array];
    
    for (NSInteger i = 0; i<arrs.count; i++) {
        UIButton *loginBtn = [[UIButton alloc] init];
//        loginBtn.backgroundColor = LRRandomColor;
        [loginBtn setImage:[UIImage imageNamed:arrs[i]] forState:UIControlStateNormal];
        loginBtn.adjustsImageWhenHighlighted = NO;
        loginBtn.tag = i;
        [self.view addSubview:loginBtn];
        [views addObject:loginBtn];
        [loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    CGFloat width = 50;
    CGFloat margin = ((SCREEN_WIDTH - 3*width - 2*50)/2);
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:margin leadSpacing:50 tailSpacing:40];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
        make.height.with.mas_equalTo(width);
    }];
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
    [self.navView.centerButton setTitle:@"登录" forState:UIControlStateNormal];
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

-(void)loginClick:(UIButton *)login{
    
    NSLog(@"login.tag == %ld",(long)login.tag);
    
}

-(void)getRecommendData{
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}



@end

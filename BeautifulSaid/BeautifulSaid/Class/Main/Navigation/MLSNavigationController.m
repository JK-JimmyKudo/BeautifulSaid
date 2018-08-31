//
//  MLSNavigationViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSNavigationController.h"

@interface MLSNavigationController ()

@property (nonatomic,strong) UIView *bottomNavLine;

@end

@implementation MLSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(UIView *) bottomNavLine{
    
    if (!_bottomNavLine) {
        
        _bottomNavLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, 1.0/[UIScreen mainScreen].scale)];
        _bottomNavLine.backgroundColor = [UIColor colorWithHexString:@"0xDCDCDC"];
    }
    return _bottomNavLine;
}


-(void) hideBorderInView:(UIView *) view{
    
    if ([view isKindOfClass:[UIImageView class]] && view.frame.size.height <= 1) {
        view.hidden = YES;
    }
    
    
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}

-(void) showNavBottomLine{
    _bottomNavLine.hidden = NO;
}

-(void) hideNavBottomLine{
    [self hideBorderInView:self.navigationBar];
    if (_bottomNavLine) {
        _bottomNavLine.hidden = YES;
    }
}

-(instancetype) initWithRootViewController:(UIViewController *)rootViewController{
    
    if (self = [super initWithRootViewController:rootViewController]) {
        
        self.statusBarStyle = UIStatusBarStyleDefault;
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.statusBarStyle;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;//隐藏二级页面的tabbar
    }
    [super pushViewController:viewController animated:animated];
    
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

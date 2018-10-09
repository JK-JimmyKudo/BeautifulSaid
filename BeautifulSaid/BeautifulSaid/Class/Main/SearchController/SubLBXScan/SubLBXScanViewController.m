//
//  SubLBXScanViewController.m
//  wStock
//
//  Created by power on 2018/8/24.
//  Copyright © 2018年 com.ailk. All rights reserved.
//

#import "SubLBXScanViewController.h"
#import "LBXScanResult.h"
#import "LBXScanWrapper.h"



@interface SubLBXScanViewController ()

@property (nonatomic,strong) UIButton *m_closeBtn;

@property (nonatomic,copy) NSString *m_resqustUrl;


@end

@implementation SubLBXScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor blackColor];
    
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    self.style = style;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self setupUI];
}

-(void)setupUI{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self drawBottomItems];
    [self drawTitle];
    [self drawClose];
//    [self createBackButton];
    [self.view bringSubviewToFront:_topTitle];
}

-(void)drawClose{
    
    if (!_m_closeBtn) {
        self.m_closeBtn = [[UIButton alloc] init];
        [self.m_closeBtn setImage:[UIImage imageNamed:@"shfw_close.png"] forState:UIControlStateNormal];
        [self.view addSubview:self.m_closeBtn];
        [self.m_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.view).mas_offset(-10);
            make.top.mas_equalTo(self.view).offset(20);
            make.width.height.mas_equalTo(60);
        }];
        
        [self.m_closeBtn addTarget:self action:@selector(m_closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)drawTitle
{
    if (!_topTitle)
    {
        self.topTitle = [[UILabel alloc]init];
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.numberOfLines = 0;
        _topTitle.text = @"将取景框对准二维码即可自动扫描";
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
        
        [self.topTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(30);
            make.size.mas_equalTo(CGSizeMake(145, 60));
        }];
    }
}

- (void)drawBottomItems
{
    if (_bottomItemsView) {
        
        return;
    }
    
    self.bottomItemsView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-164,CGRectGetWidth(self.view.frame), 100)];
    
    _bottomItemsView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    [self.view addSubview:_bottomItemsView];
    
    CGSize size = CGSizeMake(65, 87);
    self.btnFlash = [[UIButton alloc]init];
    _btnFlash.bounds = CGRectMake(0, 0, size.width, size.height);
    _btnFlash.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame)/2, CGRectGetHeight(_bottomItemsView.frame)/2);
    [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor"] forState:UIControlStateNormal];
    [_btnFlash addTarget:self action:@selector(openOrCloseFlash) forControlEvents:UIControlEventTouchUpInside];
//
//    self.btnPhoto = [[UIButton alloc]init];
//    _btnPhoto.bounds = _btnFlash.bounds;
//    _btnPhoto.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame)/4, CGRectGetHeight(_bottomItemsView.frame)/2);
//    [_btnPhoto setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_photo_nor"] forState:UIControlStateNormal];
//    [_btnPhoto setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_photo_down"] forState:UIControlStateHighlighted];
//    [_btnPhoto addTarget:self action:@selector(openPhoto) forControlEvents:UIControlEventTouchUpInside];
    
//    self.btnMyQR = [[UIButton alloc]init];
//    _btnMyQR.bounds = _btnFlash.bounds;
//    _btnMyQR.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame) * 3/4, CGRectGetHeight(_bottomItemsView.frame)/2);
//    [_btnMyQR setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_myqrcode_nor"] forState:UIControlStateNormal];
//    [_btnMyQR setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_myqrcode_down"] forState:UIControlStateHighlighted];
//    [_btnMyQR addTarget:self action:@selector(myQRCode) forControlEvents:UIControlEventTouchUpInside];
    
    [_bottomItemsView addSubview:_btnFlash];
//    [_bottomItemsView addSubview:_btnPhoto];
//    [_bottomItemsView addSubview:_btnMyQR];
    
}


-(void) m_closeBtnClick:(UIButton *)m_closeBtn{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"控制器销毁");
        self.m_closeBtn = nil;
        [self.m_closeBtn removeFromSuperview];
    }];
    
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    
    if (array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //经测试，可以同时识别2个二维码，不能同时识别二维码和条形码
    for (LBXScanResult *result in array) {
        NSLog(@"scanResult:%@",result.strScanned);
        self.m_resqustUrl = result.strScanned;
        [self popAlertMsgWithScanResult:self.m_resqustUrl];
    }
    
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //震动提醒
    [LBXScanWrapper systemVibrate];
    //声音提醒
    [LBXScanWrapper systemSound];
    
    
    [self showNextVCWithScanResult:scanResult];
    
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    
    UIViewController *rootViewController = [UIApplication sharedApplication].windows.firstObject.rootViewController;
    
    if (strResult.length >0) {
        
        NSString *strResultUrl = [NSString stringWithFormat:@"%@?%@",self.m_hxtype,strResult];
        NSDictionary *dict = @{@"URL":strResultUrl};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hxtypeResultUrlName" object:dict];
        [self m_closeBtnClick:nil];
   
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"识别失败" preferredStyle:UIAlertControllerStyleAlert];
        __weak __typeof(self) weakSelf = self;
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [weakSelf reStartDevice];
        }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
//    ScanResultViewController *vc = [ScanResultViewController new];
//    vc.strScan = strResult.strScanned;
//    CGSize size = CGSizeMake(CGRectGetWidth(self.view.frame)-12, CGRectGetWidth(self.view.frame)-12);
//    vc.imgScan = [LBXScanWrapper createQRWithString: strResult.strScanned size:size];
//    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -底部功能项
//打开相册
//- (void)openPhoto
//{
//    if ([LBXScanWrapper isGetPhotoPermission])
//        [self openLocalPhoto];
//    else{
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请到设置->隐私中开启本程序相册权限" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//
//        }];
//        [alert addAction:defaultAction];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//}

//开关闪光灯
- (void)openOrCloseFlash
{
    
    [super openOrCloseFlash];
    
    
    if (self.isOpenFlash)
    {
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_down"] forState:UIControlStateNormal];
    }
    else
        [_btnFlash setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor"] forState:UIControlStateNormal];
}


#pragma mark -底部功能项


- (void)myQRCode
{
//    MyQRViewController *vc = [MyQRViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}


//- (void)createBackButton
//{
//    ///////////////////
//    self.view.backgroundColor = [UIColor whiteColor];
//    if (IOS7_UP) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//    }
//    UIButton *btnHome = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnHome.frame = CGRectMake(0, 0.f, 22.f, 20.5f);
//    [btnHome setBackgroundColor:[UIColor clearColor]];
//    [btnHome setImage:[UIImage imageNamed:@"nav_back_pre_by"] forState:UIControlStateNormal];
//    [btnHome setImage:[UIImage imageNamed:@"nav_back_pre"] forState:UIControlStateHighlighted];
//    [btnHome setImageEdgeInsets:UIEdgeInsetsMake(0, 10.f, 0, 0)];
//    [btnHome addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
//    if (IOS7_UP) {
//        [self.navigationItem setLeftBarButtonItemInIOS7:[[UIBarButtonItem alloc] initWithCustomView:btnHome]];
//    }
//    else {
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnHome];
//    }
//
//}
//
//- (void)goHome
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}



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

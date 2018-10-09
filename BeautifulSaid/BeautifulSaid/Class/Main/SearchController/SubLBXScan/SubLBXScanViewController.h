//
//  SubLBXScanViewController.h
//  wStock
//
//  Created by power on 2018/8/24.
//  Copyright © 2018年 com.ailk. All rights reserved.
//

#import "LBXScanViewController.h"

@interface SubLBXScanViewController : LBXScanViewController

/**
 扫码区域上方的提示文字
 */
@property (nonatomic,strong) UILabel *topTitle;

/**
 底部显示的功能选项
 */
@property (nonatomic,strong) UIView *bottomItemsView;
//相册
//@property (nonatomic,strong) UIButton *btnPhoto;
//闪光灯
@property (nonatomic,strong) UIButton *btnFlash;

//@property (nonatomic,strong) UIButton *btnMyQR;


@property (nonatomic,copy) NSString *m_hxtype;

@end

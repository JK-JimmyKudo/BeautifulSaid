//
//  ZMNavView.h
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYLabel.h>

@interface ZMNavView : UIView
@property (nonatomic, strong) UIView    *mainView;
@property (nonatomic, strong) UIButton  *leftButton;
@property (nonatomic, strong) UIButton  *leftTwoButton;
@property (nonatomic, strong) UIButton  *rightButton;
@property (nonatomic, strong) UIButton  *centerButton;
@property (nonatomic, strong) UILabel   *rightLabel;
@property (nonatomic, assign) BOOL      showBottomLabel;
@property (nonatomic, strong) UILabel *lineLabel;
/** 中间按钮文字 */
@property (nonatomic, strong) YYLabel  *centerLabel;

@property (nonatomic, copy) void (^ leftButtonBlock)(void);
@property (nonatomic, copy) void (^ cenTerButtonBlock)(void);
@property (nonatomic, copy) void (^ rightButtonBlock)(void);

@end

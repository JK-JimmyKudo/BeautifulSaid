//
//  MLSearchView.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSearchView.h"

@implementation MLSearchView


-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        

        [self setupViews];
        
    }
    return self;
}


- (void)setupViews {
    
    self.searchText = [[UITextField alloc] init];
    [self addSubview:self.searchText];
    self.searchText.layer.cornerRadius = 5.0f;
    self.searchText.layer.masksToBounds = YES;
    self.searchText.text = @"测试";
    self.searchText.font = [UIFont systemFontOfSize:13];
    //    self.searchText.delegate = self;
    [self setupTextFieldLeftView];
    [self.searchText setValue:[UIColor colorWithRed:176 / 255.0f green:176 / 255.0f blue: 176 / 255.0f alpha:1.0f]
                   forKeyPath:@"_placeholderLabel.textColor"];
    self.searchText.tintColor = [UIColor colorWithRed:98 / 255.0f green:97 / 255.0f blue: 101 / 255.0f alpha:1.0f];
    
    self.searchText.backgroundColor = [UIColor colorWithRed:176 / 255.0f green:176 / 255.0f blue: 176 / 255.0f alpha:1.0f];
    

    
    
    self.SweepBtn = [[UIButton alloc] init];
    [self.SweepBtn setImage:[UIImage imageNamed:@"homepage_scan_icon"] forState:UIControlStateNormal];
    self.SweepBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.SweepBtn];
    
    
    self.canBtn = [[UIButton alloc] init];
    [self addSubview:self.canBtn];
    [self.canBtn setTitle:@"取消" forState: UIControlStateNormal];
    self.canBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.canBtn setImage:[UIImage imageNamed:@"global_nav_msg_white_20x18_"] forState:UIControlStateNormal];
    self.canBtn.backgroundColor = [UIColor redColor];
    [self.canBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchText.mas_centerY);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(40);
    }];
    
    
    [self.searchText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(self.canBtn.mas_left).offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    
    [self.SweepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchText.mas_centerY);
        make.right.mas_equalTo(self.searchText.mas_right).offset(-8);
        make.height.width.mas_equalTo(20);
    }];
    
}

- (void)setupTextFieldLeftView {
    UIImageView *searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchImageView.image = [UIImage imageNamed:@"homepage_search_icon"];
    searchImageView.contentMode = UIViewContentModeCenter;
    self.searchText.leftView = searchImageView;
    self.searchText.leftViewMode = UITextFieldViewModeAlways;
}
@end

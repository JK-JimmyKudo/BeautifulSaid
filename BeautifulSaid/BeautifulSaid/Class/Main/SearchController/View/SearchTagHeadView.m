//
//  SearchTagHeadView.m
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "SearchTagHeadView.h"

@implementation SearchTagHeadView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
        
        [self setupUI];
        
        
    }
    return self;
}

-(void)setupUI{
    
    self.view = [[UIView alloc] init];
    [self addSubview:self.view];
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30.0f);
        make.top.mas_equalTo(0);
    }];
    
    self.leftImageView = [[UIImageView alloc] init];
//    self.leftImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(20.0f);
        make.centerY.mas_equalTo(self.view);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = LRRGBColor(165, 165, 165);
    self.titleLabel.font = [UIFont systemFontOfSize:15];
//    self.titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).offset(10);
        make.width.mas_equalTo(120.0f);
        make.height.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
    }];
    
    self.clearButton = [[UIButton alloc] init];
//    self.clearButton.backgroundColor = [UIColor redColor];
    self.clearButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.clearButton setTitleColor:LRRGBColor(165, 165, 165) forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(clearButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(120.0f);
        make.height.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view);
    }];
}


-(void)clearButtonClick{
    
    if (self.clearButtonBlock) {
        self.clearButtonBlock();
    }
}
@end

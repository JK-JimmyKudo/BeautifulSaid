//
//  HeadViewCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/6.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HeadViewCell.h"

@implementation HeadViewCell

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
        self.imageView = [[FLAnimatedImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imageView];
//        self.imageView.backgroundColor = [UIColor redColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(80);
            make.centerX.mas_equalTo(self);
        }];
        
        self.titleLabel = [[YYLabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor grayColor];
//        self.titleLabel.text = @"秋季新品";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
            make.height.mas_equalTo(28);
        }];
    }
    return self;
}

@end

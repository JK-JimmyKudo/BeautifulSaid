//
//  HomePopularCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomePopularCell.h"

@interface HomePopularCell()

@property (nonatomic,strong) YYLabel *des_label;

@end

@implementation HomePopularCell

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.des_label = [[YYLabel alloc] init];
        self.des_label.backgroundColor = [UIColor redColor];
        self.des_label.font = [UIFont systemFontOfSize:10];
        self.des_label.numberOfLines = 0;
        self.des_label.preferredMaxLayoutWidth = (FIT_WIDTH - 30)/2;
        [self.contentView addSubview:self.des_label];
        [self.des_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(self);
        }];
        
    }
    return self;
}

@end

//
//  HomeCollectionViewCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell()

@property (nonatomic,strong) FLAnimatedImageView *imageView;
@property (nonatomic,strong) YYLabel *title_label;
@property (nonatomic,strong) FLAnimatedImageView *collect_Image;
@property (nonatomic,strong) YYLabel *collectNum_label;
@property (nonatomic,strong) YYLabel *des_label;
@property (nonatomic,strong) YYLabel *discountPrice_label;


@end

@implementation HomeCollectionViewCell

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        self.imageView = [[FLAnimatedImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        self.imageView.backgroundColor = [UIColor redColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(FIT_WIDTH *9/16 + 50);
        }];
        
        
        
        
        self.des_label = [[YYLabel alloc] init];
        self.des_label.backgroundColor = [UIColor redColor];
        self.des_label.font = [UIFont systemFontOfSize:10];
        self.des_label.numberOfLines = 0;
        self.des_label.preferredMaxLayoutWidth = (FIT_WIDTH - 30)/2;
//        self.des_label.text = @"美丽说";
        [self.contentView addSubview:self.des_label];
        [self.des_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(self.imageView.mas_bottom);
        }];
        
        self.discountPrice_label = [[YYLabel alloc] init];
        [self.contentView addSubview:self.discountPrice_label];
        self.discountPrice_label.font = [UIFont systemFontOfSize:13];
        [self.discountPrice_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.des_label.mas_bottom);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(30);
        }];
        
        
        self.collect_Image = [[FLAnimatedImageView alloc] init];
        self.collect_Image.image = [UIImage imageNamed:@""];
        self.collect_Image.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.collect_Image];
        [self.collect_Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.width.height.mas_equalTo(20);
            make.centerY.mas_equalTo(self.discountPrice_label.mas_centerY);
        }];
        
    }
    return self;
}

-(void) configHomeCollectionModel:(HomeModels *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.des_label.text = model.desc;
    self.discountPrice_label.text = [NSString stringWithFormat:@"¥%@",model.discountPrice];
}
@end

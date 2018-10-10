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
//        self.imageView.backgroundColor = [UIColor redColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo((kScreenWidth - 30) *9/16 + 50);
        }];
        
        
        
        
        self.des_label = [[YYLabel alloc] init];
//        self.des_label.backgroundColor = [UIColor redColor];
        self.des_label.font = [UIFont systemFontOfSize:10];
        self.des_label.numberOfLines = 0;
        self.des_label.preferredMaxLayoutWidth = (kScreenWidth - 30)/2;
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
//        self.discountPrice_label.backgroundColor = [UIColor orangeColor];
        [self.discountPrice_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.des_label.mas_bottom);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
        }];
        
        
        self.collect_Image = [[FLAnimatedImageView alloc] init];
        self.collect_Image.image = [UIImage imageNamed:@"MGJDETAIL_comment_star_dark_14x13_"];
//        self.collect_Image.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.collect_Image];
        [self.collect_Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-5);
            make.width.height.mas_equalTo(15);
            make.centerY.mas_equalTo(self.discountPrice_label.mas_centerY).offset(-2);
        }];
        
        self.collectNum_label = [[YYLabel alloc] init];
//        self.collectNum_label.backgroundColor = [UIColor redColor];
        self.collectNum_label.font = [UIFont systemFontOfSize:13];
        self.collectNum_label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.collectNum_label];
        [self.collectNum_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.discountPrice_label.mas_centerY);
            make.right.mas_equalTo(self.collect_Image.mas_left).offset(-5);
            make.left.mas_equalTo(self.discountPrice_label.mas_right);
            make.height.mas_equalTo(30);
        }];
        
    }
    return self;
}

-(void) configHomeCollectionModel:(HomeModels *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"global_placeholder"]];
    self.des_label.text = model.desc;
    self.discountPrice_label.text = [NSString stringWithFormat:@"¥%@",model.discountPrice];
    self.collectNum_label.text = model.collectNum;
}
@end

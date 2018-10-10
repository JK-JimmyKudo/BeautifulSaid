//
//  HomeChildCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomeChildCell.h"

@interface HomeChildCell ()

@property (nonatomic,strong) YYLabel *nameLabel;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation HomeChildCell

- (instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
            
        self.imageView = [[FLAnimatedImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        self.imageView.backgroundColor = [UIColor whiteColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(76);
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(self);
        }];
        
        
        
        
        self.nameLabel = [[YYLabel alloc] init];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//        self.nameLabel.numberOfLines = 0;
//        self.nameLabel.preferredMaxLayoutWidth = (FIT_WIDTH - 30)/2;
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(40);
//            make.width.mas_equalTo(self.imageView);
//            make.centerX.mas_equalTo(self.imageView);
            make.top.mas_equalTo(self.imageView.mas_bottom);
        }];
    }
    return self;
}

-(void) setModel:(HomePopularModel *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:nil];
    self.nameLabel.text = model.title;
}

@end

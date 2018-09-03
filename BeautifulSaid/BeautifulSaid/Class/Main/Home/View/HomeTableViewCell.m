//
//  HomeTableViewCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()

@property (nonatomic,strong) YYLabel *mlabel_title;


@end

@implementation HomeTableViewCell


+(instancetype) congifTableView:(UITableView *)tableView{
    
    static NSString *inderfier = @"HomeTableViewCell";
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inderfier];
    
    if (cell == nil) {
    
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inderfier];
    }
    return cell;
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.mlabel_title = [[YYLabel alloc] init];
        self.mlabel_title.text = @"美丽说";
        [self.contentView addSubview:self.mlabel_title];
        [self.mlabel_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(100);
            make.top.mas_equalTo(0);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

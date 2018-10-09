//
//  SearchResultTableViewCell.m
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "SearchResultTableViewCell.h"


static NSString *inderfier = @"SearchResultTableViewCell";

@implementation SearchResultTableViewCell

+(instancetype) setupSearchResultTableViewCell:(UITableView *)tableView{
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inderfier];
    if (cell == nil) {
        cell = [[SearchResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inderfier];
    }
    return cell;
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
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

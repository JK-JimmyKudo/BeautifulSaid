//
//  SearchTagTableViewCell.h
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "YYTableViewCell.h"
#import "SKTagView.h"

typedef void(^TagHeightBlock)(CGFloat TagHeight);

@interface SearchTagTableViewCell : YYTableViewCell

//@property (nonatomic,assign) CGFloat TagHeight;
@property (nonatomic,copy) TagHeightBlock tagHeightBlock;

@property (nonatomic,strong) SKTagView *tagView;

+(instancetype) setupSearchTagViewTableViewCell:(UITableView *)tableView;

- (void)configureCell:(SearchTagTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource tagHeight:(TagHeightBlock)tagHeightBlock;


@end

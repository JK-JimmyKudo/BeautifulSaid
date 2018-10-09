//
//  SearchTagTableViewCell.m
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "SearchTagTableViewCell.h"


@interface SearchTagTableViewCell ()
@property (nonatomic,strong) NSMutableArray *dataSource;
@end


static NSString *inderfier = @"SearchTagTableViewCell";

@implementation SearchTagTableViewCell

+(instancetype) setupSearchTagViewTableViewCell:(UITableView *)tableView{
    
    SearchTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inderfier];
    if (cell == nil) {
        cell = [[SearchTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inderfier];
    }
    return cell;
}




-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//     _dataSource = [[NSMutableArray alloc] initWithArray:@[@"余罪",@"恐怖游轮",@"放牛班的春天",@"当幸福来敲门",@"哈利波特",@"死亡密码",@"源代码",@"盗梦空间",@"疯狂动物城",@"X战警",@"西游降魔篇",@"这个男人来自地球",@"致命ID致命ID致命ID致命ID",@"搏击俱乐部",@"冰雪世界"]];
//        [self configTagView];
        _dataSource = [NSMutableArray array];
        
        self.tagView = [[SKTagView alloc] init];
        [self.contentView addSubview:self.tagView];
    }
    return self;
}

// 配置
- (void)configTagView
{
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 100, 30)];
//    self.label.textColor = [UIColor blackColor];
//    self.label.font = [UIFont systemFontOfSize:13];
//    self.label.text = @"历史搜索";
//    [self.view addSubview:self.label];
    
    [self.tagView removeAllTags];
    
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    // 上下行之间的距离
    self.tagView.lineSpacing = 10;
    // item之间的距离
    self.tagView.interitemSpacing = 20;
    // 最大宽度
    self.tagView.preferredMaxLayoutWidth = SCREEN_WIDTH;
    //    @property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
    //    @property (nonatomic,assign ) CGFloat regularHeight; //!< 固定高度
    // 原作者没有能加固定宽度的，自己修改源码加上了固定宽度和高度,默认是0，就是标签式布局，如果实现了，那么就是固定宽度高度
    //    self.tagView.regularWidth = 100;
    //    self.tagView.regularHeight = 30;
    // 开始加载
    [self.dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:self.dataSource[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 3.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 0;
        // 背景
        tag.bgColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        // 边框颜色
        tag.borderColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        // 字体颜色
        tag.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView addTag:tag];
    }];

    
    // 获取刚才加入所有tag之后的内在高度
    CGFloat tagHeight = self.tagView.intrinsicContentSize.height;
//    NSLog(@"高度%lf",tagHeight);
    
    self.tagView.frame = CGRectMake(0, 0, SCREEN_WIDTH, tagHeight);
    [self.tagView layoutSubviews];
   
    if (self.tagHeightBlock) {
        self.tagHeightBlock(tagHeight);
    }
}

-(void)configureCell:(SearchTagTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath dataSource:(NSMutableArray *)dataSource tagHeight:(TagHeightBlock)tagHeightBlock{
    
    self.tagHeightBlock = tagHeightBlock;
    
//    NSLog(@"dataSource == %@",dataSource);
    _dataSource  = dataSource ;
    [self configTagView];
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

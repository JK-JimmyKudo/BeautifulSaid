//
//  PWSearchViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "PWSearchViewController.h"
#import "SKTagView.h"
#import "SearchTagTableViewCell.h"
#import "SearchResultTableViewCell.h"
#import "SearchTagHeadView.h"
#import <UITableView+FDTemplateLayoutCell.h>


@interface UIImage (SKTagView)

+ (UIImage *)imageWithColor: (UIColor *)color;

@end

@implementation UIImage (SKTagView)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end



@interface PWSearchViewController ()
<UITableViewDelegate,UITableViewDataSource,SKTagViewDelegate>

@property (strong, nonatomic)  UITableView *searchTagTableView;
@property (strong, nonatomic)  YYTableView *searchResultTableView;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSArray *historyTags;
@property (strong, nonatomic) NSArray *colors;
@property (nonatomic,assign)  CGFloat tagHeight;

@end

static NSString *identyfy = @"SearchTagTableViewCell";

@implementation PWSearchViewController

-(void) viewDidLoad{
    [super viewDidLoad];
    [self setupTableView];
    [self registerCells];
    [self searchView];
    self.searchView.searchBtn.hidden = YES;
    [self.searchView.canBtn setTitle:@"取消" forState:UIControlStateNormal];
}

-(void)setupTableView{
    
    self.searchTagTableView = [[YYTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.searchView.frame), SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStyleGrouped];
    self.searchTagTableView.backgroundColor = [UIColor whiteColor];
    self.searchTagTableView.delegate = self;
    self.searchTagTableView.dataSource = self;
    [self.view addSubview:self.searchTagTableView];
    
}
-(void)registerCells{
    _tags = @[
              @"卫衣",
              @"外套",
              @"毛衣",
              @"睡衣",
              @"风衣",
              @"寸衫",
              @"马甲",
              @"口红",
              @"牛仔裤",
              @"鞋子"
              ];
    
    _historyTags = @[@"呵呵呵呵是短发是阿斯蒂芬安抚阿道夫案发时阿斯蒂芬是打发发顺丰阿斯蒂芬安抚阿萨德",
                     @"面膜啥都发发发顺丰安抚阿萨德",
                     @"火兔梵蒂冈地方个梵蒂冈第三个到国服大概是的",
                     @"挖地方",
                     @"阿道夫阿道夫爱的个梵蒂冈返回规范和规划方法"];
   
    [self.searchTagTableView reloadData];
    
}

#pragma mark - UITableViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    if (self.searchDetailView) {
//        [self.searchDetailView.textField resignFirstResponder];
//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"self.tagHeight === %f",self.tagHeight);
    
    return self.tagHeight;
//    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        
        SearchTagHeadView *headView = [[SearchTagHeadView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 30.0f)];
        headView.backgroundColor = [UIColor whiteColor];
        NSString *leftImageName = section == 0 ? @"search_icon_hot" : @"search_icon_history";
        NSString *titleName = section == 0 ? @"热门搜索" : @"最近搜索";
        BOOL isHidden = section == 1 ? NO : YES;
        headView.leftImageView.image = [UIImage imageNamed:leftImageName];
        headView.titleLabel.text = titleName;
        headView.clearButton.hidden = isHidden;
        [headView.clearButton setTitle:@"清除历史搜索" forState:UIControlStateNormal];
        WEAKSELF;
        headView.clearButtonBlock = ^{
            weakSelf.historyTags = @[];
            [weakSelf.searchTagTableView reloadData];
        };
        return headView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 45.0f;
    }
    return CGFLOAT_MIN;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 1;
    }
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchTagTableView) {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
    
        SearchTagTableViewCell *cell = [SearchTagTableViewCell setupSearchTagViewTableViewCell:tableView];
        self.tagHeight = 0;
        if (indexPath.section == 0) {
            [cell configureCell:cell atIndexPath:indexPath dataSource:_tags tagHeight:^(CGFloat TagHeight) {
//                NSLog(@"TagHeight === %f",TagHeight);
                self.tagHeight = TagHeight;
            }];
        }else{
            [cell configureCell:cell atIndexPath:indexPath dataSource:_historyTags tagHeight:^(CGFloat TagHeight) {
//                NSLog(@"TagHeight === %f",TagHeight);
                self.tagHeight = TagHeight;
            }];
        }
    
        // 点击事件回调
        cell.tagView.didTapTagAtIndex = ^(NSUInteger idx){
            NSLog(@"点击了第%ld个",idx);
        };
    
//        cell.contentEmptyLabel.hidden = indexPath.section != 0;
        return cell;
    }
    SearchResultTableViewCell *cell = [SearchResultTableViewCell setupSearchResultTableViewCell:tableView];
    return cell;
}

- (void)dismissButtonWasPressedForSearchView:(PWSearchView *)searchView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray *)colors {
    if (!_colors) {
        _colors = @[
                    [UIColor colorWithRed:245 / 255.0f green:86 / 255.0f blue:160 / 255.0f alpha:1.0f],
                    [UIColor colorWithRed:81 / 255.0f green:81 / 255.0f blue:81/255.0f alpha:1.0f]
                    ];
    }
    return _colors;
}
@end

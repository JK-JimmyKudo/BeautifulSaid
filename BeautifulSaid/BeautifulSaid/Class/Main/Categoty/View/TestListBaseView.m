//
//  TestListBaseView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "TestListBaseView.h"
#import "HomeCollectionViewCell.h"
#import "NSArray+Safe.h"
@interface TestListBaseView()<UITableViewDataSource, UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString *inderfier = @"HomeCollectionViewCell";

@implementation TestListBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        _tableView = [[YYTableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
//        self.tableView.backgroundColor = [UIColor whiteColor];
//        self.tableView.tableFooterView = [UIView new];
//        self.tableView.dataSource = self;
//        self.tableView.delegate = self;
//        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//        [self addSubview:self.tableView];
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 10, 0, 10);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 30)/2, (kScreenWidth)*9/16 + 110);
        
        _collectionView = [[YYCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier: inderfier];
        [self addSubview:self.collectionView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.tableView.frame = self.bounds;
    self.collectionView.frame = self.bounds;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
  return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:inderfier forIndexPath:indexPath];
    [cell configHomeCollectionModel:[self.dataSource safeObjectAtIndex:indexPath.item]];
    
    
    return cell;
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(listViewDidScroll:)]) {
        [self.delegate listViewDidScroll:scrollView];
    }
}

#pragma mark - JXPagingViewListViewDelegate

//- (UIScrollView *)listScrollView {
//    return self.tableView;
//}

- (UIScrollView *)listScrollView {
    return self.collectionView;
}


@end

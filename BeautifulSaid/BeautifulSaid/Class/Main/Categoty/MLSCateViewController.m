//
//  MLSCategotyViewController.m
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "MLSCateViewController.h"
#import "JXPagingView.h"
#import "JXCategoryView.h"
#import "PagingViewTableHeaderView.h"
#import "PartnerListView.h"
#import "HobbyListView.h"
#import "PowerListView.h"
#import "HomeModels.h"

static const CGFloat JXTableHeaderViewHeight = 520;
static const CGFloat JXheightForHeaderInSection = 50;

@interface MLSCateViewController ()<TestListViewDelegate, JXPagingViewDelegate, JXCategoryViewDelegate>

@property (nonatomic, strong) JXPagingView *pagingView;
@property (nonatomic, strong) PagingViewTableHeaderView *userHeaderView;
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) NSArray <TestListBaseView *> *listViewArray;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property (nonatomic,strong) NSMutableArray<HomeModels *>*rowsArray;
@property (nonatomic,strong) PowerListView *powerListView;
@property (nonatomic,strong) HobbyListView *hobbyListView;
@property (nonatomic,strong) PartnerListView *partnerListView;
@end

@implementation MLSCateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 200, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    btn.acceptEventInterval = 1.0;
    [btn setTitle:@"快速点击" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(quiklyClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupUI];
    [self searchView];
//    self.searchView.backgroundColor = [UIColor whiteColor];
    [self.searchView.canBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    [self getRecommendData];
}

-(void) setupUI{
    
     _titles = @[@"流行", @"热销", @"上新"];
    
    PowerListView *powerListView = [[PowerListView alloc] init];
    powerListView.delegate = self;
    self.powerListView = powerListView;
    
    HobbyListView *hobbyListView = [[HobbyListView alloc] init];
    hobbyListView.delegate = self;
    self.hobbyListView = hobbyListView;
    
    PartnerListView *partnerListView = [[PartnerListView alloc] init];
    partnerListView.delegate = self;
    self.partnerListView = partnerListView;
    
    _listViewArray = @[powerListView, hobbyListView, partnerListView];
    
    _userHeaderView = [[PagingViewTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JXTableHeaderViewHeight)];
    
    _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JXheightForHeaderInSection)];
    self.categoryView.titles = self.titles;
    self.categoryView.backgroundColor = [UIColor whiteColor];
    self.categoryView.delegate = self;
    self.categoryView.titleSelectedColor = [UIColor blackColor];
    self.categoryView.titleColor = [MLSColor appTextFieldColor];
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.titleLabelZoomEnabled = YES;
    self.categoryView.titleLabelZoomEnabled = YES;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = [UIColor blackColor];
    lineView.indicatorLineWidth = 30;
    self.categoryView.indicators = @[lineView];
    
    _pagingView = [[JXPagingView alloc] initWithDelegate:self];
    [self.view addSubview:self.pagingView];

//    _pagingView.mainTableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(headerRefresh))
    
    _pagingView.mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    
    self.categoryView.contentScrollView = self.pagingView.listContainerView.collectionView;
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}


-(void)headerRefresh{
    NSLog(@"headerRefresh");
    [_pagingView.mainTableView.mj_header endRefreshing];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.pagingView.frame = CGRectMake(0, KItemHeight, kScreenWidth, kScreenHeight);
}

#pragma mark - TestListViewDelegate

- (void)listViewDidScroll:(UIScrollView *)scrollView {
    [self.pagingView listViewDidScroll:scrollView];
}

#pragma mark - JXPagingViewDelegate

- (UIView *)tableHeaderViewInPagingView:(JXPagingView *)pagingView {
    return self.userHeaderView;
}

- (CGFloat)tableHeaderViewHeightInPagingView:(JXPagingView *)pagingView {
    return JXTableHeaderViewHeight;
}

- (CGFloat)heightForPinSectionHeaderInPagingView:(JXPagingView *)pagingView {
    return JXheightForHeaderInSection;
}

- (UIView *)viewForPinSectionHeaderInPagingView:(JXPagingView *)pagingView {
    return self.categoryView;
}

- (NSInteger)numberOfListViewsInPagingView:(JXPagingView *)pagingView {
    
    return self.titles.count;
}

- (UIView<JXPagingViewListViewDelegate> *)pagingView:(JXPagingView *)pagingView listViewInRow:(NSInteger)row {
    
    return self.listViewArray[row];
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollView {
    
    [self.userHeaderView scrollViewDidScroll:scrollView.contentOffset.y];
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {

    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

    
}

-(void)quiklyClick{
    NSLog(@"快速点击。。。。。。。。");
}


-(void)getRecommendData{
    
    NSString *urlStr = @"http://simba-api.meilishuo.com/mlselection/top/v1/topGoodsList/ios?_ab=3400&_app=mls&_at=ca2e1fa056fb9dc2&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=-1&_saveMode=1&_sdklevel=10.3.1&_swidth=1242&_t=1536222094&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=k5my3vtMSXOpOGEcbbNhbg&limit=50&offset=0&type=sytq";
    [ZMNetworkHelper requestGETWithRequestURL:urlStr parameters:nil success:^(id responseObject) {
        NSArray *rows = responseObject[@"data"][@"rows"];
        for (NSDictionary *dict in rows) {
            HomeModels *model = [HomeModels modelWithDictionary:dict];
            [self.rowsArray addObject:model];
        }
        [self.powerListView configHobbyListViewArray:self.rowsArray];
        [self.hobbyListView configHobbyListViewArray:self.rowsArray];
        [self.partnerListView configHobbyListViewArray:self.rowsArray];
    } failure:^(NSError *error) {
    }];
    
    /*
     http://d.meilishuo.com/detail/mls/v1/main?_ab=3400&_app=mls&_at=0dcd22be527a6a62&_atype=iphone&_av=940&_channel=NILAppStore&_did=24B25A27-8C3D-4CA7-8BC5-A49766AD513F&_fs=NILAppStore940&_isRoot=0&_lang=zh_CN&_network=2&_saveMode=0&_sdklevel=10.3.1&_swidth=1242&_t=1536226900&_version=9.4.0.3400&minfo=iPhone9%2C2&tid-fpid=RQ0qlhTONdQdtabXlTrdov&tid-token=k5my3vtMSXOpOGEcbbNhbg&acm=3.ms.0_4_1m6634i.0.13385-26167-69004.ni0a4r2RluivD.sd_117-t_-lc_1&iid=1m6634i&itemInfoId=1m6634i
     */
    
}
-(NSMutableArray *)rowsArray{
    if (!_rowsArray) {
        _rowsArray = [NSMutableArray array];
    }
    return _rowsArray;
}
@end

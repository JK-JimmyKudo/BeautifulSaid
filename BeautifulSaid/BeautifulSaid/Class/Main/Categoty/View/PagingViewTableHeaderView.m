//
//  PagingViewTableHeaderView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "PagingViewTableHeaderView.h"
#import "HeadViewCell.h"
@interface PagingViewTableHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect imageViewFrame;
@property (nonatomic, strong)  HeadViewCell *headView;

@end

@implementation PagingViewTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataSource = [NSMutableArray array];
        
        
        [self getRecommendData];
        [self setupUI];
    }
    return self;
}


-(void) setupUI{
    
    CGFloat itemW = (kScreenWidth/4);
    CGFloat itemH = itemW + 30;
    long perRowItemCount = 4;
    CGFloat margin = 0;
    
    [self.dataSource enumerateObjectsUsingBlock:^(HomeModels * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        HeadViewCell *headView = [[HeadViewCell alloc]init];
        headView.layer.borderWidth = 0.5;
        headView.layer.borderColor = [PWColor appTextFieldColor].CGColor;
        [self addSubview:headView];
//        headView.backgroundColor = [UIColor orangeColor];
//        headView.hidden = NO;
        [headView.imageView sd_setImageWithURL:[NSURL URLWithString:obj.image] placeholderImage:[UIImage imageNamed:@"placeholder"] options:0];
        headView.titleLabel.text = obj.title;
        self.headView = headView;
        [headView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(columnIndex * (itemW + margin));
            make.top.mas_equalTo(rowIndex * (itemH + margin));
            make.width.mas_equalTo(itemW);
            make.height.mas_equalTo(itemH);
        }];
    }];
    
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = [PWColor appTextFieldColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
        make.top.mas_equalTo(self.headView.mas_bottom);
    }];
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
//    CGRect frame = self.imageViewFrame;
//    frame.size.height -= contentOffsetY;
//    frame.origin.y = contentOffsetY;
//    self.imageView.frame = frame;
}

-(void)getRecommendData{
    
   NSArray *list = @[@{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_216cd6fhj8eeh8661kg3il917402d_265x331.jpg",
        @"link": @"mls://subcategory?fcid=10057049&title=%E4%B8%8A%E8%A1%A3&pid=23023&acm=3.mce.2_10_1igsq.20783.0.wcIQBr2R9Rurq.pos_0-m_430761-sd_119",
        @"acm": @"3.mce.2_10_1igsq.20783.0.wcIQBr2R9Rurq.pos_0-m_430761-sd_119",
        @"sort": @1,
        @"title": @"秋季新品"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180815_2lbjkclg0hkl0k7e1ak2e1c4f0c2e_265x331.jpg",
        @"link": @"mls://subcategory?pid=23020&title=%E8%A3%99%E5%AD%90&fcid=10057050&acm=3.mce.2_10_1eaie.20783.0.wcIQBr2R9Rurr.pos_1-m_333375-sd_119",
        @"acm": @"3.mce.2_10_1eaie.20783.0.wcIQBr2R9Rurr.pos_1-m_333375-sd_119",
        @"sort": @2,
        @"title": @"裙子"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180813_4gklb1467lf5a04dkkfjk0d5ihk9k_265x331.jpg",
        @"link": @"mls://category/wall?fcid=10057051&title=%E8%A3%A4%E5%AD%90&acm=3.mce.2_10_1eaji.20783.0.wcIQBr2R9Rurs.pos_2-m_333395-sd_119",
        @"acm": @"3.mce.2_10_1eaji.20783.0.wcIQBr2R9Rurs.pos_2-m_333395-sd_119",
        @"sort": @3,
        @"title": @"裤子"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180813_78lj102g7ilidih8lfi17h7c63igg_265x331.jpg",
        @"link": @"mls://subcategory?pid=23022&title=%E9%9E%8B%E5%AD%90&fcid=10057052&acm=3.mce.2_10_1eaii.20783.0.wcIQBr2R9Rurt.pos_3-m_333377-sd_119",
        @"acm": @"3.mce.2_10_1eaii.20783.0.wcIQBr2R9Rurt.pos_3-m_333377-sd_119",
        @"sort": @4,
        @"title": @"鞋子"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180813_84hjd7bb967fi52d03faa0d61a0g4_265x331.jpg",
        @"link": @"mls://subcategory?pid=43814&title=%E7%9C%81%E5%BF%83%E5%A5%97%E8%A3%85&fcid=10062744&acm=3.mce.2_10_1el0e.20783.0.wcIQBr2R9Ruru.pos_4-m_340179-sd_119",
        @"acm": @"3.mce.2_10_1el0e.20783.0.wcIQBr2R9Ruru.pos_4-m_340179-sd_119",
        @"sort": @5,
        @"title": @"精选套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180813_3cledcfe4e255cd4jb5la49ced1f1_265x331.jpg",
        @"link": @"mls://category/wall?fcid=10059455&title=%E5%88%9D%E7%A7%8B%E5%A4%96%E5%A5%97&acm=3.mce.2_10_1eaj4.20783.0.wcIQBr2R9Rurv.pos_5-m_333388-sd_119",
        @"acm": @"3.mce.2_10_1eaj4.20783.0.wcIQBr2R9Rurv.pos_5-m_333388-sd_119",
        @"sort": @6,
        @"title": @"初秋外套"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180625_054g0ej64e2iib643b20fjjai9a31_265x331.jpg",
        @"link": @"mls://subcategory?fcid=10057057&title=%E7%94%B7%E5%8F%8B&pid=23018&acm=3.mce.2_10_1eaj0.20783.0.wcIQBr2R9Rurw.pos_6-m_333386-sd_119",
        @"acm": @"3.mce.2_10_1eaj0.20783.0.wcIQBr2R9Rurw.pos_6-m_333386-sd_119",
        @"sort": @7,
        @"title": @"男友"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180831_59adhkehd254jji2gh13a8cc26648_265x331.jpg",
        @"link": @"mls://category/wall?fcid=10059650&title=%E9%A3%8E%E8%A1%A3&acm=3.mce.2_10_1el0c.20783.0.wcIQBr2R9Rurx.pos_7-m_340178-sd_119",
        @"acm": @"3.mce.2_10_1el0c.20783.0.wcIQBr2R9Rurx.pos_7-m_340178-sd_119",
        @"sort": @8,
        @"title": @"长款风衣"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_44l70fhjc2jb8c6h0h3fb8a44gj64_265x331.jpg",
        @"link": @"mls://subcategory?pid=23025&title=%E7%BE%8E%E5%A6%86&fcid=10057056&acm=3.mce.2_10_1eaim.20783.0.wcIQBr2R9Rury.pos_8-m_333379-sd_119",
        @"acm": @"3.mce.2_10_1eaim.20783.0.wcIQBr2R9Rury.pos_8-m_333379-sd_119",
        @"sort": @9,
        @"title": @"美妆个护"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180831_501cagj0c2b3l2jckdifi8l28ji06_265x331.jpg",
        @"link": @"mls://category/wall?fcid=10059473&title=%E5%8D%AB%E8%A1%A3&acm=3.mce.2_10_1eaje.20783.0.wcIQBr2R9Rurz.pos_9-m_333393-sd_119",
        @"acm": @"3.mce.2_10_1eaje.20783.0.wcIQBr2R9Rurz.pos_9-m_333393-sd_119",
        @"sort": @10,
        @"title": @"卫衣"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_0l5ad38b9cj4cl788c90j171hcc0a_265x331.jpg",
        @"link": @"mls://category/wall?fcid=10059472&title=%E9%92%88%E7%BB%87%E5%A4%96%E5%A5%97&acm=3.mce.2_10_1eajg.20783.0.wcIQBr2R9RurA.pos_10-m_333394-sd_119",
        @"acm": @"3.mce.2_10_1eajg.20783.0.wcIQBr2R9RurA.pos_10-m_333394-sd_119",
        @"sort": @11,
        @"title": @"针织衫"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_76ci9ak4k39g1jcf2jkeg40cc0j1e_265x331.jpg",
        @"link": @"mls://subcategory?pid=23027&title=%E9%85%8D%E9%A5%B0&fcid=10057054&acm=3.mce.2_10_1eais.20783.0.wcIQBr2R9RurB.pos_11-m_333382-sd_119",
        @"acm": @"3.mce.2_10_1eais.20783.0.wcIQBr2R9RurB.pos_11-m_333382-sd_119",
        @"sort": @12,
        @"title": @"配饰"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180813_3cbd2lc5l7e8jf0efg73a122g6h11_265x331.jpg",
        @"link": @"mls://subcategory?pid=23019&title=%E5%8C%85%E5%8C%85&fcid=10057053&acm=3.mce.2_10_1eaik.20783.0.wcIQBr2R9RurC.pos_12-m_333378-sd_119",
        @"acm": @"3.mce.2_10_1eaik.20783.0.wcIQBr2R9RurC.pos_12-m_333378-sd_119",
        @"sort": @13,
        @"title": @"包包"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180716_7gdja97359ajd35e646h37kigk727_265x331.jpg",
        @"link": @"mls://subcategory?fcid=10057059&title=%E5%AE%B6%E5%B1%85&pid=23017&acm=3.mce.2_10_1eaj8.20783.0.wcIQBr2R9RurD.pos_13-m_333390-sd_119",
        @"acm": @"3.mce.2_10_1eaj8.20783.0.wcIQBr2R9RurD.pos_13-m_333390-sd_119",
        @"sort": @14,
        @"title": @"家居"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_28fj8f0ii8f0dkgbeh76fkaf3e6fi_265x331.jpg",
        @"link": @"mls://subcategory?fcid=10057055&title=%E5%86%85%E8%A1%A3&pid=23523&acm=3.mce.2_10_1eaiq.20783.0.wcIQBr2R9RurE.pos_14-m_333381-sd_119",
        @"acm": @"3.mce.2_10_1eaiq.20783.0.wcIQBr2R9RurE.pos_14-m_333381-sd_119",
        @"sort": @15,
        @"title": @"内衣"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180530_004lcb11e14ek7i8lcf5i2ab9jj41_265x331.jpg",
        @"link": @"mls://subcategory?fcid=10057058&title=%E6%BD%AE%E5%AE%9D%E7%AB%A5%E8%A3%85&pid=23525&acm=3.mce.2_10_1eaj6.20783.0.wcIQBr2R9RurF.pos_15-m_333389-sd_119",
        @"acm": @"3.mce.2_10_1eaj6.20783.0.wcIQBr2R9RurF.pos_15-m_333389-sd_119",
        @"sort": @16,
        @"title": @"童装"
        }];
    
    for (NSDictionary *dict in list) {
        HomeModels *model = [HomeModels modelWithDictionary:dict];
        [self.dataSource addObject:model];
    }
}

@end

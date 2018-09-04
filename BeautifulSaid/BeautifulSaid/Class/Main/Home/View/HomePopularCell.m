//
//  HomePopularCell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomePopularCell.h"
#import "HomeChildCell.h"
#import "HomePopularModel.h"

@interface HomePopularCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) YYLabel *des_label;

@property (nonatomic,strong) NSMutableArray *listArray;

@property (nonatomic,strong) YYCollectionView *collectionView;


@property (nonatomic,strong) YYLabel *titleLabel;

@property (nonatomic,strong) YYLabel *moreLabel;

@end

static NSString *inderfier = @"HomeChildCell";

@implementation HomePopularCell

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
        self.titleLabel = [[YYLabel alloc] init];
        self.titleLabel.text = @"正在流行";
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(0);
        }];
        
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        self.collectionView = [[YYCollectionView alloc] initWithFrame:CGRectMake(0, 35, FIT_WIDTH, 360) collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor redColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[HomeChildCell class] forCellWithReuseIdentifier:inderfier];
        
        [self getRecommendData];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.listArray.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    
    HomeChildCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:inderfier forIndexPath:indexPath];
    cell.model = self.listArray[indexPath.item];

    return cell;
}


//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((FIT_WIDTH /4), 360/3);
}



-(void)getRecommendData{
    
    
    
    self.listArray = [NSMutableArray array];
    
    
   NSArray *list= @[@{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180828_3iba489ael64ll93f2hdk5d8khi5g_140x140.png",
        @"link": @"https://act.mogujie.com/tianmei001?acm=3.mce.2_10_1j5xw.45470..ziDCSr2zgjIzT.pos_0-m_447054-sd_119",
        @"acm": @"3.mce.2_10_1j5xw.45470..ziDCSr2zgjIzT.pos_0-m_447054-sd_119",
        @"sort": @"1",
        @"title": @"甜美少女套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180821_4fkfh4bie919kka227da60b1ibc12_140x140.jpg",
        @"link": @"https://act.mogujie.com/chuqiu0001?acm=3.mce.2_10_1j306.45470..ziDCSr2zgjIzU.pos_1-m_445151-sd_119",
        @"acm": @"3.mce.2_10_1j306.45470..ziDCSr2zgjIzU.pos_1-m_445151-sd_119",
        @"sort": @"2",
        @"title": @"初秋氧气穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180814_6cee164e835i9hd48fj9h4b0hk4cd_140x140.jpg",
        @"link": @"https://act.mogujie.com/wanghong0001?acm=3.mce.2_10_1izxi.45470..ziDCSr2zgjIzV.pos_2-m_443159-sd_119",
        @"acm": @"3.mce.2_10_1izxi.45470..ziDCSr2zgjIzV.pos_2-m_443159-sd_119",
        @"sort": @"3",
        @"title": @"初秋网红穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180815_5477gjdh6hae6g36l4113625gg36e_140x140.jpg",
        @"link": @"https://act.mogujie.com/qixi00001?acm=3.mce.2_10_1j0r8.45470..ziDCSr2zgjIzW.pos_3-m_443694-sd_119",
        @"acm": @"3.mce.2_10_1j0r8.45470..ziDCSr2zgjIzW.pos_3-m_443694-sd_119",
        @"sort": @"4",
        @"title": @"七夕约会套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180816_5b4e7304b92e316e718bj95d1f91j_140x140.jpg",
        @"link": @"https://act.mogujie.com/kaixue0001?acm=3.mce.2_10_1j1a6.45470..ziDCSr2zgjIzX.pos_4-m_444035-sd_119",
        @"acm": @"3.mce.2_10_1j1a6.45470..ziDCSr2zgjIzX.pos_4-m_444035-sd_119",
        @"sort": @"5",
        @"title": @"开学吸晴穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180809_1eh112i27ekidfc0jc089a11aahed_140x140.jpg",
        @"link": @"https://act.mogujie.com/jietoushaonv0001?acm=3.mce.2_10_1iy2s.45470..ziDCSr2zgjIzY.pos_5-m_441958-sd_119",
        @"acm": @"3.mce.2_10_1iy2s.45470..ziDCSr2zgjIzY.pos_5-m_441958-sd_119",
        @"sort": @"6",
        @"title": @"街头少女穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180604_79h3344df6cgag7016i11ie8ai7cj_140x140.jpg",
        @"link": @"https://act.mogujie.com/liaoren01?acm=3.mce.2_10_1i9g0.45470..ziDCSr2zgjIzZ.pos_6-m_425996-sd_119",
        @"acm": @"3.mce.2_10_1i9g0.45470..ziDCSr2zgjIzZ.pos_6-m_425996-sd_119",
        @"sort": @"7",
        @"title": @"撩男神雪纺装"
    }, @{
                        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180808_5b9bb3kk70g2icg3a5kf293eh2f2a_140x140.jpg",
                        @"link": @"https://act.mogujie.com/july0001?acm=3.mce.2_10_1ixm8.45470..ziDCTr2zgjIz0.pos_7-m_441660-sd_119",
                        @"acm": @"3.mce.2_10_1ixm8.45470..ziDCTr2zgjIz0.pos_7-m_441660-sd_119",
                        @"sort": @8,
                        @"title": @"八月潮流穿搭"
    }, @{
                        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180724_6jbbjd4j2j4h6bi5g1iai39l3gj11_140x140.jpg",
                        @"link": @"https://act.mogujie.com/wenyi0001?acm=3.mce.2_10_1iqk0.45470..ziDCTr2zgjIz1.pos_8-m_437084-sd_119",
                        @"acm": @"3.mce.2_10_1iqk0.45470..ziDCTr2zgjIz1.pos_8-m_437084-sd_119",
                        @"sort": @9,
                        @"title": @"文艺少女套装"
    }, @{
                        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180807_7ejkc51990ck2b57d3lf45j69g3ff_140x140.jpg",
                        @"link": @"https://act.mogujie.com/qiuzhuangtiqian0001?acm=3.mce.2_10_1ix4m.45470..ziDCTr2zgjIz2.pos_9-m_441343-sd_119",
                        @"acm": @"3.mce.2_10_1ix4m.45470..ziDCTr2zgjIz2.pos_9-m_441343-sd_119",
                        @"sort": @10,
                        @"title": @"入秋换季穿搭"
    }, @{
                        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180731_2cgcgf5a376a74ck5d2ba44hkhga1_140x140.jpg",
                        @"link": @"https://act.mogujie.com/tejia0001?acm=3.mce.2_10_1itsk.45470..ziDCTr2zgjIz3.pos_10-m_439182-sd_119",
                        @"acm": @"3.mce.2_10_1itsk.45470..ziDCTr2zgjIz3.pos_10-m_439182-sd_119",
                        @"sort": @11,
                        @"title": @"夏日特价套装"
    }, @{
            
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180801_85j5lk7lk5452bfe4767ck8b4h9ha_140x140.jpg",
        @"link": @"https://act.mogujie.com/chaohai0001?acm=3.mce.2_10_1iu1c.45470..ziDCTr2zgjIz4.pos_11-m_439340-sd_119",
        @"acm": @"3.mce.2_10_1iu1c.45470..ziDCTr2zgjIz4.pos_11-m_439340-sd_119",
        @"sort": @12,
        @"title": @"度假超嗨套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180802_7c10e3ca0g57a0e55f4e7iab310db_140x140.jpg",
        @"link": @"https://act.mogujie.com/huanji01?acm=3.mce.2_10_1iu84.45470..ziDCTr2zgjIz5.pos_12-m_439462-sd_119",
        @"acm": @"3.mce.2_10_1iu84.45470..ziDCTr2zgjIz5.pos_12-m_439462-sd_119",
        @"sort": @13,
        @"title": @"换季完美穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180730_1ifld497hlbbjch9d01ajkd3901de_140x140.jpg",
        @"link": @"https://act.mogujie.com/meibai0001?acm=3.mce.2_10_1itdw.45470..ziDCTr2zgjIz6.pos_13-m_438918-sd_119",
        @"acm": @"3.mce.2_10_1itdw.45470..ziDCTr2zgjIz6.pos_13-m_438918-sd_119",
        @"sort": @14,
        @"title": @"防晒美白套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180730_542adhceh1lc282l20i2leka9gi62_140x140.jpg",
        @"link": @"https://act.mogujie.com/yanzhi00001?acm=3.mce.2_10_1itee.45470..ziDCTr2zgjIz7.pos_14-m_438927-sd_119",
        @"acm": @"3.mce.2_10_1itee.45470..ziDCTr2zgjIz7.pos_14-m_438927-sd_119",
        @"sort": @15,
        @"title": @"颜值美鞋剁手"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180726_0kha7ga4332kahe1639d428fgkijb_140x140.jpg",
        @"link": @"https://act.mogujie.com/tuodan0001?acm=3.mce.2_10_1isf4.45470..ziDCTr2zgjIz8.pos_15-m_438292-sd_119",
        @"acm": @"3.mce.2_10_1isf4.45470..ziDCTr2zgjIz8.pos_15-m_438292-sd_119",
        @"sort": @16,
        @"title": @"8月脱单穿搭指南"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180723_67i2gihl47ab7ek434l331g6kdib6_140x140.jpg",
        @"link": @"https://act.mogujie.com/8yue01?acm=3.mce.2_10_1iq2q.45470..ziDCTr2zgjIz9.pos_16-m_436773-sd_119",
        @"acm": @"3.mce.2_10_1iq2q.45470..ziDCTr2zgjIz9.pos_16-m_436773-sd_119",
        @"sort": @17,
        @"title": @"八月套装上新"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180725_00fc1ii2j399g6d3b9f20i9akkhck_140x140.jpg",
        @"link": @"https://act.mogujie.com/nanshen001?acm=3.mce.2_10_1iqrg.45470..ziDCTr2zgjIza.pos_17-m_437218-sd_119",
        @"acm": @"3.mce.2_10_1iqrg.45470..ziDCTr2zgjIza.pos_17-m_437218-sd_119",
        @"sort": @18,
        @"title": @"抢镜撩男神套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180724_222bc26ecfj7419a1fg8k7i9963e9_140x140.jpg",
        @"link": @"https://act.mogujie.com/binggan0001?acm=3.mce.2_10_1iqg0.45470..ziDCTr2zgjIzb.pos_18-m_437012-sd_119",
        @"acm": @"3.mce.2_10_1iqg0.45470..ziDCTr2zgjIzb.pos_18-m_437012-sd_119",
        @"sort": @19,
        @"title": @"冰感清爽美搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180723_51k87a9ib4a50l14c1d9bb6id65bf_140x140.jpg",
        @"link": @"https://act.mogujie.com/jianfa001?acm=3.mce.2_10_1iq8i.45470..ziDCTr2zgjIzc.pos_19-m_436877-sd_119",
        @"acm": @"3.mce.2_10_1iq8i.45470..ziDCTr2zgjIzc.pos_19-m_436877-sd_119",
        @"sort": @20,
        @"title": @"减龄清新套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180720_2c3j68f53aajklahieikba4hl7840_140x140.jpg",
        @"link": @"https://act.mogujie.com/meida0001?acm=3.mce.2_10_1ioza.45470..ziDCTr2zgjIzd.pos_20-m_436063-sd_119",
        @"acm": @"3.mce.2_10_1ioza.45470..ziDCTr2zgjIzd.pos_20-m_436063-sd_119",
        @"sort": @21,
        @"title": @"暑假旅行美搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180720_123e51l3cfkeg90ba7ljdf5j4cgh0_140x140.jpg",
        @"link": @"https://act.mogujie.com/lixingshaonv0001?acm=3.mce.2_10_1ip9u.45470..ziDCTr2zgjIze.pos_21-m_436253-sd_119",
        @"acm": @"3.mce.2_10_1ip9u.45470..ziDCTr2zgjIze.pos_21-m_436253-sd_119",
        @"sort": @22,
        @"title": @"梨形少女美搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180719_0949l26dc4h9i6kgb7b8f896a6676_140x140.jpg",
        @"link": @"https://act.mogujie.com/xiantuichang01?acm=3.mce.2_10_1iolc.45470..ziDCTr2zgjIzf.pos_22-m_435812-sd_119",
        @"acm": @"3.mce.2_10_1iolc.45470..ziDCTr2zgjIzf.pos_22-m_435812-sd_119",
        @"sort": @23,
        @"title": @"气质衣裤美搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180719_11437ej3kb1g6ek8772j5ef35g17d_140x140.jpg",
        @"link": @"https://act.mogujie.com/zhaopian001?acm=3.mce.2_10_1ior2.45470..ziDCTr2zgjIzg.pos_23-m_435915-sd_119",
        @"acm": @"3.mce.2_10_1ior2.45470..ziDCTr2zgjIzg.pos_23-m_435915-sd_119",
        @"sort": @24,
        @"title": @"日系网红拍照指南"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180716_1l5iggh74c5kdlc806k78c26j643a_140x140.jpg",
        @"link": @"https://act.mogujie.com/renqi001?acm=3.mce.2_10_1io0a.45470..ziDCTr2zgjIzh.pos_24-m_435433-sd_119",
        @"acm": @"3.mce.2_10_1io0a.45470..ziDCTr2zgjIzh.pos_24-m_435433-sd_119",
        @"sort": @25,
        @"title": @"爆红人气女装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180717_0c9lj18d3j6127fh9hh94i30edilb_140x140.png",
        @"link": @"https://act.mogujie.com/xiangaoxianshou001?acm=3.mce.2_10_1io48.45470..ziDCTr2zgjIzi.pos_25-m_435504-sd_119",
        @"acm": @"3.mce.2_10_1io48.45470..ziDCTr2zgjIzi.pos_25-m_435504-sd_119",
        @"sort": @26,
        @"title": @"网红显瘦穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180718_0b5l4254jdb4bkbdllb6k4ba0i247_140x140.png",
        @"link": @"https://act.mogujie.com/fennen0001?acm=3.mce.2_10_1iodo.45470..ziDCTr2zgjIzj.pos_26-m_435674-sd_119",
        @"acm": @"3.mce.2_10_1iodo.45470..ziDCTr2zgjIzj.pos_26-m_435674-sd_119",
        @"sort": @27,
        @"title": @"粉嫩少女穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180717_18ajgk0c44hbdl7eeja39h1ll2690_140x140.png",
        @"link": @"https://act.mogujie.com/nvsne001?acm=3.mce.2_10_1io8e.45470..ziDCTr2zgjIzk.pos_27-m_435579-sd_119",
        @"acm": @"3.mce.2_10_1io8e.45470..ziDCTr2zgjIzk.pos_27-m_435579-sd_119",
       @"sort": @28,
        @"title": @"降温雪纺穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180713_0lj3d769e8hfd17dfl4bfk0g722kh_140x140.jpg",
        @"link": @"https://act.mogujie.com/nvshenjing01?acm=3.mce.2_10_1incw.45470..ziDCTr2zgjIzl.pos_28-m_435012-sd_119",
        @"acm": @"3.mce.2_10_1incw.45470..ziDCTr2zgjIzl.pos_28-m_435012-sd_119",
        @"sort": @29,
        @"title": @"女神出游穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180712_879j888k39e83lc6ld97b1445afca_140x140.jpg",
        @"link": @"https://act.mogujie.com/dachangtui011?acm=3.mce.2_10_1in0s.45470..ziDCTr2zgjIzm.pos_29-m_434794-sd_119",
        @"acm": @"3.mce.2_10_1in0s.45470..ziDCTr2zgjIzm.pos_29-m_434794-sd_119",
        @"sort": @30,
        @"title": @"秒变长腿女神"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180711_2b78ef6j1f65f5jhfj5d296h814d2_140x140.jpg",
        @"link": @"https://act.mogujie.com/meiyan001?acm=3.mce.2_10_1imq6.45470..ziDCTr2zgjIzn.pos_30-m_434603-sd_119",
        @"acm": @"3.mce.2_10_1imq6.45470..ziDCTr2zgjIzn.pos_30-m_434603-sd_119",
        @"sort": @31,
        @"title": @"防晒美颜套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180710_08gj60b6g9d7i79j1kg53254006ch_140x140.jpg",
        @"link": @"https://act.mogujie.com/benzhou009?acm=3.mce.2_10_1imia.45470..ziDCTr2zgjIzo.pos_31-m_434461-sd_119",
        @"acm": @"3.mce.2_10_1imia.45470..ziDCTr2zgjIzo.pos_31-m_434461-sd_119",
        @"sort": @32,
        @"title": @"本周值得买套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180709_04bl4jhb2b99ic0akcgja1e511d03_140x140.jpg",
        @"link": @"https://act.mogujie.com/xiannv001?acm=3.mce.2_10_1imdk.45470..ziDCTr2zgjIzp.pos_32-m_434376-sd_119",
        @"acm": @"3.mce.2_10_1imdk.45470..ziDCTr2zgjIzp.pos_32-m_434376-sd_119",
        @"sort": @33,
        @"title": @"瘦身变仙女套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180709_4g8ka5548cikiea9h8fajb9e0f14d_140x140.jpg",
        @"link": @"https://act.mogujie.com/dujia011?acm=3.mce.2_10_1im6u.45470..ziDCTr2zgjIzq.pos_33-m_434255-sd_119",
        @"acm": @"3.mce.2_10_1im6u.45470..ziDCTr2zgjIzq.pos_33-m_434255-sd_119",
        @"@sort": @34,
        @"title": @"度假时髦精套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180703_0i7503c6llfig58394i619j6cg6b0_140x140.jpg",
        @"link": @"https://act.mogujie.com/xiaoxinji01?acm=3.mce.2_10_1ikdg.45470..ziDCTr2zgjIzr.pos_34-m_433078-sd_119",
        @"acm": @"3.mce.2_10_1ikdg.45470..ziDCTr2zgjIzr.pos_34-m_433078-sd_119",
        @"sort": @35,
        @"title": @"百变心机套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180706_47il968fkklke9lh80haf9ea49jh9_140x140.jpg",
        @"link": @"https://act.mogujie.com/qinglv01?acm=3.mce.2_10_1iljq.45470..ziDCTr2zgjIzs.pos_35-m_433839-sd_119",
        @"acm": @"3.mce.2_10_1iljq.45470..ziDCTr2zgjIzs.pos_35-m_433839-sd_119",
        @"sort": @36,
        @"title": @"抢镜情侣套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180705_0e1hiehda9gbf4jefijl18k55e474_140x140.jpg",
        @"link": @"https://act.mogujie.com/xinji0001?acm=3.mce.2_10_1ikxi.45470..ziDCTr2zgjIzt.pos_36-m_433439-sd_119",
        @"acm": @"3.mce.2_10_1ikxi.45470..ziDCTr2zgjIzt.pos_36-m_433439-sd_119",
        @"sort": @37,
        @"title": @"减龄气质装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180704_0270a0e11fd8i94i81fie345ck1i9_140x140.jpg",
        @"link": @"https://act.mogujie.com/shaonvxin01?acm=3.mce.2_10_1iknu.45470..ziDCTr2zgjIzu.pos_37-m_433265-sd_119",
        @"acm": @"3.mce.2_10_1iknu.45470..ziDCTr2zgjIzu.pos_37-m_433265-sd_119",
        @"sort": @38,
        @"title": @"少女心美裙装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180702_0if89jadkgha55g21fffheehfadkb_140x140.jpg",
        @"link": @"https://act.mogujie.com/qiyue001?acm=3.mce.2_10_1ik1u.45470..ziDCTr2zgjIzv.pos_38-m_432869-sd_119",
        @"acm": @"3.mce.2_10_1ik1u.45470..ziDCTr2zgjIzv.pos_38-m_432869-sd_119",
        @"sort": @39,
        @"title": @"七月最美穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180702_5b6ba1569ii8kdibge8062ekig62a_140x140.jpg",
        @"link": @"https://act.mogujie.com/shimajing01?acm=3.mce.2_10_1ik34.45470..ziDCTr2zgjIzw.pos_39-m_432892-sd_119",
        @"acm": @"3.mce.2_10_1ik34.45470..ziDCTr2zgjIzw.pos_39-m_432892-sd_119",
        @"sort": @40,
        @"title": @"夏日时髦精套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180625_5e3lia9kjbdi38i2efb8jf00kba6a_140x140.jpg",
        @"link": @"https://act.mogujie.com/jiangwen02?acm=3.mce.2_10_1iibg.45470..ziDCTr2zgjIzx.pos_40-m_431746-sd_119",
        @"acm": @"3.mce.2_10_1iibg.45470..ziDCTr2zgjIzx.pos_40-m_431746-sd_119",
        @"sort": @41,
        @"title": @"清爽一夏穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180629_5a0k6dch03hejj0bi2568g17bgd1d_140x140.png",
        @"link": @"https://act.mogujie.com/lanren011?acm=3.mce.2_10_1ijiq.45470..ziDCTr2zgjIzy.pos_41-m_432525-sd_119",
        @"acm": @"3.mce.2_10_1ijiq.45470..ziDCTr2zgjIzy.pos_41-m_432525-sd_119",
        @"sort": @42,
        @"title": @"懒人夏日穿搭大法"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180627_495cjl7jd2f636jcie1fdg2d310ek_140x140.png",
        @"link": @"https://act.mogujie.com/bingliang01?acm=3.mce.2_10_1iivw.45470..ziDCTr2zgjIzz.pos_42-m_432114-sd_119",
        @"acm": @"3.mce.2_10_1iivw.45470..ziDCTr2zgjIzz.pos_42-m_432114-sd_119",
        @"sort": @43,
        @"title": @"降温清凉穿搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180629_537hkl8hi07bi8i6ffledjjg0h1ig_140x140.png",
        @"link": @"https://act.mogujie.com/qizhi001?acm=3.mce.2_10_1ijgq.45470..ziDCTr2zgjIzA.pos_43-m_432489-sd_119",
        @"acm": @"3.mce.2_10_1ijgq.45470..ziDCTr2zgjIzA.pos_43-m_432489-sd_119",
        @"sort": @44,
        @"title": @"显瘦气质少女装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180627_7ckd2g4hkcc33k49g6h5571fjb7ck_140x140.png",
        @"link": @"https://act.mogujie.com/xiannv009?acm=3.mce.2_10_1iizi.45470..ziDCTr2zgjIzB.pos_44-m_432179-sd_119",
        @"acm": @"3.mce.2_10_1iizi.45470..ziDCTr2zgjIzB.pos_44-m_432179-sd_119",
        @"sort": @45,
        @"title": @"仙女T恤流行榜单"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180628_4ihh2ek20fjli3190ceibc1680hll_140x140.png",
        @"link": @"https://act.mogujie.com/paizhao01?acm=3.mce.2_10_1ij3c.45470..ziDCTr2zgjIzC.pos_45-m_432248-sd_119",
        @"acm": @"3.mce.2_10_1ij3c.45470..ziDCTr2zgjIzC.pos_45-m_432248-sd_119",
        @"sort": @46,
        @"title": @"拍照上镜装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180626_71730lea5bbfa3kc611ljhg0bbe1b_140x140.png",
        @"link": @"https://act.mogujie.com/chuyou01?acm=3.mce.2_10_1iing.45470..ziDCTr2zgjIzD.pos_46-m_431962-sd_119",
        @"acm": @"3.mce.2_10_1iing.45470..ziDCTr2zgjIzD.pos_46-m_431962-sd_119",
        @"sort": @47,
        @"title": @"夏日出游美裙"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180626_39h5a6gci9ahcac5k33i3k1cj1dag_140x140.jpg",
        @"link": @"https://act.mogujie.com/weipang01?acm=3.mce.2_10_1iij0.45470..ziDCTr2zgjIzE.pos_47-m_431882-sd_119",
        @"acm": @"3.mce.2_10_1iij0.45470..ziDCTr2zgjIzE.pos_47-m_431882-sd_119",
        @"sort": @48,
        @"title": @"微胖菇凉这样搭"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180615_3jcldaa032jf75iclbk927g1eb340_225x225.jpg",
        @"link": @"https://act.mogujie.com/zheyangchuan01?acm=3.mce.2_10_1if66.45470..ziDCTr2zgjIzF.pos_48-m_429707-sd_119",
        @"acm": @"3.mce.2_10_1if66.45470..ziDCTr2zgjIzF.pos_48-m_429707-sd_119",
        @"sort": @49,
        @"title": @"显瘦时髦套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180620_4f9b0bec0egi8k29gjd569fhgk566_140x140.jpg",
        @"link": @"https://act.mogujie.com/yangqi01?acm=3.mce.2_10_1igku.45470..ziDCTr2zgjIAG.pos_49-m_430619-sd_119",
        @"acm": @"3.mce.2_10_1igku.45470..ziDCTr2zgjIAG.pos_49-m_430619-sd_119",
        @"sort": @49,
        @"title": @"氧气少女套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180625_7j4i1g8ibbc9k11f60j3ibl53d18e_140x140.jpg",
        @"link": @"https://act.mogujie.com/xiatianliangxie011?acm=3.mce.2_10_1iifa.45470..ziDCTr2zgjIAH.pos_50-m_431815-sd_119",
        @"acm": @"3.mce.2_10_1iifa.45470..ziDCTr2zgjIAH.pos_50-m_431815-sd_119",
        @"sort": @50,
        @"title": @"夏日必剁手凉鞋"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180622_4d4b9lg1gcc4gde539fdl25cgc9e3_140x140.jpg",
        @"link": @"https://act.mogujie.com/zenggao01?acm=3.mce.2_10_1ihpo.45470..ziDCTr2zgjIAI.pos_51-m_431354-sd_119",
        @"acm": @"3.mce.2_10_1ihpo.45470..ziDCTr2zgjIAI.pos_51-m_431354-sd_119",
        @"sort": @52,
        @"title": @"增高显瘦裤装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180622_5l65dhj1f87fl051idej4ig25fdg9_140x140.jpg",
        @"link": @"https://act.mogujie.com/youxuanpingce01?acm=3.mce.2_10_1ihr4.45470..ziDCTr2zgjIAJ.pos_52-m_431380-sd_119",
        @"acm": @"3.mce.2_10_1ihr4.45470..ziDCTr2zgjIAJ.pos_52-m_431380-sd_119",
        @"sort": @53,
        @"title": @"七月流行美鞋"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180621_3382h874cj0li5f4bcbe6k3kk93bj_140x140.jpg",
        @"link": @"https://act.mogujie.com/wanghong01?acm=3.mce.2_10_1igyo.45470..ziDCTr2zgjIAK.pos_53-m_430868-sd_119",
        @"acm": @"3.mce.2_10_1igyo.45470..ziDCTr2zgjIAK.pos_53-m_430868-sd_119",
        @"sort": @54,
        @"title": @"解锁网红同款"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180613_0j21f5g9lcgh02i7274h3kb422i2b_140x140.jpg",
        @"link": @"https://act.mogujie.com/qiyue01?acm=3.mce.2_10_1idhi.45470..ziDCTr2zgjIAL.pos_54-m_428615-sd_119",
        @"acm": @"3.mce.2_10_1idhi.45470..ziDCTr2zgjIAL.pos_54-m_428615-sd_119",
        @"sort": @55,
        @"title": @"7月新款套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180621_49il0c78ci705g5fha92f7b0gl801_140x140.jpg",
        @"link": @"https://act.mogujie.com/baokuan01?acm=3.mce.2_10_1ih8g.45470..ziDCTr2zgjIAM.pos_55-m_431044-sd_119",
        @"acm": @"3.mce.2_10_1ih8g.45470..ziDCTr2zgjIAM.pos_55-m_431044-sd_119",
        @"sort": @56,
        @"title": @"偶像穿搭指南"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180619_348jl8kl0j78k0dffih1f4gl381ad_140x140.jpg",
        @"link": @"https://act.mogujie.com/meiyan01?acm=3.mce.2_10_1ig6q.45470..ziDCTr2zgjIAN.pos_56-m_430365-sd_119",
        @"acm": @"3.mce.2_10_1ig6q.45470..ziDCTr2zgjIAN.pos_56-m_430365-sd_119",
        @"sort": @57,
        @"title": @"清爽美颜套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180615_09ef0l07i1b39f70l571l2kfi3i6l_225x225.jpg",
        @"link": @"https://act.mogujie.com/kuzi01?acm=3.mce.2_10_1ifas.45470..ziDCTr2zgjIAO.pos_57-m_429790-sd_119",
        @"acm": @"3.mce.2_10_1ifas.45470..ziDCTr2zgjIAO.pos_57-m_429790-sd_119",
        @"sort": @58,
        @"title": @"本周超美裤装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180619_60bdkf468el6l7k728bik07g72dh5_140x140.jpg",
        @"link":@"https://act.mogujie.com/changtui01?acm=3.mce.2_10_1igau.45470..ziDCTr2zgjIAP.pos_58-m_430439-sd_119",
        @"acm": @"3.mce.2_10_1igau.45470..ziDCTr2zgjIAP.pos_58-m_430439-sd_119",
        @"sort": @59,
        @"title": @"长腿气质套装"
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180611_3a63a9ck3cb0a00ki2jlil4939lk0_140x140.jpg",
        @"link": @"https://act.mogujie.com/zhidemai03?acm=3.mce.2_10_1ibu2.45470..ziDCTr2zgjIAQ.pos_59-m_427545-sd_119",
        @"acm": @"3.mce.2_10_1ibu2.45470..ziDCTr2zgjIAQ.pos_59-m_427545-sd_119",
        @"sort": @60,
        @"title": @"本周值得买套装"
    }];
    
    for (NSDictionary *dict in list) {
        
        HomePopularModel *model = [HomePopularModel modelWithDictionary:dict];
        
        [self.listArray addObject:model];
        
    }
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    MLSLoginViewController *vc = [[MLSLoginViewController alloc] init];
    //    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

@end

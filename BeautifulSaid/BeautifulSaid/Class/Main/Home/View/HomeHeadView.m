//
//  HomeHeadView.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomeHeadView.h"
#import "SDCycleScrollView.h"

#import "HomePopularModel.h"

@interface HomeHeadView ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) YYLabel *des_label;

@property (nonatomic,strong) NSMutableArray *imagesURLStrings;

@property (nonatomic,strong) UIView *mainView;

@property (nonatomic,strong) NSMutableArray *imagesArray;

@property (nonatomic,strong) NSArray *images;


@end

@implementation HomeHeadView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.imagesURLStrings = [NSMutableArray array];
        self.imagesArray = [NSMutableArray array];
        
        [self setupSDCycleScrollView];
        [self setupTitle];
        [self setupFourImage];
        [self setupTimelimit];
    }
    return self;
}

-(void)setupSDCycleScrollView{
    
    
   NSArray *list = @[@{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/181010_4570j59b2l8g128ahel8d5hlj72f8_750x390.jpg",
        @"width923": @750,
        @"height923": @390,
        @"link": @"https://act.mogujie.com/shimaojing00001?acm=3.mce.2_10_1jkxq.43542.0.5Qe7Xr62Bm2pl.pos_0-m_456771-sd_119",
        @"width": @750,
        @"acm": @"3.mce.2_10_1jkxq.43542.0.5Qe7Xr62Bm2pl.pos_0-m_456771-sd_119",
        @"title": @"时髦好衣过深秋",
        @"image923": @"https://s10.mogucdn.com/mlcdn/c45406/181010_879d1geef5gel98i5jhebafhbljjh_750x390.jpg",
        @"height": @390
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180928_0hk3j02jj535le708083def02a6bl_750x390.jpg",
        @"width923": @750,
        @"height923": @390,
        @"link": @"https://act.mogujie.com/chaoliudashang00001?acm=3.mce.2_10_1jius.43542.0.5Qe7Xr62Bm2pm.pos_1-m_455422-sd_119",
        @"width": @750,
        @"acm": @"3.mce.2_10_1jius.43542.0.5Qe7Xr62Bm2pm.pos_1-m_455422-sd_119",
        @"title": @"潮流大赏",
        @"image923": @"https://s10.mogucdn.com/mlcdn/c45406/180928_06lb38df88kkej70igj5a27e0j0eg_750x390.jpg",
        @"height": @390
    }, @{
        @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180929_6ak1hlj9fb4l9e3d2j8fl2f1e2a9i_750x390.jpg",
        @"width923": @750,
        @"height923": @390,
        @"link": @"https://act.mogujie.com/shishanghaoxie0001?acm=3.mce.2_10_1jj22.43542.0.5Qe7Xr62Bm2pn.pos_2-m_455553-sd_119",
        @"width": @750,
        @"acm": @"3.mce.2_10_1jj22.43542.0.5Qe7Xr62Bm2pn.pos_2-m_455553-sd_119",
        @"title": @"时尚好鞋",
        @"image923": @"https://s10.mogucdn.com/mlcdn/c45406/180929_5ehjkh6j4e29glf6g36d9hf7k80f0_750x390.jpg",
        @"height": @390
    }];
    
    
    for (NSDictionary *dic in list) {
        HomePopularModel *model  = [HomePopularModel modelWithDictionary:dic];
        [self.imagesArray addObject:model];
        [self.imagesURLStrings addObject:model.image];
    }
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth *9/16) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = self.imagesURLStrings;
    });
}

-(void)setupTitle{
    
    NSArray *array = @[@"全场包邮",@"先行赔付",@"7天无忧退",@"退货补贴"];
    
    CGFloat Y = kScreenWidth *9/16;
    CGFloat width = kScreenWidth / (array.count);
    CGFloat height = 40;
    for (NSInteger i = 0; i < array.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitleColor:[PWColor appLabeTextlColor] forState:UIControlStateNormal];
        btn.tag = i;
//        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(i*(width),Y, width, height);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)btnclick{
    WHWebViewController *whWebVC = [[WHWebViewController alloc] init];
    whWebVC.urlString = @"http://act.meilishuo.com/fwbz?acm=3.mce.2_10_1bv02.43740.0.9XpX0r62Bm14i.pos_0-m_276669-sd_119";
    [self.viewController.navigationController pushViewController:whWebVC animated:YES];
}



-(void) setupFourImage{
    
    self.images =@[@{
     @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180502_40bk1lf3k614fkecdbb38dl993k4b_225x225.png",
     @"link": @"https://act.mogujie.com/tejiazhuanmai09?acm=3.mce.2_10_1byqk.20116..ziDCSr2zgjIzN.pos_1-m_279090-sd_119",
     @"acm": @"3.mce.2_10_1byqk.20116..ziDCSr2zgjIzN.pos_1-m_279090-sd_119",
     @"title": @"9.9元封顶"
     }, @{ @"image": @"http://s16.mogucdn.com/p2/161222/upload_48hd66c78fj7f95df7h27dkl5g2ik_226x225.png",
           @"link": @"http://act.meilishuo.com/10dianlingquan?acm=3.mce.2_10_1iuj0.20116..ziDCSr2zgjIzK.pos_0-m_439658-sd_119",
           @"acm": @"3.mce.2_10_1iuj0.20116..ziDCSr2zgjIzK.pos_0-m_439658-sd_119",
           @"title": @"10点抢券"
           }, @{
     @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180613_43bfja4d49bcgjglfjhf9c6gg5667_225x225.jpg",
     @"link": @"http://act.meilishuo.com/wap/qianrenpingce01?acm=3.mce.2_10_1ixnw.20116..ziDCSr2zgjIzP.pos_2-m_441690-sd_119",
     @"acm": @"3.mce.2_10_1ixnw.20116..ziDCSr2zgjIzP.pos_2-m_441690-sd_119",
     @"title": @"千人评测"
     },@{
     @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180518_2efl7746ajgbea096bjdi2ld41d95_225x225.jpg",
     @"link": @"mls://mglive/liveChannelList?acm=3.mce.2_10_1gm50.20116..ziDCSr2zgjIzR.pos_3-m_387566-sd_119",
     @"acm": @"3.mce.2_10_1gm50.20116..ziDCSr2zgjIzR.pos_3-m_387566-sd_119",
     @"title": @"直播特卖"
     }];
    
    CGFloat Y = kScreenWidth *9/16 + 40 + 5;
    self.mainView = [[UIView alloc] init];
    self.mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.mainView];
    self.mainView.frame = CGRectMake(0, Y, kScreenWidth, 150);
    
    CGFloat height = 80;
    CGFloat width = 80;
    CGFloat margin = (kScreenWidth - (self.images.count)*width)/5;
    
    for (NSInteger i = 0;  i<self.images.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * (width + margin) + margin, 20, width, height);
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        [self.mainView addSubview:imageView];

        UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewAction:)];
        [imageView addGestureRecognizer:tag];
        
        
        YYLabel *name = [[YYLabel alloc] init];
        [self.mainView addSubview:name];
        name.font = [UIFont systemFontOfSize:14];
        name.textAlignment = NSTextAlignmentCenter;
        name.textColor = [UIColor blackColor];
        name.frame = CGRectMake(i * (width + margin) + margin, CGRectGetMaxY(imageView.frame)+10, width, 30);
//        name.backgroundColor = [UIColor redColor];

        [imageView sd_setImageWithURL:[NSURL URLWithString:self.images[i][@"image"]] placeholderImage:nil];
        name.text = self.images[i][@"title"];
    }
}

-(void) setupTimelimit{
    
   NSDictionary *dict = @{
     @"image": @"https://s10.mogucdn.com/mlcdn/c45406/180808_4a0jhc78504j0a2ale719kbbf9g19_750x420.jpg",
     @"link": @"https://act.mogujie.com/dajia01?acm=3.mce.2_10_1hyrg.45375..ubj8Qr2zgjJxl.pos_0-m_419074-sd_119",
     @"width": @"750",
     @"acm": @"3.mce.2_10_1hyrg.45375..ubj8Qr2zgjJxl.pos_0-m_419074-sd_119",
     @"title": @"限时特卖",
     @"height": @"420"
     };
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    [imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"image"]] placeholderImage:nil];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kScreenWidth *9/16 + 40 + 150 + 10);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(kScreenWidth *9/16);
    }];

    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushWebView)];
    [imageView addGestureRecognizer:tag];

    
}

-(void)imageViewAction:(UITapGestureRecognizer *)tagView{
    
//    NSLog(@"tagView == %d",tagView.view.tag);
    
    NSInteger index = tagView.view.tag;
    NSString *link = [self.images safeObjectAtIndex:index][@"link"];
    WHWebViewController *whWebVC = [[WHWebViewController alloc] init];
    whWebVC.urlString = link;
    [self.viewController.navigationController pushViewController:whWebVC animated:YES];
    
}

-(void)pushWebView{
    WHWebViewController *whWebVC = [[WHWebViewController alloc] init];
    whWebVC.urlString = @"https://act.mogujie.com/dajia01?acm=3.mce.2_10_1hyrg.45375..ubj8Qr2zgjJxl.pos_0-m_419074-sd_119";
    [self.viewController.navigationController pushViewController:whWebVC animated:YES];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    HomePopularModel *model = [self.imagesArray safeObjectAtIndex:index];
    WHWebViewController *whWebVC = [[WHWebViewController alloc] init];
    whWebVC.urlString = model.link;
    [self.viewController.navigationController pushViewController:whWebVC animated:YES];
}
@end

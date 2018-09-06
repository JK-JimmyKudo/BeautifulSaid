//
//  HomeHeadView.m
//  BeautifulSaid
//
//  Created by power on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "HomeHeadView.h"
#import "SDCycleScrollView.h"
@interface HomeHeadView ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) YYLabel *des_label;

@property (nonatomic,strong) NSArray *imagesURLStrings;

@property (nonatomic,strong) UIView *mainView;


@end

@implementation HomeHeadView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSDCycleScrollView];
        [self setupTitle];
        [self setupFourImage];
        [self setupTimelimit];
    }
    return self;
}

-(void)setupSDCycleScrollView{
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://s10.mogucdn.com/mlcdn/c45406/180903_6bjfj78834g4hi00ikdi34l023304_750x390.jpg",
                                  @"https://s10.mogucdn.com/mlcdn/c45406/180903_3g7bd4h14gbd60cgcfcd6506ea424_750x390.jpg",
                                  @"https://s10.mogucdn.com/mlcdn/c45406/180830_02el023idhd7c4elicj0i9efd754a_750x390.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth *9/16) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
}

-(void)setupTitle{
    
    NSArray *array = @[@"全场包邮",@"先行赔付",@"7天无忧退",@"退货补贴"];
    
    CGFloat Y = kScreenWidth *9/16;
    CGFloat width = kScreenWidth / (array.count);
    CGFloat height = 40;
    for (NSInteger i = 0; i < array.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        btn.backgroundColor = [UIColor redColor];
        btn.frame = CGRectMake(i*(width),Y, width, height);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [self addSubview:btn];
    }
}


-(void) setupFourImage{
    
    NSArray *images =@[@{
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
    CGFloat margin = (kScreenWidth - (images.count)*width)/5;
    
    for (NSInteger i = 0;  i<images.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * (width + margin) + margin, 20, width, height);
        imageView.tag = i;
//        imageView.backgroundColor = [UIColor orangeColor];
        [self.mainView addSubview:imageView];
        
        YYLabel *name = [[YYLabel alloc] init];
        [self.mainView addSubview:name];
        name.font = [UIFont systemFontOfSize:14];
        name.textAlignment = NSTextAlignmentCenter;
        name.textColor = [UIColor blackColor];
        name.frame = CGRectMake(i * (width + margin) + margin, CGRectGetMaxY(imageView.frame)+10, width, 30);
//        name.backgroundColor = [UIColor redColor];

        [imageView sd_setImageWithURL:[NSURL URLWithString:images[i][@"image"]] placeholderImage:nil];
        name.text = images[i][@"title"];
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

-(void)pushWebView{
    TGWebViewController *web = [[TGWebViewController alloc] init];
    web.url = @"https://act.mogujie.com/dajia01?acm=3.mce.2_10_1hyrg.45375..ubj8Qr2zgjJxl.pos_0-m_419074-sd_119";
    web.webTitle = @"web";
    web.progressColor = [UIColor blueColor];
    [self.viewController.navigationController pushViewController:web animated:YES];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
//    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

/*
 "data": {
 "list": [{
 "image": "https://s10.mogucdn.com/mlcdn/c45406/180903_6bjfj78834g4hi00ikdi34l023304_750x390.jpg",
 "width923": 750,
 "height923": 390,
 "link": "https://act.mogujie.com/nvzhuang000011?acm=3.mce.2_10_1j840.43542..yNS4zr2EvuB57.pos_0-m_448460-sd_119",
 "width": 750,
 "acm": "3.mce.2_10_1j840.43542..yNS4zr2EvuB57.pos_0-m_448460-sd_119",
 "title": "女装大焕新",
 "image923": "https://s10.mogucdn.com/mlcdn/c45406/180903_1bf7f7l27kb36c396ff3h1f3llcjh_750x390.jpg",
 "height": 390
 }, {
 "image": "https://s10.mogucdn.com/mlcdn/c45406/180903_3g7bd4h14gbd60cgcfcd6506ea424_750x390.jpg",
 "width923": 750,
 "height923": 390,
 "link": "https://act.mogujie.com/liuxingbaobao00001?acm=3.mce.2_10_1j874.43542..yNS4zr2EvuB58.pos_1-m_448516-sd_119",
 "width": 750,
 "acm": "3.mce.2_10_1j874.43542..yNS4zr2EvuB58.pos_1-m_448516-sd_119",
 "title": "流行包包",
 "image923": "https://s10.mogucdn.com/mlcdn/c45406/180903_8d400lke91bf755f1ea61b7fg9521_750x390.jpg",
 "height": 390
 }, {
 "image": "https://s10.mogucdn.com/mlcdn/c45406/180830_02el023idhd7c4elicj0i9efd754a_750x390.jpg",
 "width923": 750,
 "height923": 390,
 "link": "https://act.mogujie.com/qushi00001?acm=3.mce.2_10_1j6q6.43542..yNS4zr2EvuB59.pos_2-m_447563-sd_119",
 "width": 750,
 "acm": "3.mce.2_10_1j6q6.43542..yNS4zr2EvuB59.pos_2-m_447563-sd_119",
 "title": "流行趋向指南",
 "image923": "https://s10.mogucdn.com/mlcdn/c45406/180830_479h565l9ahc4jcic5e4f6gg09dik_750x390.jpg",
 "height": 390
 }],
 "isEnd": false,
 "nextPage": 2,
 "context": {
 "currentTime": 1536037185
 }
 }
 */

@end

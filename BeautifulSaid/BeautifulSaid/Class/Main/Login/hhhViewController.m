//
//  hhhViewController.m
//  BeautifulSaid
//
//  Created by PW on 2018/9/4.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "hhhViewController.h"

@interface hhhViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,assign) CGFloat imageViewY;
@end

@implementation hhhViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavView];
    [self.navView.centerButton setTitle:@"我的订单" forState:UIControlStateNormal];
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    
    [self setupUI];
}

-(void)setupUI{

   NSArray *list = @[@"http://s3.mogucdn.com/mlcdn/c45406/180901_0j2gfb2k9ilaadhfh0f8i0cbkdlaj_800x800.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_6e39lc0dl0dba03c0h9bcjhc9073h_3024x3024.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_1l647alk48gl3j5hfg1ad6kkcf3ec_800x800.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_4i035f7lhcikaaea94c6k81c1fga6_800x800.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_1ej233ha73igc9i5ah5ab7l2gkldi_800x800.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_68dl347k0c607kg9d7fe93gbd7klj_750x1502.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_3lc019g179bgagb5j8cf2ld6ga165_800x1233.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_1084j3d6flbe8h9b9d3d8136kbaj7_800x1155.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_2k92g295h8g6b6aagl4bfb6ec27d5_800x1296.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_1h233d5e99bje91f0297dacjifgg3_750x2380.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_630572723b3kj240k27l8kihc3afl_750x2539.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_8fi7d7i67ii6gah2259j4h21a0bbj_750x2688.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_7l3j9eegc92k78h2gifkb77l1cl0h_750x2363.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_87g0b893d7ihfdbel51gk9151b636_750x2412.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_4cg2a664f18796g5e7gb37j1l720i_750x1644.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_7gilf90l63k1hdgc3ci2b321bj85d_750x1595.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_46iia0e6blc5b095lie0a5a3ll130_750x1632.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_6g4c0kl0ba0409je5kg1709ege936_750x984.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_1l7hef0eefhk15ckdffdd4l386bk5_750x2640.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_4933c93i28cci57eg7g2d69gdjdg9_750x2767.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_315fd79b9d9fikd598dd8kj64451l_750x3240.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_50cfdell249a85edk0jlhi4je650f_750x2640.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_0995bkj88700570bdkil7g0h8k14i_750x2599.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_309322c52lb7ljfg9877570d3i16j_750x2496.jpg",
                     @"http://s3.mogucdn.com/mlcdn/c45406/180901_23i33d37lcc0d1g3acga9lbbl2a1d_750x2424.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_4jl7j3dhe522lf27c0eb9j60h6260_750x3047.jpg",
                     @"http://s11.mogucdn.com/mlcdn/c45406/180901_2b8jlk0a0ffj44dbb3f51fdfl7f2b_750x3504.jpg",
                     @"http://s11.mogucdn.com/p2/170317/77101615_86e9f0elcl86499l16jf26aallg14_1125x380.jpg"];
    
    WEAKSELF;
    
    weakSelf.imageViewY = 0;
    
    for (NSInteger i = 0; i<list.count; i++) {
        
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.scrollView addSubview:imageView];
        NSString *imgUrl = [list safeObjectAtIndex:i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            NSLog(@"image.size == %f == %f",image.size.width,image.size.height);
            
            weakSelf.imageViewY += (image.size.height/3 + 10);
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.scrollView);
                make.width.mas_equalTo(SCREEN_WIDTH);
                make.top.mas_equalTo(weakSelf.imageViewY);
                make.height.mas_equalTo(image.size.height/3);
            }];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, weakSelf.imageViewY);
            });
            
        }];
        
//        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:imgUrl] options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//            NSLog(@"image.size == %f == %f",image.size.width,image.size.height);
//            weakSelf.imageViewY = (450 + 10) * i;
//
//            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.centerX.mas_equalTo(self.scrollView);
//                make.width.mas_equalTo(SCREEN_WIDTH);
//                make.top.mas_equalTo(weakSelf.imageViewY);
//                make.height.mas_equalTo(450);
//            }];
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//
//                self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, weakSelf.imageViewY);
//            });
//        }];
//
        
        
    }
}

//// 触发segmentView事件
//- (void)contenntViewScroll:(CGFloat)pacentage index:(NSInteger)index direction:(NSInteger)direction;
//- (void)contenntViewScrollToIndex:(NSInteger)index;
//- (void)contenntSelectButtonIndex:(NSInteger)index;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  PWGDHeadView.m
//  BeautifulSaid
//
//  Created by power on 2018/10/11.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "PWGDHeadView.h"
#import "FLCycleCarouselView.h"
@interface PWGDHeadView ()<InfiniteCarouselDelegate>

@property (nonatomic, strong) FLCycleCarouselView *carouselView;

@property (nonatomic,strong) NSMutableArray *imagesGroup;

@end

@implementation PWGDHeadView

-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.carouselView = [[FLCycleCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        self.carouselView.delegate = self;
        self.carouselView.cornerRadius = 5;
        self.carouselView.autoScrollTime = 0.2;
        self.carouselView.placeholder = @"icon_loading_banner";
        [self addSubview:self.carouselView];
        
        self.imagesGroup = [NSMutableArray arrayWithArray:@[
                            @"http://s3.mogucdn.com/mlcdn/c45406/181007_5gijd94j1c2725kghif39he2f2baj_1080x1080.jpg",
                            @"http://s3.mogucdn.com/mlcdn/c45406/181007_42j611i8j4f14fc55e8555dflg78k_1080x1080.jpg",
                            @"http://s11.mogucdn.com/mlcdn/c45406/181007_24aa3akcbk6d0077le7f75318g7a2_1080x1080.jpg"]];
        
        self.carouselView.imageURLStringsGroup = self.imagesGroup;
    }
    
    return self;
}

- (void)carousel:(FLCycleCarouselView *)carousel didSelectItemAtModel:(BannerModel *)model{
    
}

@end

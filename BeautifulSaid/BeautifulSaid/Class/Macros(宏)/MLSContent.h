//
//  MLSContent.h
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#ifndef MLSContent_h
#define MLSContent_h

#import "ZMNavView.h"
#import "MLSColor.h"
#import "MLSearchView.h"
#import "YYTableView.h"
#import "YYTableViewCell.h"
#import "ZMNetworkHelper.h"
#import "YYCollectionView.h"
#import "YYCollectionViewcell.h"


#import <YYKit/YYKit.h>
#import <MJRefresh/MJRefresh.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYKit/YYKit.h>
#import <YYLabel.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import <Reachability/Reachability.h>
#import <Masonry/Masonry.h>
#import <pop/POP.h>




#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define FIT_WIDTH   [UIScreen mainScreen].bounds.size.width
#define FIT_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define placeholderFailImage [YYImage imageWithColor:[ZMColor colorWithHexString:@"#ECECEC"]]
//default_avatar
#define placeholderAvatarImage [UIImage imageNamed:@"default_avatar"]
#define backArrowIcon          [UIImage imageNamed:@"navigation_back"]
#define backArrowWhiteIcon     [UIImage imageNamed:@"navigation_back_white"]

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define KStatusBarHeight (kDevice_Is_iPhoneX ? 24.f:0.f)
#define KStatusBarMargin (kDevice_Is_iPhoneX ? 22.f:0.f)
#define KTabBarHeight    (kDevice_Is_iPhoneX ? 34.f:0.f)

#define pageMenuH 40
#define NaviH (kScreenHeight == 812 ? 88 : 64) // 812是iPhoneX的高度
#define KWaterSpace     3.0
#define KMarginLeft     12.0
#define KMarginRight    20.0

#define WEAKSELF __weak typeof(self) weakSelf = self
#define BLOCKSELF __block typeof(self)weakSelf = self




#endif /* MLSContent_h */

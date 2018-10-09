//
//  SearchTagHeadView.h
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClearButtonBlock)();

@interface SearchTagHeadView : UIView


@property (nonatomic,copy) ClearButtonBlock  clearButtonBlock;

@property (strong, nonatomic)  UIView *view;

@property (strong, nonatomic)  UIImageView *leftImageView;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UIButton *clearButton;

@end

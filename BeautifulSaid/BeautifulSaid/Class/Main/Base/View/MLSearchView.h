//
//  MLSearchView.h
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MLSearchView;
@protocol MLSearchViewDelegate <NSObject>

- (void)dismissButtonWasPressedForSearchDetailView:(MLSearchView *)searchView;

- (void)searchButtonWasPressedForSearchDetailView:(MLSearchView *)searchView;

- (void)textFieldEditingChangedForSearchDetailView:(MLSearchView *)searchView;

@end

@interface MLSearchView : UIView

@property (nonatomic,strong) UITextField *searchText;

@property (nonatomic,strong) UIButton *canBtn;

@property (nonatomic,strong) UIButton *SweepBtn;

@property (weak, nonatomic) id<MLSearchViewDelegate> delegate;


@end

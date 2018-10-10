//
//  MLSearchView.h
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PWSearchView;
@protocol PWSearchViewDelegate <NSObject>

- (void)dismissButtonWasPressedForSearchView:(PWSearchView *)searchView;

- (void)searchButtonWasPressedForSearchView:(PWSearchView *)searchView;

- (void)textFieldEditingChangedForSearchView:(PWSearchView *)searchView TextFiledStr:(NSString *)text;

- (void)textFieldDidBeginEditingChangedForSearchView:(PWSearchView *)searchView;

- (void)textFieldShouldBeginEditingSearchView:(PWSearchView *)searchView;

@end

@interface PWSearchView : UIView

@property (nonatomic,strong) UITextField *searchText;

@property (nonatomic,strong) UIButton *canBtn;

@property (nonatomic,strong) UIButton *SweepBtn;

@property (nonatomic,strong) UIButton *searchBtn;

@property (nonatomic,assign,getter=isEditing) BOOL isEditing;

@property (weak, nonatomic) id<PWSearchViewDelegate> delegate;


@end

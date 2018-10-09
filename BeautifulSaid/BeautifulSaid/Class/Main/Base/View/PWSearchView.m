//
//  MLSearchView.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "PWSearchView.h"

@interface PWSearchView ()<UITextFieldDelegate>


@end

@implementation PWSearchView


-(instancetype) initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        

        [self setupViews];
        
    }
    return self;
}


- (void)setupViews {
    
    NSLog(@"isEditing == %d",_isEditing);
    
    
    
    self.searchText = [[UITextField alloc] init];
    [self addSubview:self.searchText];
    self.searchText.layer.cornerRadius = 5.0f;
    self.searchText.layer.masksToBounds = YES;
    self.searchText.placeholder = @"测试";
    self.searchText.font = [UIFont systemFontOfSize:13];
    self.searchText.delegate = self;
    [self setupTextFieldLeftView];
    [self.searchText setValue:[UIColor colorWithRed:176 / 255.0f green:176 / 255.0f blue: 176 / 255.0f alpha:1.0f]
                   forKeyPath:@"_placeholderLabel.textColor"];
    self.searchText.tintColor = [UIColor colorWithRed:98 / 255.0f green:97 / 255.0f blue: 101 / 255.0f alpha:1.0f];
    self.searchText.backgroundColor = [UIColor colorWithRed:176 / 255.0f green:176 / 255.0f blue: 176 / 255.0f alpha:1.0f];
    [self.searchText addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    self.searchBtn = [[UIButton alloc] init];
    self.searchBtn.backgroundColor = [UIColor orangeColor];
    [self.searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.searchBtn];
    
    
    self.SweepBtn = [[UIButton alloc] init];
    [self.SweepBtn setImage:[UIImage imageNamed:@"homepage_scan_icon"] forState:UIControlStateNormal];
    self.SweepBtn.backgroundColor = [UIColor redColor];
    [self.SweepBtn addTarget:self action:@selector(SweepBtnClick) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.SweepBtn];
    
    
    self.canBtn = [[UIButton alloc] init];
    [self addSubview:self.canBtn];
    self.canBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.canBtn.backgroundColor = [UIColor redColor];
    [self.canBtn addTarget:self action:@selector(dismissButtonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.canBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchText.mas_centerY);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(40);
    }];
    
    
    [self.searchText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(self.canBtn.mas_left).offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(25);
        make.right.mas_equalTo(self.canBtn.mas_left).offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    
    [self.SweepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchText.mas_centerY);
        make.right.mas_equalTo(self.searchText.mas_right).offset(-8);
        make.height.width.mas_equalTo(20);
    }];
    
}

- (void)setupTextFieldLeftView {
    UIImageView *searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchImageView.image = [UIImage imageNamed:@"homepage_search_icon"];
    searchImageView.contentMode = UIViewContentModeCenter;
    self.searchText.leftView = searchImageView;
    self.searchText.leftViewMode = UITextFieldViewModeAlways;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [self.searchText resignFirstResponder];
//    if ([self.delegate respondsToSelector:@selector(searchButtonWasPressedForSearchDetailView:)]) {
//        [self.delegate searchButtonWasPressedForSearchDetailView:self];
//    }
    return YES;
}

- (void)textFieldEditingChanged:(UITextField *)sender {
//    if ([self.delegate respondsToSelector:@selector(textFieldEditingChangedForSearchDetailView:)]) {
//        [self.delegate textFieldEditingChangedForSearchDetailView:self];
//    }
//
    if (sender.text.length <= 0) {
        self.SweepBtn.hidden = NO;
        
    }else{
        self.SweepBtn.hidden = YES;
    }
}

//点击这个方法 就相当于点击了一个按钮，在这里做自己想做的
-(void)textFieldDidBeginEditing:(UITextField*)textField
{
    
//    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidBeginEditingChangedForSearchView:)]) {
//        [self.delegate textFieldDidBeginEditingChangedForSearchView:self];
//    }
//       [textField resignFirstResponder];
    NSLog(@"string");
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//
//    NSLog(@"textFieldShouldBeginEditing  == %d",_isEditing);
//
//
//    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldShouldBeginEditingSearchView:)]) {
//        [self.delegate textFieldShouldBeginEditingSearchView:self];
//    }
//    [self.searchText resignFirstResponder];
//
//    if (_isEditing) {
//        return YES;
//    }
//    return NO;
//}


#pragma mark - Handlers


-(void)searchBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldShouldBeginEditingSearchView:)]) {
        [self.delegate textFieldShouldBeginEditingSearchView:self];
    }
}

-(void)SweepBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchButtonWasPressedForSearchView:)]) {
        [self.delegate searchButtonWasPressedForSearchView:self];
    }
}

- (void)dismissButtonWasPressed:(UIButton *)sender {
//    [self.searchText resignFirstResponder];
//    if ([self.delegate respondsToSelector:@selector(dismissButtonWasPressedForSearchDetailView:)]) {
//        [self.delegate dismissButtonWasPressedForSearchDetailView:self];
//    }
    
    
}


@end

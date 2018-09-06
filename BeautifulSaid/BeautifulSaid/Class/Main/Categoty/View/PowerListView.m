//
//  PowerListView.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/27.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "PowerListView.h"

@implementation PowerListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = @[@"橡胶火箭"];
        
        
    }
    return self;
}

-(void) configHobbyListViewArray:(NSArray *)array{
    
    NSLog(@"array == %@",array);
    
    
    self.dataSource = array;
    
    [self.collectionView reloadData];
    
}

@end

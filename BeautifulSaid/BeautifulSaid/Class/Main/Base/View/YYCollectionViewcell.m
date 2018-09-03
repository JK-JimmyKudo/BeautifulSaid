//
//  YYCollectionViewcell.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "YYCollectionViewcell.h"

@implementation YYCollectionViewcell

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        for (UIView *view in self.subviews) {
            if([view isKindOfClass:[UIScrollView class]]) {
                ((UIScrollView *)view).delaysContentTouches = NO; // Remove touch delay for iOS 7
                break;
            }
        }
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


@end

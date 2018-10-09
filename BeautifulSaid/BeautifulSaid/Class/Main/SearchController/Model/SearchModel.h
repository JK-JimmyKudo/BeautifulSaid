//
//  SearchModel.h
//  BeautifulSaid
//
//  Created by power on 2018/10/9.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject

@property (nonatomic,assign) CGFloat TagHeight;

-(void) setupTagHeight:(NSMutableArray *)dataSource;

@end

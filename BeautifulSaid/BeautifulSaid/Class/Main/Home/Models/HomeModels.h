//
//  HomeModels.h
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModels : NSObject

/*
 "image": "http://s11.mogucdn.com/mlcdn/55cf19/180819_80h129c4a06dfh98292622ck154j5_640x960.jpg",
 "price": "85.60",
 "discountPrice": "59.92",
 "h5GoodUrl": "http://item.meilishuo.com/h5/detail/1m7fcei?acm=3.ms.0_4_1m7fcei.0.13385-69004.s026ur2zvS0Cy.sd_117-t_-lc_1",
 "pcGoodUrl": "http://item.meilishuo.com/detail/1m7fcei?acm=3.ms.0_4_1m7fcei.0.13385-69004.s026ur2zvS0Cy.sd_117-t_-lc_1",
 "wapGoodUrl": "http://m.meilishuo.com/wap/detail/1m7fcei?acm=3.ms.0_4_1m7fcei.0.13385-69004.s026ur2zvS0Cy.sd_117-t_-lc_1",
 "collectNum": 25,
 "isShelf": 0,
 "isDeleted": 0,
 "stock": 1000,
 "saleNum": 7892,
 "dayCollectNum": null,
 "daySaleNum": null,
 "goodsStatus": null,
 "itemMarks": "-1",
 "marksUrl": null,
 "marks": null,
 "tagUrl": {},
 "isFaved": false,
 "acm": "3.ms.0_4_1m7fcei.0.13385-69004.s026ur2zvS0Cy.sd_117-t_-lc_1",
 "props": ["时尚套装", "九分裤套装", "减龄", "俏皮", "条纹", "圆领", "百搭", "宽松", "秋季", "新款", "韩版"]
 */

@property (nonatomic,copy) NSString *signGoodsId;
/** 标题*/
@property (nonatomic,copy) NSString *title;
/**描述*/
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *discountPrice;
@property (nonatomic,copy) NSString *h5GoodUrl;
@property (nonatomic,copy) NSString *pcGoodUrl;
@property (nonatomic,copy) NSString *wapGoodUrl;
@property (nonatomic,copy) NSString *collectNum;
@property (nonatomic,copy) NSString *isShelf;
@property (nonatomic,copy) NSString *isDeleted;
@property (nonatomic,copy) NSString *stock;
@property (nonatomic,copy) NSString *saleNum;
@property (nonatomic,copy) NSString *dayCollectNum;
@property (nonatomic,copy) NSString *daySaleNum;
@property (nonatomic,copy) NSString *goodsStatus;
@property (nonatomic,copy) NSString *itemMarks;
@property (nonatomic,copy) NSString *marksUrl;
@property (nonatomic,copy) NSString *marks;
@property (nonatomic,strong) NSDictionary *tagUrl;
@property (nonatomic,copy) NSString *isFaved;
@property (nonatomic,copy) NSString *acm;
@property (nonatomic,strong) NSArray *props;



@end

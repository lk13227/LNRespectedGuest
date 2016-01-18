//
//  Product.h
//  LNRespectedGuest
//
//  Created by 理念-刘凯 on 16/1/15.
//  Copyright © 2016年 Yun. All rights reserved.
//

#import <Foundation/Foundation.h>

//
//测试商品信息封装在Product中,外部商户可以根据自己商品实际情况定义
//
@interface Product : NSObject{
@private
    float     _price;
    NSString *_subject;
    NSString *_body;
    NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;

@end

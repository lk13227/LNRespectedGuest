//
//  OrderConfirmationVC.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/18.
//  Copyright © 2015年 Yun. All rights reserved.
//订单确认

#import <UIKit/UIKit.h>

//
//测试商品信息封装在Product中,外部商户可以根据自己商品实际情况定义
//
//@interface Product : NSObject{
//@private
//    float     _price;
//    NSString *_subject;
//    NSString *_body;
//    NSString *_orderId;
//}
//
//@property (nonatomic, assign) float price;
//@property (nonatomic, copy) NSString *subject;
//@property (nonatomic, copy) NSString *body;
//@property (nonatomic, copy) NSString *orderId;
//
//@end

@interface OrderConfirmationVC : UIViewController

@property(nonatomic, strong)NSMutableArray *productList;//商品列表

@end

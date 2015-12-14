//
//  merchantsThreeModel.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/14.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface merchantsThreeModel : NSObject

@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *name;
/**
 *  如果是bool类型 要重写set方法 命名规范
 */
@property (nonatomic,assign,getter=isVip)BOOL vip;
@property (nonatomic,strong)NSString *text;
@property (nonatomic,strong)NSString *picture;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)threeModelWithDic:(NSDictionary *)dic;

+ (NSArray *)threeModelList;

@end

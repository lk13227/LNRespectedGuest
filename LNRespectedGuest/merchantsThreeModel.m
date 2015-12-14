//
//  merchantsThreeModel.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/14.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "merchantsThreeModel.h"

@implementation merchantsThreeModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)threeModelWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)threeModelList{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"microblog" ofType:@"plist"];
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
    //字典转模型
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSDictionary *dic in dicArr) {
        merchantsThreeModel *model = [merchantsThreeModel threeModelWithDic:dic];
        [tmpArr addObject:model];
    }
    return tmpArr;
}

@end

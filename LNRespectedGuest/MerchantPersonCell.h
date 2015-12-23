//
//  MerchantPersonCell.h
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/23.
//  Copyright © 2015年 Yun. All rights reserved.
//贵人（员）

#import <UIKit/UIKit.h>

@interface MerchantPersonCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titLabel;//名称
@property (weak, nonatomic) IBOutlet UILabel *subLabel;//内容介绍
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;//折扣
@property (weak, nonatomic) IBOutlet UILabel *discountNumLabel;//折扣数目
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;//积分
@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;//收藏
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;//分享
@property (weak, nonatomic) IBOutlet UIButton *useBtn;//立即使用

@end

//
//  MerchantPersonCell.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/23.
//  Copyright © 2015年 Yun. All rights reserved.
//贵人（员）

#import "MerchantPersonCell.h"

@implementation MerchantPersonCell

- (void)awakeFromNib {
    // Initialization code
    self.titLabel.text = @"必胜宅急送";
    self.titLabel.font = [UIFont systemFontOfSize:15.0];
    self.subLabel.text = @"内容介绍:必胜宅急送必胜宅急送必胜宅急送必胜宅急送必胜宅急送";
    self.subLabel.font = [UIFont systemFontOfSize:13.0];
    self.discountLabel.text = @"折扣信息:";
    self.discountLabel.font = [UIFont systemFontOfSize:11.0];
    self.discountNumLabel.text = @"7折";
    self.discountNumLabel.textColor = [UIColor colorWithRed:212./255. green:95./255. blue:114./255. alpha:1.0];
    self.discountNumLabel.font = [UIFont systemFontOfSize:11.0];
    self.integralLabel.text = @"贵人积分:100分";
    self.integralLabel.font = [UIFont systemFontOfSize:13.0];
    self.integralLabel.textColor = [UIColor colorWithRed:40./255. green:169./255. blue:179./255. alpha:1.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

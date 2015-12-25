//
//  MerchantManSecondCell.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//贵商（second）

#import "MerchantManSecondCell.h"

@implementation MerchantManSecondCell

- (void)awakeFromNib {
    // Initialization code
    self.titleLabel.text = @"必胜宅急送";
    self.titleLabel.font = [UIFont systemFontOfSize:15.0];
    self.subLabel.text = @"内容介绍:必胜宅急送必胜宅急送必胜宅急送必胜宅急送";
    self.subLabel.font = [UIFont systemFontOfSize:13.0];
    self.discountLabel.text = @"折扣信息:";
    self.discountLabel.font = [UIFont systemFontOfSize:11.0];
    self.discountNumLabel.text = @"7折";
    self.discountNumLabel.textColor = [UIColor colorWithRed:212./255. green:95./255. blue:114./255. alpha:1.0];
    self.discountNumLabel.font = [UIFont systemFontOfSize:11.0];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

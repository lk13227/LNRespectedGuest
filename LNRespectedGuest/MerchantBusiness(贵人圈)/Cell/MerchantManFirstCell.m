//
//  MerchantManFirstCell.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//贵商（first）

#import "MerchantManFirstCell.h"

@implementation MerchantManFirstCell

- (void)awakeFromNib {
    // Initialization code
    self.nameLabel.text = @"北京梦幻紫蛋糕店";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15.0];
    self.picImageView.image = [UIImage imageNamed:@"scrollView2.jpg"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

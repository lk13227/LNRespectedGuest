//
//  StoreCell.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "StoreCell.h"

@implementation StoreCell

- (void)awakeFromNib {
    // Initialization code
    self.picImageView.image = [UIImage imageNamed:@"scrollView5.jpg"];
    self.titleLabel.text = @"红豆相思奶茶";
    self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    self.subLabel.text = @"12元/杯";
    self.subLabel.font = [UIFont systemFontOfSize:15.0f];
    
}
/**
 *  添加按钮-点击事件
 */
- (IBAction)addBtn:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

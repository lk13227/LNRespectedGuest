//
//  MessageCell.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/7.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
    
    /**
     *  联系人头像
     */
    self.picImageView.image = [UIImage imageNamed:@"scrollView0.jpg"];
    
    /**
     *  联系人姓名
     */
    self.titleLabel.textColor = [UIColor colorWithRed:54./255. green:54./255. blue:54./255. alpha:1.0];
    
    self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    self.titleLabel.text = @"肖总";
    
    /**
     *  时间
     */
    self.timeLabel.textColor = [UIColor colorWithRed:169./255. green:169./255. blue:169./255. alpha:1.0];
    
    self.timeLabel.font = [UIFont systemFontOfSize:15.0f];
    self.timeLabel.text = @"下午1:43";
    /**
     *  聊天内容
     */
    self.subLabel.textColor = [UIColor colorWithRed:169./255. green:169./255. blue:169./255. alpha:1.0];
    
    self.subLabel.font = [UIFont systemFontOfSize:13.0f];
    self.subLabel.text = @"嗯嗯，我知道了！";

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

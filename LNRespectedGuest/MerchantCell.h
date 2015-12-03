//
//  MerchantCell.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/3.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantCell : UITableViewCell

/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**
 *  时间
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**
 *  内容
 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/**
 *  内容图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
/**
 *  分享按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
/**
 *  评论按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *commentsBtn;
/**
 *  赞
 */
@property (weak, nonatomic) IBOutlet UILabel *praiseLabel;

@end

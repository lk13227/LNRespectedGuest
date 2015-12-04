//
//  MessageCell.h
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/4.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;//头像图片
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//姓名
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;//消息内容

@end

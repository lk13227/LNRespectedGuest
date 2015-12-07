//
//  MessageCell.h
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/7.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

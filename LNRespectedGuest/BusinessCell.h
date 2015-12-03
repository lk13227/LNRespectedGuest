//
//  BusinessCell.h
//  LNRespectedGuest
//
//  Created by Barry on 15/11/28.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessCell : UITableViewCell
/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
/**
 *  商家名称
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  近期售出
 */
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
/**
 *  详细（送达时间）
 */
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;

@end

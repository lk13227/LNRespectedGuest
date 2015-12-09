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
 *  图片
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
 *  详细（满减优惠）
 */
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
/**
 *  贵圈
 */
@property (weak, nonatomic) IBOutlet UIButton *GuiQuanBtn;
/**
 *  贵员
 */
@property (weak, nonatomic) IBOutlet UIButton *GuiYuanBtn;
/**
 *  贵人
 */
@property (weak, nonatomic) IBOutlet UIButton *GuiRenBtn;

@end

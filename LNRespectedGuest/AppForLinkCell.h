//
//  AppForLinkCell.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppForLinkCell : UITableViewCell

/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/**
 *  商店名
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  累计
 */
@property (weak, nonatomic) IBOutlet UILabel *cumulativeLabel;
/**
 *  内容介绍
 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

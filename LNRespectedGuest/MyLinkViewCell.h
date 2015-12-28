//
//  MyLinkViewCell.h
//  LNRespectedGuest
//
//  Created by Barry on 15/12/25.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLinkViewCell : UITableViewCell
/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
/**
 *  大标题
 */
@property (weak, nonatomic) IBOutlet UILabel *dianName;
/**
 *  内容
 */
@property (weak, nonatomic) IBOutlet UILabel *DiscountInformation;



@end

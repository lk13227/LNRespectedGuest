//
//  MerchantCell.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/3.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MerchantCell.h"

@implementation MerchantCell

- (void)awakeFromNib {
    // Initialization code
    
//    [self createUI];
}

//#pragma mark - cell适配
//- (void)createUI{
//    
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
- (IBAction)iconClick:(id)sender {
    LKLog(@"点击了头像");
}
- (IBAction)shareClick:(id)sender {
    LKLog(@"点击了分享");
}
- (IBAction)commentsClick:(id)sender {
    LKLog(@"点击了评论");
}

@end

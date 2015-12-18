//
//  StoreOneOneCell.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/18.
//  Copyright © 2015年 Yun. All rights reserved.
//

#define W self.contentView.bounds.size.width
#define H 160

#import "StoreOneOneCell.h"

@implementation StoreOneOneCell



//重用方法
+ (instancetype)storeOneCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"storeOne";
    StoreOneOneCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.scrollView = [[UIScrollView alloc] init];
        // 是否支持滑动最顶端
        [self.scrollView setShowsHorizontalScrollIndicator:NO];
        // 是否反弹
        self.scrollView.bounces = NO;
        // 是否分页
        self.scrollView.pagingEnabled = YES;
        // 提示用户,Indicators flash
        [self.scrollView flashScrollIndicators];
        // 是否同时运动,lock
        self.scrollView.directionalLockEnabled = YES;
        
        [self.contentView addSubview:self.scrollView];
        
    }
    return self;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  merchantsThreeCell.h
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/14.
//  Copyright © 2015年 Yun. All rights reserved.
//商家子页第三个cell

#import <UIKit/UIKit.h>

@class merchantsThreeFrame;
@interface merchantsThreeCell : UITableViewCell

//@property (nonatomic,strong)merchantsThreeModel *threeModel;
@property (nonatomic,strong)merchantsThreeFrame *threeModelFrame;

+ (instancetype)threeCellWithTableView:(UITableView *)tableView;

@end

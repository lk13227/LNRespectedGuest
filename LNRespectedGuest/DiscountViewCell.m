//
//  DiscountViewCell.m
//  LNRespectedGuest
//
//  Created by Barry on 15/12/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "DiscountViewCell.h"

@implementation DiscountViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"DiscountViewCell"
                
                                             owner:nil                                                               options:nil].firstObject;
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

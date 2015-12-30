//
//  IntegralViewCell.m
//  LNRespectedGuest
//
//  Created by Barry on 15/12/26.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "IntegralViewCell.h"

@implementation IntegralViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"MyLinkViewCell"
                
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

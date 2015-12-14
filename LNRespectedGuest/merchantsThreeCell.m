//
//  merchantsThreeCell.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/14.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "merchantsThreeCell.h"
#import "merchantsThreeModel.h"

@interface merchantsThreeCell ()

@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIImageView *vipView;
@property (nonatomic, weak) UILabel *textView;
@property (nonatomic, weak) UIImageView *pictureView;

@end

@implementation merchantsThreeCell


//1 创建可以重用的自定义cell的对象
+ (instancetype)threeCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"Three";
    merchantsThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    return cell;
}

//2 重写构造方法，初始化(创建自定义cell内部的子控件)
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建子控件
        //最好跟属性的名字一致
        //头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //用户名
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //会员
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        //内容
        UILabel *textLabel = [[UILabel alloc] init];
        [self.contentView addSubview:textLabel];
        self.textView = textLabel;
        //图片
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

//3 重写属性的setter方法 设置自控件的值
- (void)setThreeModel:(merchantsThreeModel *)threeModel{
    _threeModel = threeModel;
    //设置子控件显示的内容
    [self setSubViewsContent];
    //设置子控件的frame
    [self setSubViewsFrame];
}
//设置子控件显示的内容
- (void)setSubViewsContent{
    self.iconView.image = [UIImage imageNamed:self.threeModel.icon];
    self.nameLabel.text = self.threeModel.name;
    self.vipView.image = [UIImage imageNamed:@"vip"];
    //如果不是会员 隐藏
    if (!self.threeModel.isVip) {
        self.vipView.hidden = YES;
    }
    self.textView.text = self.threeModel.text;
    self.pictureView.image = [UIImage imageNamed:self.threeModel.picture];
}
//设置子控件的frame
- (void)setSubViewsFrame{
    CGFloat margin = 10;
    //头像
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconY = margin;
    CGFloat iconX = margin;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

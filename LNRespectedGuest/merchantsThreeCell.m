//
//  merchantsThreeCell.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/14.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "merchantsThreeCell.h"
#import "merchantsThreeModel.h"
#import "merchantsThreeFrame.h"

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
        nameLabel.font = [UIFont systemFontOfSize:NameFont];//设置文字大小和计算时一致
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //会员
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        //内容
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.font = [UIFont systemFontOfSize:TextFont];
        textLabel.numberOfLines = 0;
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
//- (void)setThreeModel:(merchantsThreeModel *)threeModel{
//    _threeModel = threeModel;
//    //设置子控件显示的内容
//    [self setSubViewsContent];
//    //设置子控件的frame
//    [self setSubViewsFrame];
//}
- (void)setThreeModelFrame:(merchantsThreeFrame *)threeModelFrame{
    _threeModelFrame = threeModelFrame;
    //设置子控件显示的内容
    [self setSubViewsContent];
    //设置子控件的frame
    [self setSubViewsFrame];
}

//设置子控件显示的内容
- (void)setSubViewsContent{
    merchantsThreeModel *threeModel = self.threeModelFrame.threeModel;
    self.iconView.image = [UIImage imageNamed:threeModel.icon];
    self.nameLabel.text = threeModel.name;
    self.vipView.image = [UIImage imageNamed:@"vip"];
    //如果不是会员 隐藏
    if (!threeModel.isVip) {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }else{//是会员改变名字
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    }
    self.textView.text = threeModel.text;
    if (threeModel.picture) {//判断模型中有没有图片 没有就不显示
        self.pictureView.image = [UIImage imageNamed:threeModel.picture];
    }
}
//设置子控件的frame
- (void)setSubViewsFrame{
    
    self.iconView.frame = self.threeModelFrame.iconFrame;
    self.nameLabel.frame = self.threeModelFrame.nameFrame;
    self.vipView.frame = self.threeModelFrame.vipFrame;
    self.textView.frame = self.threeModelFrame.textFrame;
    self.pictureView.frame = self.threeModelFrame.pictureFrame;
    
//    CGFloat margin = 10;
//    //头像
//    CGFloat iconW = 30;
//    CGFloat iconH = 30;
//    CGFloat iconY = margin;
//    CGFloat iconX = margin;
//    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//    
//    //昵称
////    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
////    CGSize nameSize = [self.threeModel.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;//计算文本大小
//    CGSize nameSize = [self sizeWithText:self.threeModel.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:NameFont];
//    CGFloat nameX = CGRectGetMaxX(self.iconView.frame)+margin;
//    CGFloat nameY = iconY + (iconH-nameSize.height)/2;
//    self.nameLabel.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
//    
//    //会员
//    CGFloat vipW = 14;
//    CGFloat vipH = 14;
//    CGFloat vipY = nameY;
//    CGFloat vipX = CGRectGetMaxX(self.nameLabel.frame)+margin;
//    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
//    
//    //内容
//    CGSize textSize = [self sizeWithText:self.threeModel.text maxSize:CGSizeMake(355, MAXFLOAT) fontSize:TextFont];
//    CGFloat textX = iconX;
//    CGFloat textY = CGRectGetMaxY(self.iconView.frame)+margin;
//    self.textView.frame = (CGRect){{textX,textY},textSize};//CGRectMake(textX, textY, textSize.width, textSize.height);
//    
//    CGFloat height;//用于获取最后一个控件的Y+间隙margin
//    //图片
//    if (self.threeModel.picture) {//判断有没有图片
//        CGFloat pictureW = 100;
//        CGFloat pictureH = 100;
//        CGFloat pictureX = iconX;
//        CGFloat pictureY = CGRectGetMaxY(self.textView.frame)+margin;
//        self.pictureView.frame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};
//        
//        height = CGRectGetMaxY(self.pictureView.frame)+margin;
//    }else{
//        height = CGRectGetMaxY(self.textView.frame)+margin;
//    }
    
}

//#pragma mark - 计算文字大小
///**
// *  计算文字大小
// *
// *  @param text     被计算的文字
// *  @param maxSize  文字限制的size
// *  @param fontSize 字体大小
// *
// *  @return 文本大小的size
// */
//- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
//    //计算文本大小
//    CGSize strSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
//    return strSize;
//}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

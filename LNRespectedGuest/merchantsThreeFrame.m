
//
//  merchantsThreeFrame.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/15.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "merchantsThreeFrame.h"
#import "merchantsThreeModel.h"

@implementation merchantsThreeFrame

//重写属性的setter方法 取得模型数据 计算frame 计算行高
- (void)setThreeModel:(merchantsThreeModel *)threeModel{
    _threeModel = threeModel;
    
    CGFloat margin = 10;
    //头像
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconY = margin;
    CGFloat iconX = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);

    //昵称
//    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    CGSize nameSize = [self.threeModel.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;//计算文本大小
    CGSize nameSize = [self sizeWithText:self.threeModel.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:NameFont];
    CGFloat nameX = CGRectGetMaxX(_iconFrame)+margin;
    CGFloat nameY = iconY + (iconH-nameSize.height)/2;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);

    //会员
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    CGFloat vipY = nameY;
    CGFloat vipX = CGRectGetMaxX(_nameFrame)+margin;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);

    //内容
    CGSize textSize = [self sizeWithText:self.threeModel.text maxSize:CGSizeMake(355, MAXFLOAT) fontSize:TextFont];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame)+margin;
    _textFrame = (CGRect){{textX,textY},textSize};//CGRectMake(textX, textY, textSize.width, textSize.height);

    //CGFloat height;//用于获取最后一个控件的Y+间隙margin
    //图片
    if (self.threeModel.picture) {//判断有没有图片
        CGFloat pictureW = 280;
        CGFloat pictureH = 175;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame)+margin;
        _pictureFrame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};

        _rowHeight = CGRectGetMaxY(_pictureFrame)+margin;
    }else{
        _rowHeight = CGRectGetMaxY(_textFrame)+margin;
    }
}


#pragma mark - 计算文字大小
/**
 *  计算文字大小
 *
 *  @param text     被计算的文字
 *  @param maxSize  文字限制的size
 *  @param fontSize 字体大小
 *
 *  @return 文本大小的size
 */
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    //计算文本大小
    CGSize strSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return strSize;
}

@end

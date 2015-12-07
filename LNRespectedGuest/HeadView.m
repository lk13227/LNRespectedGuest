//
//  HeadView.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/29.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.isOpen = NO;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //button.frame = CGRectMake(10, 0, 380, 50);
        button.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;//把按钮的内容（控件）的对齐方式修改为水平左对齐，紧靠着左边
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);//让按钮的内容（控件）距离左边10个像素
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        
        //[button setBackgroundImage:[UIImage imageNamed:@"btn_momal.png"] forState:UIControlStateNormal];
        //[button setBackgroundImage:[UIImage imageNamed:@"btn_on.png"] forState:UIControlStateHighlighted];
        [self addSubview:button];
        self.backButton = button;
        
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(+10);
            make.right.mas_equalTo(self.mas_right).offset(-10);
            make.top.mas_equalTo(self.mas_top).offset(+5);
            make.height.offset(50);
        }];
        
        UIView *lineView = [[UIView alloc]init];
       // lineView.frame = CGRectMake(10,50, self.bounds.size.width, 1);
        lineView.backgroundColor = [UIColor lightGrayColor];
        [button addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(button.mas_bottom).offset(-1);
            make.left.mas_equalTo(button.mas_left);
            make.right.mas_equalTo(button.mas_right);
            make.height.offset(1);
        }];
        
    }
    return self;
}

-(void)buttonClick
{
    if(self.delegate &&[self.delegate respondsToSelector:@selector(selectdWith:)])
    {
        /*委托人存在 并且  收到selectdWith*/
        [self.delegate selectdWith:self];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

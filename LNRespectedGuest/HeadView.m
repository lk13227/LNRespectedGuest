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
        button.frame = CGRectMake(0, 0, 380, 50);
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_momal.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_on.png"] forState:UIControlStateHighlighted];
        [self addSubview:button];
        self.backButton = button;
        
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

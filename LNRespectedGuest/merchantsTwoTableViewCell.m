//
//  merchantsTwoTableViewCell.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/11.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "merchantsTwoTableViewCell.h"

@implementation merchantsTwoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self creatUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)creatUI
{
    //上面三个按钮
    //贵圈
    UIView *circleView = [[UIView alloc] init];
    circleView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:circleView];
    [self createLine:circleView];
    
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setImage:[UIImage imageNamed:@"发现_03"] forState:UIControlStateNormal];
    //    circleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.contentView addSubview:circleBtn];
    
    self.circleLabel = [[UILabel alloc]init];
    //self.circleLabel.backgroundColor = [UIColor lightGrayColor];
    self.circleLabel.text = @"350";
    self.circleLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:self.circleLabel];
    
    
    //贵元
    UIView *memberView = [[UIView alloc] init];
    memberView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:memberView];
    [self createBottomLine:memberView];
    
    UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [memberBtn setImage:[UIImage imageNamed:@"发现_05"] forState:UIControlStateNormal];
    //    memberBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.contentView addSubview:memberBtn];
    
    self.memberLabel = [[UILabel alloc]init];
    //self.memberLabel.backgroundColor = [UIColor lightGrayColor];
    self.memberLabel.text = @"350";
    self.memberLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:self.memberLabel];
    
    //贵人
    UIView *peopleView = [[UIView alloc] init];
    peopleView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:peopleView];
    [self createRightLine:peopleView];
    
    UIButton *peopleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [peopleBtn setImage:[UIImage imageNamed:@"发现_07"] forState:UIControlStateNormal];
    //    peopleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.contentView addSubview:peopleBtn];
    
    self.peopleLabel = [[UILabel alloc]init];
    //self.peopleLabel.backgroundColor = [UIColor lightGrayColor];
    self.peopleLabel.text = @"350";
    self.peopleLabel.textColor = [UIColor greenColor];
    [self.contentView addSubview:self.peopleLabel];
    
    //三个背景view的约束
    NSInteger W = self.contentView.frame.size.width/3;
    [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.width.offset(W);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.offset(100);
    }];
    [memberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.offset(100);
    }];
    [peopleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.contentView.mas_top);
        make.height.offset(100);
    }];
    
    //三个按钮的约束
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_left).offset(40);
        make.right.mas_equalTo(circleView.mas_right).offset(-40);
        make.top.mas_equalTo(circleView.mas_top).offset(10);
        make.bottom.mas_equalTo(circleView.mas_bottom).offset(-10);
    }];
    [memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_left).offset(40);
        make.right.mas_equalTo(memberView.mas_right).offset(-40);
        make.top.mas_equalTo(memberView.mas_top).offset(10);
        make.bottom.mas_equalTo(memberView.mas_bottom).offset(-10);
    }];
    [peopleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(peopleView.mas_left).offset(40);
        make.right.mas_equalTo(peopleView.mas_right).offset(-40);
        make.top.mas_equalTo(peopleView.mas_top).offset(10);
        make.bottom.mas_equalTo(peopleView.mas_bottom).offset(-10);
    }];
    
    //三个label的约束
    [self.circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(circleView.mas_top).offset(+5);
        make.right.mas_equalTo(circleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(memberView.mas_top).offset(+5);
        make.right.mas_equalTo(memberView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(peopleView.mas_top).offset(+5);
        make.right.mas_equalTo(peopleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
}

#pragma mark - createLine划线
- (void)createLine:(UIView *)view{
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view.mas_bottom);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}
- (void)createRightLine:(UIView *)view{
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}
- (void)createBottomLine:(UIView *)view{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}

@end

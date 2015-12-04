//
//  takeDinnerViewController.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/3.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "takeDinnerViewController.h"

@interface takeDinnerViewController ()

@end

@implementation takeDinnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"点菜";
    self.view.backgroundColor = [UIColor orangeColor];
    [self createUI];
}


#pragma mark - 创建UI
- (void)createUI{
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.top.mas_equalTo(self.view.mas_top);
        make.width.offset(80);
    }];
    
}



@end

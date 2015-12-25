//
//  ApplyForLinkVC.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "ApplyForLinkVC.h"

#import "AppForLinkCell.h"

@interface ApplyForLinkVC ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UIAlertView *storeAlert;
@property (nonatomic,strong)UIAlertView *personalAlert;

@end

@implementation ApplyForLinkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请贵员链接";
    
    [self createTableView];
    
}

/**
 *  创建tableview
 */
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AppForLinkCell" bundle:nil] forCellReuseIdentifier:@"AppForLink"];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{//组
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppForLinkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppForLink" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[AppForLinkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AppForLink"];
    }
    
    /**
     *  申请到店铺按钮
     */
    UIButton *storeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    storeBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    storeBtn.titleLabel.font = [UIFont systemFontOfSize:12.];//button上字体的大小
    storeBtn.layer.cornerRadius = 6.0;//圆角
    [storeBtn addTarget:self action:@selector(storeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [storeBtn setTitle:@"申请到店铺" forState:UIControlStateNormal];
    [cell.contentView addSubview:storeBtn];
    [storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.contentView.mas_left).offset(80);
        make.top.mas_equalTo(cell.contentLabel.mas_bottom).offset(4);
        make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-8);
        make.width.offset(100);
    }];
    /**
     *  申请到个人按钮
     */
    UIButton *personalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    personalBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    personalBtn.titleLabel.font = [UIFont systemFontOfSize:12.];//button上字体的大小
    personalBtn.layer.cornerRadius = 6.0;//圆角
    [personalBtn addTarget:self action:@selector(personalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [personalBtn setTitle:@"申请到个人" forState:UIControlStateNormal];
    [cell.contentView addSubview:personalBtn];
    [personalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(storeBtn.mas_right).offset(40);
        make.top.mas_equalTo(cell.contentLabel.mas_bottom).offset(4);
        make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-8);
        make.width.offset(100);
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LKLog(@"%ld %ld",indexPath.section,indexPath.row);
}

#pragma mark - cell按钮上的点击事件
- (void)storeBtnClick:(UIButton *)btn{//店铺
    
    self.storeAlert = [[UIAlertView alloc] initWithTitle:@"是否将连接放入连接池中?" message:nil delegate:nil cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    self.storeAlert.delegate = self;
    [self.storeAlert show];
    
    LKLog(@"%s",__func__);
}
- (void)personalBtnClick:(UIButton *)btn{//个人
    
    self.personalAlert = [[UIAlertView alloc] initWithTitle:@"是否将连接放入连接池中?" message:nil delegate:nil cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    self.personalAlert.delegate = self;
    [self.personalAlert show];
    
    LKLog(@"%s",__func__);
}

#pragma mark - Alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            LKLog(@"Cancel button clicked");
            break;
        case 1:
            LKLog(@"OK button clicked");
            break;
            
        default:
            break;
    }
}

@end

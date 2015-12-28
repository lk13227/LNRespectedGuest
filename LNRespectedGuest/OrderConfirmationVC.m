//
//  OrderConfirmationVC.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/18.
//  Copyright © 2015年 Yun. All rights reserved.
//订单确认

#import "OrderConfirmationVC.h"

@interface OrderConfirmationVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)NSArray *otherArr;

@end

@implementation OrderConfirmationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    self.title = @"订单确认";
    self.titleArr = @[@[@"北京理念空间XXX",@"金额",@"折扣信息"],@[@"使用积分",@"使用者",@"服务员",@"贵人积分",@"实收金额"],@[@"我要推荐",@"立即分享到商家"]];
    self.otherArr = @[@[@"",@"￥88",@"7折"],@[@"20",@"id2345678",@"id3456789",@"10",@"￥60.2"]];
    
    [self createTableView];
    [self createNextBtn];
}

/**
 *  创建tableview
 */
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-109) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;//tableview禁止滑动
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView代理方法
//脚视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc] init];
    view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGTH);
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 2;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{//组
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yuio"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"yuio"];
    }
    cell.textLabel.text = self.titleArr[indexPath.section][indexPath.row];
    if (indexPath.section == 0 || indexPath.section == 1) {
        cell.detailTextLabel.text = self.otherArr[indexPath.section][indexPath.row];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LKLog(@"%ld %ld",indexPath.section,indexPath.row);
}

#pragma mark - 确认消费按钮
- (void)createNextBtn{
    //退出登录
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确认消费" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.cornerRadius = 8.0;//圆角
    btn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [btn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.tableView.mas_bottom).offset(+30);
        make.height.offset(40);
    }];
}

- (void)nextClick{
    LKLog(@"下一步");
}


@end

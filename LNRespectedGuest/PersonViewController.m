//
//  PersonViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "PersonViewController.h"
#import "MyTableViewCell.h"
#import "LoginViewController.h"

@interface PersonViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UIBarButtonItem *rightButtonItem;

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) UIButton *loginBtn;
@end


@implementation PersonViewController{
    NSMutableString *_userStr;
}

static NSString *cellOne = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userStr = [NSMutableString stringWithFormat:@"登录/注册"];
    
    [self createUI];
    
    self.titleArr = @[@"我的账户",@"我的积分",@"优惠券链接",@"信用管理",@"交易管理",@"推荐管理"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
    
}


#pragma mark -创建UI
- (void)createUI{
    //背景viewImage
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_line.png"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];

    
        //icon头像
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.image = [UIImage imageNamed:@"123.jpg"];
    iconImage.layer.cornerRadius = 40.0;
    iconImage.layer.masksToBounds = YES; // 隐藏边界
    iconImage.layer.borderWidth = 3;
    iconImage.layer.borderColor = [UIColor  whiteColor].CGColor;
    [imageView addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).offset(+20);
        make.top.mas_equalTo(imageView.mas_top).offset(+10);
        make.bottom.mas_equalTo(imageView.mas_bottom).offset(-10);
        make.width.mas_equalTo(iconImage.mas_height);
    }];
    
    
    /*创建一个登录/注册按钮*/
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginBtn setTitle:_userStr forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconImage.mas_right).offset(+20);
        make.top.mas_equalTo(imageView.mas_top).offset(+30);
        make.bottom.mas_equalTo(imageView.mas_bottom).offset(-30);
        make.width.offset(80);
    }];
    
    //tableView
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 170, self.view.frame.size.width, 300) style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc] init];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.scrollEnabled = NO;//tableView不滚动
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(imageView.mas_bottom).offset(+15);
        make.height.offset(300);
    }];
    
    //退出登录
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [btn addTarget:self action:@selector(exitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.tableView.mas_bottom).offset(+30);
        make.height.offset(40);
    }];

}

//loginClick
- (void)loginClick:(UIButton *)btn{
    
    LoginViewController *VC = [[LoginViewController alloc] init];
    [VC returnUser:^(NSString *showText) {
        _userStr = [NSMutableString stringWithFormat:@"%@",showText];
        LKLog(@"%@,%@",showText,_userStr);
    }];
    [self presentViewController:VC animated:YES completion:nil];
    
}
#pragma mark 退出登录
- (void)exitClick:(UIButton *)btn{
    NSLog(@"退出登录");
}

#pragma mark - 黄金三问
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mycell"];
    }
    
    cell.titleText.text = self.titleArr[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:@"tab_1"];
    if (indexPath.row != 5) {
        cell.backVIew.backgroundColor = [UIColor whiteColor];
    }
    
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell右边的小箭头
    return cell;

}
//反选
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

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
#import "accountViewController.h"
#import "SetViewController.h"

#import "ApplyForLinkVC.h"
#import "MainViewController.h"

@interface PersonViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property(nonatomic,strong)UIAlertView *storeAlert;

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)UIBarButtonItem *rightButtonItem;

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) UIButton *loginBtn;

@property(nonatomic,strong)SetViewController *setVC;

@property (nonatomic,copy)NSString *integralStr;
@end


@implementation PersonViewController{
    NSMutableString *_userStr;
}

static NSString *cellOne = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userStr = [NSMutableString stringWithFormat:@"细枝末节"];
    
    [self createUI];
    
    self.titleArr = @[@"我的账户",@"我的链接",@"申请贵员链接"];
    
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
        make.height.offset(20);
        make.width.offset(80);
    }];
    
    /**
     *  积分
     */
    self.integralStr = @"123";
    UILabel *integralLabel = [[UILabel alloc] init];
    integralLabel.text = [NSString stringWithFormat:@" 积分: %@ 分",self.integralStr];
    integralLabel.font = [UIFont systemFontOfSize:12];
    [imageView addSubview:integralLabel];
    [integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginBtn.mas_left);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
        make.height.offset(20);
        make.width.offset(80);
    }];
    
    /**
     二维码按钮
     */
    UIButton *qrCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    qrCodeBtn.backgroundColor = [UIColor yellowColor];
//    qrCodeBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:qrCodeBtn];
    [qrCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-40);
        make.top.mas_equalTo(imageView.mas_top).offset(+40);
        make.width.offset(25);
        make.height.offset(25);
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
        make.height.offset(150);
    }];
    
    //申请商圈
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setTitle:@"申请商圈" forState:UIControlStateNormal];
    [circleBtn setTintColor:[UIColor whiteColor]];
    circleBtn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [circleBtn addTarget:self action:@selector(circleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:circleBtn];
    circleBtn.layer.cornerRadius = 8.0;//圆角
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.tableView.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    
    //退出登录
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [btn addTarget:self action:@selector(exitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 8.0;//圆角
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(circleBtn.mas_bottom).offset(+15);
        make.height.offset(40);
    }];

    //导航右按钮
    UIButton *setButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [setButton setTitle:@"设置" forState:normal];
    setButton.frame = CGRectMake(0, 0, 40, 40);
    [setButton addTarget:self action:@selector(setClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *setButtonItem = [[UIBarButtonItem alloc] initWithCustomView:setButton];
    self.navigationItem.rightBarButtonItem = setButtonItem;
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
//设置按钮的点击事件 - setClick
-(void)setClick:(UIButton *)setBtn
{
    self.setVC = [[SetViewController alloc]init];
    self.setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.setVC animated:YES];
    
}
#pragma mark 退出登录
- (void)exitClick:(UIButton *)btn{
    LKLog(@"退出登录");
    
    self.storeAlert = [[UIAlertView alloc] initWithTitle:@"是否退出登录" message:nil delegate:nil cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    self.storeAlert.delegate = self;
    [self.storeAlert show];
}
#pragma mark - Alert view delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            LKLog(@"Cancel button clicked");
            break;
        case 1:
        {
            LoginViewController *VC = [[LoginViewController alloc] init];
            [self presentViewController:VC animated:YES completion:nil];
            LKLog(@"OK button clicked");
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - 申请商圈
- (void)circleClick:(UIButton *)btn{
    LKLog(@"申请商圈");
}

#pragma mark - 黄金三问
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
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
    if (indexPath.row != 2) {
        cell.backVIew.backgroundColor = [UIColor whiteColor];
    }
    
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell右边的小箭头
    return cell;

}
//反选
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        accountViewController *VC = [[accountViewController alloc] init];
        VC.hidesBottomBarWhenPushed = YES;//跳转的时候隐藏底部的tabbar
        [self.navigationController pushViewController:VC animated:YES];
    }

    if (indexPath.row == 1) {
        MainViewController *myLinkVC = [[MainViewController alloc]init];
        myLinkVC.hidesBottomBarWhenPushed = YES;//跳转的时候隐藏底部的tabbar
        [self.navigationController pushViewController:myLinkVC animated:YES];
    }
    if (indexPath.row == 2) {
        ApplyForLinkVC *VC = [[ApplyForLinkVC alloc] init];
        VC.hidesBottomBarWhenPushed = YES;//跳转的时候隐藏底部的tabbar
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end

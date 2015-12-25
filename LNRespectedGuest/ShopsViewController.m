//
//  ShopsViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//商家 点击button跳转之后的页面

#import "ShopsViewController.h"
#import "BusinessCell.h"
#import "MerchantViewController.h"
#import "MerchantManViewController.h"

@interface ShopsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)MerchantViewController *merchantVC;
@property(nonatomic,strong)MerchantManViewController *merchantManVC;

@end

@implementation ShopsViewController
/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
}
/**
 *  创建tableView
 */
-(void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    //调用
    [self createUI];
    [self createData];
}
#pragma mark- tableVie的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray.count == 0)
    {
        return 100;
    }
    else
    {
        return self.dataArray.count;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessCell" owner:nil options:nil]firstObject];
    }
    /**
     *  自定义贵圈按钮
     */
    UIButton *quanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    quanButton.backgroundColor = [UIColor colorWithRed:255./255. green:106./255. blue:135./255. alpha:1.0];
    quanButton.titleLabel.font = [UIFont systemFontOfSize:14.];//button上字体的大小
    quanButton.layer.cornerRadius = 6.0;//圆角
    [quanButton addTarget:self action:@selector(quanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [quanButton setTitle:@"贵圈" forState:UIControlStateNormal];
    [cell.contentView addSubview:quanButton];
    [quanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cell.picImageView.mas_right).offset(10);
        make.top.mas_equalTo(cell.titleLabel.mas_bottom).offset(7);
        make.bottom.mas_equalTo(cell.detailTitleLabel.mas_top).offset(-7);
        make.width.offset(55);
        
    }];
    /**
     *  自定义贵员按钮
     */
    UIButton *yuanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yuanButton.backgroundColor = [UIColor colorWithRed:255./255. green:224./255. blue:103./255. alpha:1.0];
    yuanButton.titleLabel.font = [UIFont systemFontOfSize:14.];//button上字体的大小
    yuanButton.layer.cornerRadius = 6.0;//圆角
    [yuanButton addTarget:self action:@selector(yuanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [yuanButton setTitle:@"贵员" forState:UIControlStateNormal];
    [cell.contentView addSubview:yuanButton];
    [yuanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(quanButton.mas_right).offset(10);
        make.top.mas_equalTo(cell.titleLabel.mas_bottom).offset(7);
        make.bottom.mas_equalTo(cell.detailTitleLabel.mas_top).offset(-7);
        make.width.offset(55);
        
    }];
    /**
     *  自定义贵人按钮
     */
    UIButton *renButton = [UIButton buttonWithType:UIButtonTypeCustom];
    renButton.backgroundColor = [UIColor colorWithRed:93./255. green:226./255. blue:255./255. alpha:1.0];
    renButton.titleLabel.font = [UIFont systemFontOfSize:14.];//button上字体的大小
    renButton.layer.cornerRadius = 6.0;//圆角
    [renButton addTarget:self action:@selector(renButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [renButton setTitle:@"贵人" forState:UIControlStateNormal];
    [cell.contentView addSubview:renButton];
    [renButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(yuanButton.mas_right).offset(10);
        make.top.mas_equalTo(cell.titleLabel.mas_bottom).offset(7);
        make.bottom.mas_equalTo(cell.detailTitleLabel.mas_top).offset(-7);
        make.width.offset(55);
        
    }];

    return cell;
}
//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark - button的点击事件
-(void)quanButtonClick:(UIButton *)button
{
    self.merchantManVC = [[MerchantManViewController alloc]init];
    [self.navigationController pushViewController:self.merchantManVC animated:YES];
}
-(void)yuanButtonClick:(UIButton *)button
{
    self.merchantVC = [[MerchantViewController alloc]init];
    [self.navigationController pushViewController:self.merchantVC animated:YES];
}
-(void)renButtonClick:(UIButton *)button
{
    self.merchantVC = [[MerchantViewController alloc]init];
    [self.navigationController pushViewController:self.merchantVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  BusinessViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "BusinessViewController.h"
#import "BusinessCell.h"
//#import "StoreViewController.h"
#import "StoreVC.h"

@interface BusinessViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation BusinessViewController
/**
 *  创建tableView
 */
-(void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    [self createUI];
}

#pragma mark - tableView方法
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
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessCell" owner:nil options:nil]firstObject];
    }
    
    NSString *guiquan = @"10";
    NSString *str1 = [NSString stringWithFormat:@"商圈(%@)",guiquan];
    [cell.GuiQuanBtn setTitle:str1 forState:UIControlStateNormal];
    
    NSString *guiyuan = @"10";
    NSString *str2 = [NSString stringWithFormat:@"商员(%@)",guiyuan];
    [cell.GuiYuanBtn setTitle:str2 forState:UIControlStateNormal];
    
    NSString *guiren = @"10";
    NSString *str = [NSString stringWithFormat:@"商人(%@)",guiren];
    [cell.GuiRenBtn setTitle:str forState:UIControlStateNormal];
    //cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    StoreViewController *storeVC = [[StoreViewController alloc]init];
//    [self.navigationController pushViewController:storeVC animated:YES];
    StoreVC *VC = [[StoreVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];

}                                                                                                                                                                                                                                                                                                                                                                                                                                                                


@end

//
//  BusinessViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "BusinessViewController.h"
#import "BusinessCell.h"
#import "StoreViewController.h"

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
    //cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreViewController *storeVC = [[StoreViewController alloc]init];
    [self.navigationController pushViewController:storeVC animated:YES];
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

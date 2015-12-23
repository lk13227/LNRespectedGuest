//
//  MerchantViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/23.
//  Copyright © 2015年 Yun. All rights reserved.
//贵人（员）

#import "MerchantViewController.h"
#import "MerchantPersonCell.h"

@interface MerchantViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MerchantViewController

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
-(void)initView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGTH ) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self initView];
}
#pragma mark - tableView的代理方法
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
    static NSString *CellName = @"Cell";
    MerchantPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MerchantPersonCell" owner:nil options:nil]firstObject];
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
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

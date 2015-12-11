//
//  StoreViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreCell.h"

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *rightTableView;

@end

@implementation StoreViewController

/**
 *  创建数据源
 */
-(void)createData
{
    self.array = [[NSMutableArray alloc]init];//左侧的tableView
    self.dataArray = [[NSMutableArray alloc]init];//右侧的tableView
}
/**
*  创建左侧的UI
*/
- (void)createLeftTableView
{
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,100, self.view.frame.size.height) style:UITableViewStylePlain];
    self.leftTableView.backgroundColor = [UIColor whiteColor];
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    [self.view addSubview:self.leftTableView];
}
/**
 *  创建右侧的UI
 */
- (void)createRightTableView
{
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(110,64, self.view.frame.size.width-110, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    [self.view addSubview:self.rightTableView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商家信息";
    /**
     *  调用方法
     */
    [self createLeftTableView];
    [self createRightTableView];
    [self createData];
}
#pragma mark - tableView的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.leftTableView)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView)
    {
        if (self.array.count == 0)
        {
            return 100;
        }
        else
            return self.array.count;

    }
    else
    {
        if (self.dataArray.count == 0)
        {
            return 100;
        }
        else
            return self.dataArray.count;

    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";

    if (tableView == self.leftTableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {
            //cell = [[[NSBundle mainBundle]loadNibNamed:@"StoreLeftCell" owner:nil options:nil]firstObject];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        }
        //cell.textLabel.text = self.dataArray[indexPath.row];
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.text = @"奶茶";
        cell.textLabel.font = [UIFont systemFontOfSize:17.0];
        
        return cell;

    }
    else
    {
        StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"StoreCell" owner:nil options:nil]firstObject];
        }
        //cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;
    }
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

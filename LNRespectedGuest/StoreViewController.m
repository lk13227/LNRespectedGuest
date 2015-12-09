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
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *rightTableView;

@end

@implementation StoreViewController

/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
    self.array = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
}
/**
*  创建UI
*/
- (void)createLeftTableView
{
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,80, self.view.frame.size.height) style:UITableViewStylePlain];
    self.leftTableView.backgroundColor = [UIColor grayColor];
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    [self.view addSubview:self.leftTableView];
}
- (void)createRightTableView
{
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(90,64, self.view.frame.size.width-90, self.view.frame.size.height-64) style:UITableViewStylePlain];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    [self.view addSubview:self.rightTableView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLeftTableView];
    [self createRightTableView];
    [self createData];
}
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
    StoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"StoreCell" owner:nil options:nil]firstObject];
    }
    //cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
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

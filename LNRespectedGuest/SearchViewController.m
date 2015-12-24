//
//  SearchViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/21.
//  Copyright © 2015年 Yun. All rights reserved.
//搜索

#import "SearchViewController.h"

#import "StoreVC.h"

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UISearchDisplayController *sdc;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *resultArray;

@end

@implementation SearchViewController
-(void)createData
{
    if (!_dataArray)
    {
        self.dataArray = [NSMutableArray array];
        for (NSUInteger i = 'A'; i<'Z'; i++)
        {
            NSMutableArray *temp = [NSMutableArray array];
            for (NSUInteger j = 0; j < 10; j++)
            {
                [temp addObject:[NSString stringWithFormat:@"%c%lu",(char)i,j]];
            }
            [self.dataArray addObject:temp];
        }
        [self.tableView reloadData];
    }
}
-(void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    /**
     *  创建搜索条
     */
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
    //实例化搜索结果显示内容
    self.sdc = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    //设置委托
    self.sdc.searchResultsDataSource = self;
    self.sdc.searchResultsDelegate = self;
    //保存结果的数组
    if (!_resultArray) {
        self.resultArray = [NSMutableArray array];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self createData];
    [self createUI];
}
#pragma mark - 黄金三问
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView != self.tableView)
    {
        return 1;
    }
    else
    {
        return self.dataArray.count;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*如果是搜索状态*/
    if(tableView != self.tableView)
    {
        /*如果有数据先清空*/
        if(self.resultArray.count != 0)
            [self.resultArray removeAllObjects];
        /*开始查找匹配的数据*/
        for(NSArray *subArr in self.dataArray)
        {
            for(NSString *string in subArr)
            {
                /*A0~A9*/
                NSRange range = [string rangeOfString:self.searchBar.text];
                /*如果找到数据*/
                if(range.location != NSNotFound)
                {
                    /*保存结果*/
                    [self.resultArray addObject:string];
                }
            }
        }
        return self.resultArray.count;
    }
    else
    {
        /*不是搜索状态 A1 A2 ...A9*/
        return [self.dataArray[section] count];
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        
    }
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(100, 50, 50, 50);
//    button.backgroundColor = [UIColor redColor];
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [cell.contentView addSubview:button];
    //判断
    if(tableView != self.tableView)
    {
        /*如果是搜索状态需要从resultArray拿数据*/
        cell.textLabel.text = self.resultArray[indexPath.row];
    }
    else
    {
        cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    }
    return cell;
}
//#pragma mark - 
//-(void)btnClick
//{
//    LKLog(@"hehe");
//    StoreVC *VC = [[StoreVC alloc] init];
//    [self.navigationController pushViewController:VC animated:YES];
//}

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

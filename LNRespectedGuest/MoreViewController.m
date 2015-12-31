//
//  MoreViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/30.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"客户名称";
    [[self navigationController] setNavigationBarHidden:NO animated:NO];//隐藏导航栏
    
    [self initView];
    [self creatDataArray];
    
    
}
-(void)initView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
//创建数据源
-(void)creatDataArray
{
    //初始化数组
    self.dataArray = [[NSMutableArray alloc]init];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@"设置标签与分类",@"成为他的贵商",@"成为他的贵员",@"备注", nil];
    //载入数据
    [self.tableView reloadData];
}

#pragma mark - tableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;//cell上文字居中
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

//
//  SetViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/11.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "SetViewController.h"
#import "DisclaimerViewController.h"

@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)DisclaimerViewController *disclaimerVC;

@end

@implementation SetViewController

/**
 *  创建tableView视图
 */
-(void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc]init];//只显示cell行
    [self.view addSubview:self.tableView];
}
/**
 *  创建数据源
 */
-(void)createData
{
    //初始化数组
    self.dataArray = [[NSMutableArray alloc]init];
    [self.dataArray addObject:@{@"content":@"免责声明",@"pic":@"tab_1"}];
    [self.dataArray addObject:@{@"content":@"勿扰模式",@"pic":@"tab_1"}];
    [self.dataArray addObject:@{@"content":@"清除缓存",@"pic":@"tab_1"}];
    [self.dataArray addObject:@{@"content":@"关于贵人",@"pic":@"tab_1"}];
    //载入数据
    [self.tableView reloadData];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    [self createUI];
    [self createData];
}

#pragma mark - tableView的方法
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    //cell右边的小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row][@"content"];
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"pic"]];
    return cell;
}
#pragma mark - cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        self.disclaimerVC = [[DisclaimerViewController alloc]init];
        [self.navigationController pushViewController:self.disclaimerVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//反选效果
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

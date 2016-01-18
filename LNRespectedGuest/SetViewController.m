//
//  SetViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/11.
//  Copyright © 2015年 Yun. All rights reserved.
//12345678

#import "SetViewController.h"
#import "DisclaimerViewController.h"

@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)DisclaimerViewController *disclaimerVC;
@property(nonatomic,strong)UISwitch *mySwitch;

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
    
    if (indexPath.row == 2)
    {
        //创建一个开发的对象
        self.mySwitch = [[UISwitch alloc]init];
        //设置开关的中心点坐标
        self.mySwitch.center = CGPointMake(cell.contentView.frame.size.width-60, 65);
        //设置开关的属性
        self.mySwitch.on = YES;
        //        //设置打开的颜色
        //        self.mySwitch.tintColor = [UIColor redColor];
        //        //设置关闭的颜色
        //        self.mySwitch.onTintColor = [UIColor lightGrayColor];
        //        //设置开关按钮的颜色
        //        self.mySwitch.thumbTintColor = [UIColor greenColor];
        //事件的通知
        [self.mySwitch addTarget:self action:@selector(switchValueChangedCallBack:) forControlEvents:UIControlEventValueChanged];
        [self.tableView addSubview:self.mySwitch];
//        [self.mySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(cell.contentView.mas_bottom).offset(5);
//            make.right.mas_equalTo(cell.contentView.mas_right).offset(-10);
//            make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-5);
//            make.width.offset(80);
//        }];
    }
    
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
#pragma mark - 开关的调用方法
-(void)switchValueChangedCallBack:(UISwitch *)mySwitch
{
    //判断打开
    if (mySwitch.on)
    {
        LKLog(@"打开勿扰开关");
    }
    else
    {
        LKLog(@"关闭勿扰开关");
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

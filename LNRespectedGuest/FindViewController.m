//
//  FindViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation FindViewController

//创建tableView
-(void)creatUI
{
    //上面三个按钮
    //贵圈
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setTitle:@"贵圈" forState:UIControlStateNormal];
    [circleBtn setBackgroundColor:[UIColor redColor]];
    [circleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    circleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:circleBtn];
    //贵元
    UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [memberBtn setTitle:@"贵员" forState:UIControlStateNormal];
    [memberBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [memberBtn setBackgroundColor:[UIColor yellowColor]];
//    memberBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:memberBtn];
    //贵人
    UIButton *peopleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [peopleBtn setTitle:@"贵人" forState:UIControlStateNormal];
    [peopleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [peopleBtn setBackgroundColor:[UIColor blueColor]];
//    peopleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:peopleBtn];
    //三个按钮的约束
    NSInteger W = self.view.frame.size.width/3;
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.offset(W);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    [memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleBtn.mas_right);
        make.width.mas_equalTo(circleBtn.mas_width);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    [peopleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberBtn.mas_right);
        make.width.mas_equalTo(circleBtn.mas_width);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    
    //tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 164, self.view.bounds.size.width, self.view.bounds.size.height-164) style:UITableViewStylePlain];
    self.tableView.scrollEnabled = NO;//设置tableview不滚动
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init]; //只显示数据的cell
    [self.view addSubview:self.tableView];
}

//创建数据源
-(void)creatDataArray
{
    //初始化数组
    self.dataArray = [[NSMutableArray alloc]init];
    [self.dataArray addObject:@{@"content":@"附近搜索",@"pic":@"tab_0"}];
    [self.dataArray addObject:@{@"content":@"扫一扫",@"pic":@"tab_0"}];
    [self.dataArray addObject:@{@"content":@"商家",@"pic":@"tab_0"}];
    [self.dataArray addObject:@{@"content":@"找实惠",@"pic":@"tab_0"}];
    //载入数据
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //调用方法
    [self creatUI];
    [self creatDataArray];
}

#pragma mark -tableView
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
    //cell右边的小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataArray[indexPath.row][@"content"];
    cell.imageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"pic"]];
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
//{
//    return 60.;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {//商家
        LKLog(@"商家");
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

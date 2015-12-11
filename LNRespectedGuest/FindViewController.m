//
//  FindViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "FindViewController.h"
#import "BusinessViewController.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UILabel *circleLabel;
@property(nonatomic,strong)UILabel *memberLabel;
@property(nonatomic,strong)UILabel *peopleLabel;

@end

@implementation FindViewController

//创建tableView
-(void)creatUI
{
    //上面三个按钮
    //贵圈
    UIView *circleView = [[UIView alloc] init];
    circleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:circleView];
    [self createLine:circleView];
    
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setImage:[UIImage imageNamed:@"发现_03"] forState:UIControlStateNormal];
//    circleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:circleBtn];
    
    self.circleLabel = [[UILabel alloc]init];
    //self.circleLabel.backgroundColor = [UIColor lightGrayColor];
    self.circleLabel.text = @"350";
    self.circleLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.circleLabel];
    
    
    //贵元
    UIView *memberView = [[UIView alloc] init];
    memberView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:memberView];
    [self createBottomLine:memberView];
    
    UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [memberBtn setImage:[UIImage imageNamed:@"发现_05"] forState:UIControlStateNormal];
//    memberBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:memberBtn];
    
    self.memberLabel = [[UILabel alloc]init];
    //self.memberLabel.backgroundColor = [UIColor lightGrayColor];
    self.memberLabel.text = @"350";
    self.memberLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.memberLabel];
    
    //贵人
    UIView *peopleView = [[UIView alloc] init];
    peopleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:peopleView];
    [self createRightLine:peopleView];
    
    UIButton *peopleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [peopleBtn setImage:[UIImage imageNamed:@"发现_07"] forState:UIControlStateNormal];
//    peopleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:peopleBtn];
    
    self.peopleLabel = [[UILabel alloc]init];
    //self.peopleLabel.backgroundColor = [UIColor lightGrayColor];
    self.peopleLabel.text = @"350";
    self.peopleLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.peopleLabel];
    
    //三个背景view的约束
    NSInteger W = self.view.frame.size.width/3;
    [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.offset(W);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    [memberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    [peopleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.view.mas_top).offset(+64);
        make.height.offset(100);
    }];
    
    //三个按钮的约束
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_left).offset(40);
        make.right.mas_equalTo(circleView.mas_right).offset(-40);
        make.top.mas_equalTo(circleView.mas_top).offset(10);
        make.bottom.mas_equalTo(circleView.mas_bottom).offset(-10);
    }];
    [memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_left).offset(40);
        make.right.mas_equalTo(memberView.mas_right).offset(-40);
        make.top.mas_equalTo(memberView.mas_top).offset(10);
        make.bottom.mas_equalTo(memberView.mas_bottom).offset(-10);
    }];
    [peopleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(peopleView.mas_left).offset(40);
        make.right.mas_equalTo(peopleView.mas_right).offset(-40);
        make.top.mas_equalTo(peopleView.mas_top).offset(10);
        make.bottom.mas_equalTo(peopleView.mas_bottom).offset(-10);
    }];
    
    //三个label的约束
    [self.circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(circleView.mas_top).offset(+5);
        make.right.mas_equalTo(circleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(memberView.mas_top).offset(+5);
        make.right.mas_equalTo(memberView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(peopleView.mas_top).offset(+5);
        make.right.mas_equalTo(peopleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    
    //tableview
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 170, self.view.bounds.size.width, self.view.bounds.size.height-170) style:UITableViewStylePlain];
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
        BusinessViewController *businessVC = [[BusinessViewController alloc]init];
        [self.navigationController pushViewController:businessVC animated:YES];
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - createLine划线
- (void)createLine:(UIView *)view{
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view.mas_bottom);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}
- (void)createRightLine:(UIView *)view{
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}
- (void)createBottomLine:(UIView *)view{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
}

@end

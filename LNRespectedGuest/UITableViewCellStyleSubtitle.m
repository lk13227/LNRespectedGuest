//
//  takeDinnerViewController.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/3.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "takeDinnerViewController.h"

@interface takeDinnerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *rightTableView;

@end

@implementation takeDinnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"店铺信息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 80, self.view.frame.size.height) style:UITableViewStylePlain];
    self.leftTableView.backgroundColor = [UIColor grayColor];
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    [self.view addSubview:self.leftTableView];
    
}

#pragma mark - 创建数据源
-(void)createDataArray
{
    self.array = [[NSMutableArray alloc]init];
    
}
#pragma mark - 创建UI
- (void)createUI{
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(90,0 , self.view.frame.size.width-90, self.view.frame.size.height) style:UITableViewStylePlain];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    [self.view addSubview:self.rightTableView];
    
//    UIView *backView = [[UIView alloc] init];
//    backView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:backView];
//    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view.mas_left);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
//        make.top.mas_equalTo(self.view.mas_top);
//        make.width.offset(80);
//    }];
    
}

#pragma mark - tableView的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.leftTableView) {
        return 1;
    }
    if (tableView == self.rightTableView) {
        return 1;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.array.count;
    }
    if (tableView == self.rightTableView) {
        return self.dataArray.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    if (tableView == self.leftTableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        }
        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;

    }
    if (tableView == self.rightTableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
            
        }
        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;
    }
    return nil;
    
}
//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {
        return 50.0;
    }
    if (tableView == self.rightTableView)
    {
        return 50.0;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - button的点击事件
-(void)titleBtnClicked:(UIButton *)button
{
    LKLog(@"hehe");
}



@end

//
//  BusinessViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "BusinessViewController.h"
#import "BusinessCell.h"
//#import "StoreViewController.h"
#import "StoreVC.h"

@interface BusinessViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UISearchDisplayDelegate>
{
    NSArray *data;
    NSArray *filterData;
    UISearchDisplayController *searchDisplayController;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pagecontrol;

//搜索条
@property(nonatomic,strong)UISearchBar *searchBar;
@end

@implementation BusinessViewController
/**
 *  创建ScrollView
 */
-(void)createScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 216)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    //是否反弹
    self.scrollView.bounces = NO;
    //是否分页
    self.scrollView.pagingEnabled = YES;
    //滚动方向
    self.scrollView.showsHorizontalScrollIndicator = YES;
    //滚动范围
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, 216);
    //代理方法
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    //调用方法
    [self createPageView];
    //    [self createFirstView];
    //    [self createSecondView];
}
//创建底部的分页控制器
-(void)createPageControl
{
    self.pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 260, self.view.bounds.size.width, 20)];
    self.pagecontrol.backgroundColor = [UIColor lightGrayColor];
    //设置分页的个数
    self.pagecontrol.numberOfPages = 2;
    //设置当前页
    self.pagecontrol.currentPage = 0;
    [self.view addSubview:self.pagecontrol];
    
}
#pragma mark-
-(void)createPageView
{
    for (NSInteger i = 0; i < 2; i++)
    {
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 216)];
        if (i == 0) {
            //            pageView.backgroundColor = [UIColor redColor];
        }
        else
        {
            //            pageView.backgroundColor = [UIColor yellowColor];
        }
        [self.scrollView addSubview:pageView];
        
        //CGFloat start_x = 20;
        CGFloat start_y = 25;
        CGFloat Width_Space = 30;
        CGFloat Hight_sapce = 25;//40
        CGFloat label_Hight = 15;
        CGFloat labelOfbutton = 5;
        CGFloat Button_Higth = 216/2 - start_y - labelOfbutton - label_Hight - Hight_sapce/2;;
        CGFloat Button_Width = 50;
        CGFloat label_Width = Button_Width;
        CGFloat start_x = (WIDTH - 4*Button_Width - Width_Space*3)/2;
        for (NSInteger i = 0; i < 8; i++) {
            NSInteger index = i % 4;
            NSInteger page = i / 4;
            //圆角按钮
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.layer.cornerRadius = 25;
            button.backgroundColor = [UIColor redColor];
            button.frame = CGRectMake(index * (Width_Space + Button_Width)+start_x, page * (Hight_sapce + Button_Higth) + start_y, Button_Width, Button_Higth);
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y+button.frame.size.height+labelOfbutton, label_Width, label_Hight)];
            [pageView addSubview:button];
            label.backgroundColor = [UIColor blueColor];
            [pageView addSubview:label];
        }
        
        
    }
    
}
/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
}
-(void)initView
{
    [self createScrollView];
    [self createPageControl];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 216, self.view.frame.size.width, self.view.frame.size.height-216) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    //搜索条
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(25, 20, self.view.frame.size.width-50, 40)];
    self.searchBar.placeholder = @"搜索";
    self.searchBar.backgroundColor = [UIColor greenColor];
    self.searchBar.barTintColor = [UIColor colorWithRed:245 green:78 blue:188 alpha:1.];
    //搜索栏上的文字颜色
    self.searchBar.tintColor = [UIColor blackColor];
    //    self.navigationController.navigationBar = self.searchBar;
    //添加searchBar到headerView
//    self.tableView.tableHeaderView = self.searchBar;
    [self.navigationController.view addSubview:self.searchBar];
    // 用 searchbar 初始化 SearchDisplayController
    // 并把 searchDisplayController 和当前 controller 关联起来
    searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    // searchResultsDataSource 就是 UITableViewDataSource
    searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    searchDisplayController.searchResultsDelegate = self;
    
    
    [self createData];
    [self initView];
}
/*
 * 如果原 TableView 和 SearchDisplayController 中的 TableView 的 delete 指向同一个对象
 * 需要在回调中区分出当前是哪个 TableView
 */

#pragma mark - tableView方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView)
    {
        if (self.dataArray.count == 0)
        {
            return 100;
        }
        else
            return self.dataArray.count;
    }
    else{
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@",searchDisplayController.searchBar.text];
        filterData =  [[NSArray alloc] initWithArray:[data filteredArrayUsingPredicate:predicate]];
        return filterData.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessCell" owner:nil options:nil]firstObject];
    }
    if (tableView == self.tableView) {
        NSString *guiquan = @"10";
        NSString *str1 = [NSString stringWithFormat:@"商商(%@)",guiquan];
        [cell.GuiQuanBtn setTitle:str1 forState:UIControlStateNormal];
        
        NSString *guiyuan = @"10";
        NSString *str2 = [NSString stringWithFormat:@"商员(%@)",guiyuan];
        [cell.GuiYuanBtn setTitle:str2 forState:UIControlStateNormal];
        
        NSString *guiren = @"10";
        NSString *str = [NSString stringWithFormat:@"商人(%@)",guiren];
        [cell.GuiRenBtn setTitle:str forState:UIControlStateNormal];
        
    }
    else{
        cell.textLabel.text = filterData[indexPath.row];
    }
    
    //cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *heatView = [[UIView alloc]init];
    heatView.backgroundColor = [UIColor colorWithRed:214./255. green:214./255. blue:214./255. alpha:1.0];
    heatView.frame = CGRectMake(0, 240, WIDTH, HEIGTH);
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(5, 0, WIDTH, 35);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//button上文字靠左
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    NSString *str = @"350";
    NSString *heat = [NSString stringWithFormat:@"贵圈(%@个链接)",str];
    [button setTitle:heat forState:UIControlStateNormal];
    //    [label setValue:[NSString stringWithFormat:@"贵圈%@个链接",str]] forKey:heat];
    //label.text = @"贵圈";
    [heatView addSubview:button];
    return heatView;
}
//返回头视图的高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 35;
}
//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    StoreViewController *storeVC = [[StoreViewController alloc]init];
    //    [self.navigationController pushViewController:storeVC animated:YES];
    StoreVC *VC = [[StoreVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}
#pragma mark - 滚动停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //页数 = 偏移量 / 滚动视图的宽
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    if (page != self.pagecontrol.currentPage) {
        //计算更新页
        self.pagecontrol.currentPage = page;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

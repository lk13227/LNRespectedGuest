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

@interface BusinessViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pagecontrol;


@end

@implementation BusinessViewController
/**
 *  创建tableView
 */
-(void)createUI
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH)];
    self.scrollView.backgroundColor = [UIColor redColor];
    //是否反弹
    self.scrollView.bounces = NO;
    //是否分页
    self.scrollView.pagingEnabled = YES;
    //滚动方向
    self.scrollView.showsHorizontalScrollIndicator = YES;
    //是否支持滑动最顶端
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    //滚动范围
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height - 49);
    //代理方法
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //
    self.pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 550, self.view.bounds.size.width, 20)];
    self.pagecontrol.backgroundColor = [UIColor lightGrayColor];
    //设置分页的个数
    self.pagecontrol.numberOfPages = 2;
    //设置当前页
    self.pagecontrol.currentPage = 0;
    [self.view addSubview:self.pagecontrol];
    //调用
    [self creatImageData];
    [self.view addSubview:self.scrollView];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 249, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}
-(void)creatImageData
{
    /*循环创建图片对象*/
    for(NSUInteger i = 0;i < 2;i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",i]];
        /*加载到滚动视图上*/
//        [ addSubview:imageView];
    }
    /*定时器*/
    [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(updateScrollViewImage) userInfo:nil repeats:YES];
}
/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createData];
    [self createUI];
}

#pragma mark - tableView方法
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
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessCell" owner:nil options:nil]firstObject];
    }
    
    NSString *guiquan = @"10";
    NSString *str1 = [NSString stringWithFormat:@"商商(%@)",guiquan];
    [cell.GuiQuanBtn setTitle:str1 forState:UIControlStateNormal];
    
    NSString *guiyuan = @"10";
    NSString *str2 = [NSString stringWithFormat:@"商员(%@)",guiyuan];
    [cell.GuiYuanBtn setTitle:str2 forState:UIControlStateNormal];
    
    NSString *guiren = @"10";
    NSString *str = [NSString stringWithFormat:@"商人(%@)",guiren];
    [cell.GuiRenBtn setTitle:str forState:UIControlStateNormal];
    //cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *heatView = [[UIView alloc]init];
    heatView.backgroundColor = [UIColor colorWithRed:214./255. green:214./255. blue:214./255. alpha:1.0];
    heatView.frame = CGRectMake(0, 249, WIDTH, HEIGTH);
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 0, WIDTH, 30);
    //NSString *str = @"350";
//    NSString *heat = [NSString stringWithFormat:@"贵圈%@个链接",str];
//    heat = [heat stringByAppendingString:@""];
//    label.text = @"贵圈";
    [heatView addSubview:label];
    return heatView;
}
//返回头视图的高度
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 30;
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

#pragma mark 周期性触发事件
-(void)updateScrollViewImage
{
    /*第一步 拿到偏移量*/
    CGPoint point = self.scrollView.contentOffset;
    static BOOL isEnd = YES;
    if(isEnd)
    {
        point.x++;//
    }
    else{
        point.x--;
        
    }
    self.scrollView.contentOffset = point;
    self.pagecontrol.currentPage = point.x/self.view.bounds.size.width;
    //判断是不是滑到头了
    if(point.x>=4*self.view.bounds.size.width)
    {
        isEnd = NO;//表示滑到左侧
    }
    else if(point.x == 0)
    {
        /*还没滑动呢*/
        isEnd = YES;//在最右侧
    }
}
#pragma mark - 滚动停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    /*拿到已经滑出屏幕的坐标*/
    CGPoint point = scrollView.contentOffset;
    /*计算更新页面*/
    self.pagecontrol.currentPage = point.x/self.view.bounds.size.width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MainViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/12/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MainViewController.h"
#import "MyLinkViewCell.h"
#import "IntegralViewCell.h"
#import "DiscountViewCell.h"

#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic ,strong) UITableView* tableView;
@property (nonatomic ,strong) NSArray* array;

@property(nonatomic,strong)UIView *myLinkView;
@property(nonatomic,strong)UITableView *myLinkTable;
@property(nonatomic,strong)UIView *integralView;
@property(nonatomic,strong)UITableView *integralTable;
@property(nonatomic,strong)UIView *discountView;
@property(nonatomic,strong)UITableView *discountTable;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
    [self creatTableView];
    
    self.title = @"链接管理";
    self.array = [[NSArray alloc]initWithObjects:@"时间",@"积分",@"折扣",nil];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button = [[UIButton alloc] initWithFrame:CGRectMake(i * (KWIDTH  - 2) / 3 + i, 64, (KWIDTH - 2 ) / 3, 35)];
        button.tag = 1000 + i;
        [button setTitle:[self.array objectAtIndex:i] forState:UIControlStateNormal];
        if (i == 0) {
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            button.backgroundColor = [UIColor greenColor];
            [button setTintColor:[UIColor whiteColor]];
        }
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}
- (void)clickButton:(UIButton *)button
{
    NSInteger sender = button.tag;
    for (int i = 0 ; i < 3 ; i ++ ) {
        button = (UIButton *)[self.view viewWithTag:1000 + i];
        button.backgroundColor = [UIColor greenColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    button = (UIButton *)[self.view viewWithTag:sender];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    /**
     *  通过button改变scrollView的偏移量
     */
    [_scrollView setContentOffset:CGPointMake(KWIDTH*(button.tag - 1000), 0) animated:YES];


}
#pragma mark - 创建滑动视图
- (void)createScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, HEIGTH - 100)];
    //    self.scrollView.backgroundColor = [UIColor redColor];
    // 是否支持滑动最顶端
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    self.scrollView.delegate = self;
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(WIDTH*3, HEIGTH - 100);
    // 是否反弹
    self.scrollView.bounces = NO;
    // 是否分页
    self.scrollView.pagingEnabled = YES;
    // 提示用户,Indicators flash
    [self.scrollView flashScrollIndicators];
    // 是否同时运动,lock
    self.scrollView.directionalLockEnabled = YES;
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.scrollView];
    
}
/**
 *  创建tableView
 */
-(void)creatTableView{
    for (int i = 0; i<3; i++) {
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH*i, 0, self.view.frame.size.width, self.view.frame.size.height - 35 - 64)];
       UITableView *tableView = [[UITableView alloc] initWithFrame:myView.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 2000+i;
        [myView addSubview:tableView];
        [self.scrollView addSubview:myView];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 2000) {
        MyLinkViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ShiJian"];
        if (!cell) {
            cell = [[MyLinkViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ShiJian"];
        }
        return cell;
    }
    if (tableView.tag == 2001) {
        IntegralViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JiFen"];
        if (!cell) {
            cell = [[IntegralViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"JiFen"];
        }
        return cell;
    }
    if (tableView.tag == 2002) {
        DiscountViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZheKou"];
        if (!cell) {
            cell = [[DiscountViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ZheKou"];
        }
        return cell;
    }
    return nil;
}
/**
 * cell 的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
#pragma mark - scrollView代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger scrollViewWidth = (NSInteger)_scrollView.contentOffset.x/KWIDTH;//获取scrollView的偏移量
    [UIView beginAnimations:nil context:nil]; // 开始动画
    [UIView setAnimationDuration:0.15]; // 动画时长
    [UIView commitAnimations];
    /**
     *  判断是否是当前的button
     */
    for (int i = 0 ; i < 3 ; i ++ ) {
        UIButton *button = (UIButton *)[self.view viewWithTag:1000 + i];
        if (i == scrollViewWidth) {
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }else{
            button.backgroundColor = [UIColor greenColor];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

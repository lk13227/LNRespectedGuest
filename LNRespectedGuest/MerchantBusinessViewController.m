//
//  MerchantBusinessViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MerchantBusinessViewController.h"
#import "JHCustomMenu.h"

//#import "MerchantView.h"
#import "MerchantCell.h"

#import "BusinessCell.h"

@interface MerchantBusinessViewController ()<JHCustomMenuDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) JHCustomMenu *menu;

@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)UIView *merchantView;
@property(nonatomic,strong)UITableView *merchantTable;
@property(nonatomic,strong)UIView *businessView;
@property(nonatomic,strong)UITableView *businessTable;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *titleLine;

@end

@implementation MerchantBusinessViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//    self.navigationController.navigationBarHidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
//    self.navigationController.navigationBar.translucent = NO;
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
//    
//    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)initView
{
    //[self initsegmentedControl];
    [self createTitleBtn];
    [self createScrollView];
    
//    [self createBusinessView];
//    [self createMerchantView];
    //self.businessView.alpha = 0.01;
    
}

#pragma mark - 创建导航栏上两个按钮
- (void)createTitleBtn{
    //顶部view
    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 200, 40);
    [self.navigationItem setTitleView:view];//导航栏中间添加view
    
    //商圈
    UIButton *businessBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [businessBtn setTitle:@"商圈" forState:UIControlStateNormal];
    [businessBtn addTarget:self action:@selector(businessClick:) forControlEvents:UIControlEventTouchUpInside];
    businessBtn.frame = CGRectMake(0, 0, 100, 40);
    [view addSubview:businessBtn];
    
    //贵圈
    UIButton *merchantBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [merchantBtn setTitle:@"贵圈" forState:UIControlStateNormal];
    [merchantBtn addTarget:self action:@selector(merchantClick:) forControlEvents:UIControlEventTouchUpInside];
    merchantBtn.frame = CGRectMake(100, 0, 100, 40);
    [view addSubview:merchantBtn];
    
    //下面的白线
    self.titleLine = [[UIView alloc] init];
    self.titleLine.frame = CGRectMake(20, 39, 60, 1);
    self.titleLine.backgroundColor = [UIColor whiteColor];
    [view addSubview:self.titleLine];
}
#pragma mark - 导航栏上按钮事件
- (void)businessClick:(UIButton *)btn{
    [UIView beginAnimations:nil context:nil]; // 开始动画
    
    [UIView setAnimationDuration:0.15]; // 动画时长
    /**
     *  图像动画
     */
    CGPoint point = self.titleLine.center;
    point.x = 50;
    [self.titleLine setCenter:point];
    
    [UIView commitAnimations]; // 提交动画
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (void)merchantClick:(UIButton *)btn{
    [UIView beginAnimations:nil context:nil]; // 开始动画
    
    [UIView setAnimationDuration:0.15]; // 动画时长
    /**
     *  图像动画
     */
    CGPoint point = self.titleLine.center;
    point.x = 150;
    [self.titleLine setCenter:point];
    
    [UIView commitAnimations]; // 提交动画
    [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
}

#pragma mark - 创建滑动视图
- (void)createScrollView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGTH)];
//    self.scrollView.backgroundColor = [UIColor redColor];
    // 是否支持滑动最顶端
    //    scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(WIDTH*2, HEIGTH);
    // 是否反弹
    self.scrollView.bounces = NO;
    // 是否分页
    self.scrollView.pagingEnabled = YES;
    // 提示用户,Indicators flash
    [self.scrollView flashScrollIndicators];
    // 是否同时运动,lock
    self.scrollView.directionalLockEnabled = YES;
    //如果viewController在导航里，这个vc的第一个子视图是scrollView
    //系统会让scrollView有个下沉的效果
    //因为这个效果有时候会跟自己的代码冲突，通常会把他关闭
    //判断self是否实现了下沉效果
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.scrollView];
    
    [self createBusinessView];
    [self createMerchantView];
}


//右上角+号
//- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
//{
//    __weak __typeof(self) weakSelf = self;
//    if (!self.menu) {
//        self.menu = [[JHCustomMenu alloc] initWithDataArr:@[@"加好友", @"扫一扫", @"发动态", @"发起聊天",@"发起聊天"] origin:CGPointMake(230, 0) width:125 rowHeight:44];
//        _menu.delegate = self;
//        _menu.dismiss = ^() {
//            weakSelf.menu = nil;
//        };
//        _menu.arrImgName = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
//        [self.view addSubview:_menu];
//    } else {
//        [_menu dismissWithCompletion:^(JHCustomMenu *object) {
//            weakSelf.menu = nil;
//        }];
//    }
//}
#pragma mark - 导航栏加号按钮tableView的点击方法
- (void)jhCustomMenu:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select: %ld", indexPath.row);
}


#pragma mark -创建商圈视图
- (void)createMerchantView{
    _merchantView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-50)];
    self.merchantTable = [[UITableView alloc] initWithFrame:self.merchantView.bounds style:UITableViewStylePlain];
    self.merchantTable.delegate = self;
    self.merchantTable.dataSource = self;
    [self.scrollView addSubview:self.merchantView];
    [self.merchantView addSubview:self.merchantTable];
    
    [self.merchantTable registerNib:[UINib nibWithNibName:@"MerchantCell" bundle:nil] forCellReuseIdentifier:@"guiren"];
}

#pragma mark -创建贵圈视图
- (void)createBusinessView{
    _businessView = [[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height-64-50)];
    
    self.businessTable = [[UITableView alloc]initWithFrame:_businessView.bounds style:UITableViewStylePlain];
    
    self.businessTable.dataSource = self;
    self.businessTable.delegate = self;
    
    [self.scrollView addSubview:self.businessView];
    [self.businessView addSubview:self.businessTable];
    
    [self.businessTable registerNib:[UINib nibWithNibName:@"MerchantCell" bundle:nil] forCellReuseIdentifier:@"guiren"];
}

#pragma mark -tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.businessTable) {
        return 1;
    }
    if (tableView == self.merchantTable) {
        return 1;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.businessTable) {
        return 10;
    }
    if (tableView == self.merchantTable) {
        return 5;
    }
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.businessTable) {
        MerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guiren" forIndexPath:indexPath];
        /*判断*/
        if (!cell) {
            cell = [[MerchantCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"guiren"];
        }
        cell.contentImage.image = [UIImage imageNamed:@"scrollView0.jpg"];
        [cell.iconBtn setBackgroundImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
        return cell;
    }
    
    if (tableView == self.merchantTable) {
        MerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guiren" forIndexPath:indexPath];
        if (!cell) {
            cell = [[MerchantCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"guiren"];
        }
//        if (indexPath.row==1) {
//            cell.contentImage.image = nil;
//        }else{
//            cell.contentImage.image = [UIImage imageNamed:@"scrollView0.jpg"];
//        }
        cell.contentImage.image = [UIImage imageNamed:@"scrollView0.jpg"];
        [cell.iconBtn setBackgroundImage:[UIImage imageNamed:@"123.jpg"] forState:UIControlStateNormal];
        
        return cell;
    }
    
    return nil;
}
//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.businessTable) {
        return 340.0;
    }
    
    if (tableView == self.merchantTable) {
//        MerchantCell *cell = (MerchantCell*)[self tableView:self.merchantTable cellForRowAtIndexPath:indexPath];
//        if (cell.contentImage.image != nil) {
//            return 340.0;
//        }
        return 340.0;
    }
    
    return 0;
}
//设置行的反选
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.businessTable) {

        LKLog(@"你点了这个Cell");
    }
    
    if (tableView == self.merchantTable) {
        
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - scrollView代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSInteger currentIndex =   (NSInteger)_scrollView.contentOffset.x / (NSInteger)WIDTH ;
    NSInteger scrollViewWidth = (NSInteger)_scrollView.contentOffset.x;//获取scrollView的偏移量
    if (scrollViewWidth == 0){//商圈
        [UIView beginAnimations:nil context:nil]; // 开始动画
        
        [UIView setAnimationDuration:0.15]; // 动画时长
        /**
         *  图像动画
         */
        CGPoint point = self.titleLine.center;
        point.x = 50;
        [self.titleLine setCenter:point];
        
        [UIView commitAnimations]; // 提交动画
    }else{//贵圈
        [UIView beginAnimations:nil context:nil]; // 开始动画
        
        [UIView setAnimationDuration:0.15]; // 动画时长
        /**
         *  图像动画
         */
        CGPoint point = self.titleLine.center;
        point.x = 150;
        [self.titleLine setCenter:point];
        
        [UIView commitAnimations]; // 提交动画
    }
}

@end

//-(void)initsegmentedControl
//{
//    //创建分段视图
//    NSArray *titleArray = [[NSArray alloc]initWithObjects:@"贵人",@"商圈", nil];
//    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:titleArray];
//    self.segmentedControl.selectedSegmentIndex = 0;
//    [self.segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
//    self.navigationItem.titleView = self.segmentedControl;
//}
//#pragma mark SegmentedControl Action:
//-(void)segmentedControlAction:(UISegmentedControl *)seg
//{
//    //选择器视图的透明度
//    NSInteger index = seg.selectedSegmentIndex;
//    switch (index)
//    {
//        case 0:
//            self.merchantView.alpha = 1;
//            self.businessView.alpha = 0;
//            break;
//            
//        case 1:
//            self.merchantView.alpha = 0;
//            self.businessView.alpha = 1;
//            
//            break;
//            
//        default:
//            break;
//    }
//}

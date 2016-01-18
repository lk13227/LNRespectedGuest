//
//  MainViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/12/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MainViewController.h"
//#import "MyLinkViewCell.h"
#import "MerchantPersonCell.h"
//#import "DiscountViewCell.h"

#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property(nonatomic,strong)NSArray *array;

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
    
    self.title = @"我的链接";
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
            button.backgroundColor = [UIColor colorWithRed:77./ 255. green:182. / 255. blue:192. / 255.  alpha:1];
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
        button.backgroundColor = [UIColor colorWithRed:77./ 255. green:182. / 255. blue:192. / 255.  alpha:1];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    button = (UIButton *)[self.view viewWithTag:sender];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   
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
        //分割线--灰色
        UIView *linView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
        linView.backgroundColor = [UIColor lightGrayColor];
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH*i, 0, self.view.frame.size.width, self.view.frame.size.height - 35 - 64)];
       UITableView *tableView = [[UITableView alloc] initWithFrame:myView.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = 2000+i;
        [myView addSubview:tableView];
        [myView addSubview:linView];
        [self.scrollView addSubview:myView];
    }
}



#pragma mark - tableView的代理方法
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
    {
        return self.dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    if (tableView.tag == 2000 || tableView.tag == 2001 || tableView.tag == 2002)
    {
        MerchantPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MerchantPersonCell" owner:nil options:nil]firstObject];
        }
        /**
         *  自定义按钮
         */
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        shareBtn.backgroundColor = [UIColor colorWithRed:40./255. green:169./255. blue:179./255. alpha:1.0];
        shareBtn.layer.cornerRadius = 6.0;//切圆角
        [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.subLabel.mas_bottom).offset(5);
            make.left.mas_equalTo(cell.picImageView.mas_right).offset(10);
            make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-10);
            make.width.offset(60);
        }];
        
        UIButton *useBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        useBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        useBtn.backgroundColor = [UIColor colorWithRed:40./255. green:169./255. blue:179./255. alpha:1.0];
        useBtn.layer.cornerRadius = 6.0;//切圆角
        [useBtn setTitle:@"立即使用" forState:UIControlStateNormal];
        [useBtn addTarget:self action:@selector(useBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:useBtn];
        [useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.subLabel.mas_bottom).offset(5);
//            make.right.mas_equalTo(cell.integralLabel.mas_left).offset(10);
            make.left.mas_equalTo(shareBtn.mas_right).offset(10);
            make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-10);
            make.width.offset(80);
        }];

        return cell;
    }
//    if (tableView.tag == 2001) {
//        MerchantPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantPersonCell"];
//        if (!cell) {
//            cell = [[MerchantPersonCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MerchantPersonCell"];
//        }
//        return cell;
//    }
//    if (tableView.tag == 2002) {
//        DiscountViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZheKou"];
//        if (!cell) {
//            cell = [[DiscountViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ZheKou"];
//        }
//        return cell;
//    }
    return nil;
}
/**
 * cell 的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}

#pragma mark - button的点击事件
-(void)shareBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了分享按钮");
}
-(void)useBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了立即使用按钮");
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
            button.backgroundColor = [UIColor colorWithRed:77./ 255. green:182. / 255. blue:192. / 255.  alpha:1];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

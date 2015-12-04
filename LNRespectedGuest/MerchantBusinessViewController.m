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
#import "takeDinnerViewController.h"

@interface MerchantBusinessViewController ()<JHCustomMenuDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) JHCustomMenu *menu;

@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)UIView *merchantView;
@property(nonatomic,strong)UITableView *merchantTable;
@property(nonatomic,strong)UIView *businessView;
@property(nonatomic,strong)UITableView *businessTable;

@end

@implementation MerchantBusinessViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)initView
{
    [self initsegmentedControl];
    
    [self createBusinessView];
    [self createMerchantView];
    self.businessView.alpha = 0.01;
    
}

- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
{
    __weak __typeof(self) weakSelf = self;
    if (!self.menu) {
        self.menu = [[JHCustomMenu alloc] initWithDataArr:@[@"加好友", @"扫一扫", @"发动态", @"发起聊天",@"发起聊天"] origin:CGPointMake(230, 0) width:125 rowHeight:44];
        _menu.delegate = self;
        _menu.dismiss = ^() {
            weakSelf.menu = nil;
        };
        _menu.arrImgName = @[@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        [self.view addSubview:_menu];
    } else {
        [_menu dismissWithCompletion:^(JHCustomMenu *object) {
            weakSelf.menu = nil;
        }];
    }
}

- (void)jhCustomMenu:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select: %ld", indexPath.row);
}


-(void)initsegmentedControl
{
    //创建分段视图
    NSArray *titleArray = [[NSArray alloc]initWithObjects:@"贵人",@"商圈", nil];
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:titleArray];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentedControl;
}
#pragma mark SegmentedControl Action:
-(void)segmentedControlAction:(UISegmentedControl *)seg
{
    //选择器视图的透明度
    NSInteger index = seg.selectedSegmentIndex;
    switch (index)
    {
        case 0:
            self.merchantView.alpha = 1;
            self.businessView.alpha = 0;
            break;
            
        case 1:
            self.merchantView.alpha = 0;
            self.businessView.alpha = 1;
            
            break;
            
        default:
            break;
    }
}

- (void)createMerchantView{
    _merchantView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-50)];
    self.merchantTable = [[UITableView alloc] initWithFrame:self.merchantView.bounds style:UITableViewStylePlain];
    self.merchantTable.delegate = self;
    self.merchantTable.dataSource = self;
    [self.view addSubview:self.merchantView];
    [self.merchantView addSubview:self.merchantTable];
    
    [self.merchantTable registerNib:[UINib nibWithNibName:@"MerchantCell" bundle:nil] forCellReuseIdentifier:@"guiren"];
    
}


- (void)createBusinessView{
    _businessView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-50)];
    
    self.businessTable = [[UITableView alloc]initWithFrame:_businessView.bounds style:UITableViewStylePlain];
    
    self.businessTable.dataSource = self;
    self.businessTable.delegate = self;
    
    [self.view addSubview:self.businessView];
    [self.businessView addSubview:self.businessTable];
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
        static NSString *identifier = @"Cell";
        BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        /*判断*/
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessCell" owner:self options:nil]firstObject];
            
        }
        cell.picImageView.image = [UIImage imageNamed:@"123.jpg"];
        return cell;
    }
    
    if (tableView == self.merchantTable) {
        MerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guiren" forIndexPath:indexPath];
        if (!cell) {
            cell = [[MerchantCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"guiren"];
        }
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
        return 100.0;
    }
    
    if (tableView == self.merchantTable) {
        return 300.0;
    }
    
    return 0;
}
//设置行的反选
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.businessTable) {
        takeDinnerViewController *takeVc = [[takeDinnerViewController alloc] init];
        
    }
    
    if (tableView == self.merchantTable) {
        
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

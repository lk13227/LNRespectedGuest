//
//  MerchantBusinessViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MerchantBusinessViewController.h"
#import "JHCustomMenu.h"

#import "MerchantView.h"

#import "BusinessView.h"

@interface MerchantBusinessViewController ()<JHCustomMenuDelegate>

@property (nonatomic, strong) JHCustomMenu *menu;

@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)MerchantView *merchantView;
@property(nonatomic,strong)BusinessView*businessView;

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
    
    [self.view addSubview:self.merchantView];
    [self.view addSubview:self.businessView];
    //self.view.backgroundColor = [UIColor whiteColor];
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

-(MerchantView *)merchantView
{
    if (_merchantView == nil)
    {
        _merchantView = [[MerchantView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ];
        _merchantView.backgroundColor = [UIColor greenColor];
    }
    return _merchantView;
}
-(BusinessView *)businessView
{
    if (_businessView == nil)
    {
        
        _businessView = [[BusinessView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
       // _businessView.backgroundColor = [UIColor greenColor];
        
    }
    return _businessView;
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

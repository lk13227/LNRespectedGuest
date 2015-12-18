//
//  tabBarViewController.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "tabBarViewController.h"
#import "LKTabBar.h"

#import "MerchantBusinessViewController.h"
#import "FriendsViewController.h"
#import "MessageViewController.h"
#import "FindViewController.h"
#import "PersonViewController.h"

@interface tabBarViewController ()<LKTabBarDelegate>

@end

@implementation tabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加所有子控制器
    [self setUpAllChildViewController];
    
    LKTabBar *myTabBar = [[LKTabBar alloc] initWithFrame:self.tabBar.bounds];
//    myTabBar.backgroundColor = [UIColor redColor];
    
    //自定义的tabbar添加按钮
    for (NSInteger i = 0; i < 5; i++) {
        //获取普通状态的图片名称
        NSString *normalImg = [NSString stringWithFormat:@"ml1x_%ld",i+92];
        //获取选中图片的名称
        NSString *selImg = [NSString stringWithFormat:@"ml1x_%ld",i+97];
        
        [myTabBar addTabbarBtnWithNormalImg:normalImg selImg:selImg];
    }
    
    //设置代理
    myTabBar.delegate = self;
    
    //把自定义的tabbar添加到 系统的tabbar上
    [self.tabBar addSubview:myTabBar];
}

#pragma mark - 添加所有子控制器
- (void)setUpAllChildViewController{
    MerchantBusinessViewController *oneVc = [[MerchantBusinessViewController alloc] init];
    [self addChildViewController:oneVc];
    
    FriendsViewController *twoVc = [[FriendsViewController alloc] init];
    [self addChildViewController:twoVc];
    
    MessageViewController *threeVc = [[MessageViewController alloc] init];
    [self addChildViewController:threeVc];
    
    FindViewController *fourVc = [[FindViewController alloc] init];
    [self addChildViewController:fourVc];
    
    PersonViewController *fiveVc = [[PersonViewController alloc] init];
    [self addChildViewController:fiveVc];
}


#pragma mark - 自定义tabbar的代理
- (void)tabbar:(LKTabBar *)tabbar didSelectedFrom:(NSInteger)form to:(NSInteger)to{
    //切换tabbar控制器的子控件
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

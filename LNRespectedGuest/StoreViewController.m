//
//  StoreViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/9.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreCell.h"
#import "merchantsOneTableViewCell.h"
#import "merchantsTwoTableViewCell.h"
#import "merchantsThreeTableViewCell.h"
#import "merchantsThreeCell.h"
#import "merchantsThreeModel.h"
#import "merchantsThreeFrame.h"

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *threeModelFrames;

@end

@implementation StoreViewController

- (NSArray *)threeModelFrames{
    if (!_threeModelFrames) {
        //加载数据模型
        NSArray *threeModels = [merchantsThreeModel threeModelList];
        NSMutableArray *frames = [NSMutableArray array];
        for (merchantsThreeModel *model in threeModels) {
            //创建frame模型对象
            merchantsThreeFrame *frame = [[merchantsThreeFrame alloc] init];
            frame.threeModel = model;
            //添加到临时数组
            [frames addObject:frame];
        }
        _threeModelFrames = frames;
    }
    return _threeModelFrames;
}
//-(NSArray *)threeModels{//懒加载加载数据
//    if (!_threeModels) {
//        _threeModels = [merchantsThreeModel threeModelList];
//    }
//    return _threeModels;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];//隐藏导航栏
    
    [self createTableView];
    [self createReturn];
}

/**
 *  创建tableView
 */
- (void)createTableView{
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"merchantsOneTableViewCell" bundle:nil] forCellReuseIdentifier:@"one"];
    [self.tableView registerNib:[UINib nibWithNibName:@"merchantsTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"two"];
    [self.tableView registerNib:[UINib nibWithNibName:@"merchantsThreeTableViewCell" bundle:nil] forCellReuseIdentifier:@"three"];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return self.threeModelFrames.count;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    if (indexPath.section == 1) {
        return 90;
    }
    if (indexPath.section == 2) {
        //计算行高
        merchantsThreeFrame *frame = self.threeModelFrames[indexPath.row];
        
        return frame.rowHeight;
    }
    return 0;
}
//脚视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGTH);
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //第一个cell
    if (indexPath.section == 0) {
        merchantsOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
        if (!cell) {
            cell = [[merchantsOneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"one"];
        }
        return cell;
    }
    
    //第二个cell
    if (indexPath.section == 1) {
        merchantsTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
        if (!cell) {
            cell = [[merchantsTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"two"];
        }
        return cell;
    }
    
    //第三个cell
    if (indexPath.section == 2) {
//        merchantsThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"three" forIndexPath:indexPath];
//        if (!cell) {
//            cell = [[merchantsThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"three"];
//        }
        
        merchantsThreeCell *cell = [merchantsThreeCell threeCellWithTableView:tableView];
        
        merchantsThreeFrame *frame = self.threeModelFrames[indexPath.row];
        cell.threeModelFrame = frame;
        
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"理念空间 第%ld组 第%ld个",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}





/**
 *  返回按钮
 */
- (void)createReturn{
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"返回 拷贝"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:returnBtn];
    [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.width.offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(20);
        make.height.offset(25);
    }];
}
/**
 *  返回事件
 */
- (void)returnClick{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.hidesBottomBarWhenPushed=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

@end

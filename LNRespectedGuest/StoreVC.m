//
//  StoreVC.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/18.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "StoreVC.h"

#import "StoreOneOneCell.h"
#import "StoreOneTwoCell.h"
//#import "StoreTwoTwoCell.h"
#import "StoreThreeOneCell.h"
#import "MerchantManSecondCell.h"

@interface StoreVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic,strong)NSArray *oneTwoTitleArr;
@property (nonatomic,strong)NSArray *oneTwoOtherArr;
@property (nonatomic,strong)NSArray *threeTitleArr;
@property (nonatomic,strong)NSArray *FourOneTitleArr;
@property (nonatomic,strong)NSArray *FourTwoTitleArr;
@property (nonatomic,strong)NSArray *FiveTitleArr;

@end

@implementation StoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];//隐藏导航栏
    
    self.threeTitleArr = @[@"优秀员工",@"好友链接"];
    self.oneTwoTitleArr = @[@"贵圈",@"贵员",@"贵人"];
    self.oneTwoOtherArr = @[@"10",@"10",@"10"];
    self.FourOneTitleArr = @[@"一级推荐N次",@"二级推荐N次",@"三级推荐N次"];
    self.FourTwoTitleArr = @[@"不推荐N次",@"不推荐N次",@"不推荐N次"];
    self.FiveTitleArr = @[@"更多"];
    
    
    [self createTableView];
    [self createReturn];
}

/**
 *  创建tableview
 */
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"StoreOneTwoCell" bundle:nil] forCellReuseIdentifier:@"storeOneTwo"];
    //[self.tableView registerNib:[UINib nibWithNibName:@"StoreTwoTwoCell" bundle:nil] forCellReuseIdentifier:@"storetwotwo"];//merchantManSecond
    [self.tableView registerNib:[UINib nibWithNibName:@"MerchantManSecondCell" bundle:nil] forCellReuseIdentifier:@"merchantManSecond"];
    [self.tableView registerNib:[UINib nibWithNibName:@"StoreThreeOneCell" bundle:nil] forCellReuseIdentifier:@"storethreeone"];
}





#pragma mark - tableView代理方法
//脚视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc] init];
    view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGTH);
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 4) {
        return 0;
    }
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 8;
    }
    if (section == 2) {
        return 2;
    }
    if (section == 3) {
        return 3;
    }
    if (section == 4) {
        return 1;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{//组
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 160;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 100;
    }
    if ((indexPath.section == 1 && indexPath.row == 3) || (indexPath.section == 1 && indexPath.row == 4) || (indexPath.section == 1 && indexPath.row == 5) || (indexPath.section == 1 && indexPath.row == 6) || (indexPath.section == 1 && indexPath.row == 7)) {
        return 70;
    }
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //广告
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        StoreOneOneCell *cell = [StoreOneOneCell storeOneCellWithTableView:tableView];
        
        cell.scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGTH);
        cell.scrollView.contentSize = CGSizeMake(WIDTH*2, HEIGTH);
        for (NSInteger i = 0; i < 2; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH*i, 0, WIDTH, 160)];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"scrollView%ld.jpg",i]];
            [cell.scrollView addSubview:imageView];
        }
        
        return cell;
    }
    
    //title和地址
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        StoreOneTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeOneTwo" forIndexPath:indexPath];
        if (!cell) {
            cell = [[StoreOneTwoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"storeOneTwo"];
        }
        
        return cell;
    }
    
    //第二组 第一部分
    if ((indexPath.section == 1 && indexPath.row == 0) || (indexPath.section == 1 && indexPath.row == 1) || (indexPath.section == 1 && indexPath.row == 2)) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oooo"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"oooo"];
        }
        cell.imageView.image = [UIImage imageNamed:@"tab_1.png"];
        cell.textLabel.text = self.oneTwoTitleArr[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  >",self.oneTwoOtherArr[indexPath.row]];
        
        return cell;
    }
    
    //第二组 第二部分
    if ((indexPath.section == 1 && indexPath.row == 3) || (indexPath.section == 1 && indexPath.row == 4) || (indexPath.section == 1 && indexPath.row == 5) || (indexPath.section == 1 && indexPath.row == 6) || (indexPath.section == 1 && indexPath.row == 7)) {
        
        MerchantManSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"merchantManSecond" forIndexPath:indexPath];
        if (!cell) {
            cell = [[MerchantManSecondCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"merchantManSecond"];
        }
        
        /**
         *  自定义按钮(抢)
         */
        UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectionBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [collectionBtn setTitleColor:[UIColor colorWithRed:212./255. green:95./255. blue:114./255. alpha:1.0]forState:UIControlStateNormal];
        collectionBtn.layer.cornerRadius = 6.0;//切圆角
        [collectionBtn setTitle:@"抢" forState:UIControlStateNormal];
        [collectionBtn addTarget:self action:@selector(collectionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:collectionBtn];
        [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(cell.discountNumLabel.mas_bottom).offset(5);
            make.right.mas_equalTo(cell.contentView.mas_right).offset(-10);
            make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-30);
            make.width.offset(30);
        }];
        
        return cell;
    }
    
    //第三部分
    if (indexPath.section == 2) {
        StoreThreeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storethreeone" forIndexPath:indexPath];
        if (!cell) {
            cell = [[StoreThreeOneCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"storethreeone"];
        }
        cell.titleLabel.text = self.threeTitleArr[indexPath.row];
        
        return cell;
    }
    
    //第四部分
    if (indexPath.section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"fourCell"];
        }
        cell.textLabel.text = self.FourOneTitleArr[indexPath.row];
        cell.detailTextLabel.text = self.FourTwoTitleArr[indexPath.row];
        
        return cell;
    }
    
    //第五部分
    if (indexPath.section == 4) {
        StoreThreeOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storethreeone" forIndexPath:indexPath];
        if (!cell) {
            cell = [[StoreThreeOneCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"storethreeone"];
        }
        cell.titleLabel.text = self.FiveTitleArr[indexPath.row];
        
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LKLog(@"%ld %ld",indexPath.section,indexPath.row);
    
    if (indexPath.section == 4) {
        
    }
    
}







#pragma mark - button的点击事件
-(void)collectionBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了抢按钮");
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
    [self.navigationController popViewControllerAnimated:YES];
}

@end

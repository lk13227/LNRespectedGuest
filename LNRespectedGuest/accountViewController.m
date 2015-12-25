//
//  accountViewController.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/7.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "accountViewController.h"
#import "ChangeThePasswordViewController.h"

@interface accountViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArr;
@property (nonatomic,strong)NSArray *otherArr;
@end

@implementation accountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的账户";
    
    self.dataArr = @[@"用户名",@"贵人积分",@"贵人号",@"手机号",@"身份",@"推荐次数",@"采用次数",@"修改密码",@"需求标签",@"贵人标签"];
    self.otherArr = @[@"刘凯",@"10分",@"12345",@"18910711571",@"贵人",@"10次",@"10次",@"",@"需要一个妹子",@"NB"];
    [self createUI];
}


#pragma mark - UI
- (void)createUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-200) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;//tableview禁止滑动
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:self.tableView];
    
    //申请商圈
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setTitle:@"成为贵员" forState:UIControlStateNormal];
    [circleBtn setTintColor:[UIColor whiteColor]];
    circleBtn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [circleBtn addTarget:self action:@selector(circleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:circleBtn];
    circleBtn.layer.cornerRadius = 8.0;//圆角
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+70);
        make.right.mas_equalTo(self.view.mas_right).offset(-70);
        make.top.mas_equalTo(self.tableView.mas_bottom).offset(+30);
        make.height.offset(40);
    }];
}

#pragma mark - 成为贵员
- (void)circleClick:(UIButton *)btn{
    LKLog(@"成为贵员");
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"account"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"account"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"tab_2"];
    
    if (indexPath.row == 7) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell右边的小箭头
    }else{
        UILabel *label = [[UILabel alloc] init]; //定义一个在cell最右边显示的label
        label.text = self.otherArr[indexPath.row];
        label.font = [UIFont boldSystemFontOfSize:14];
        [label sizeToFit];
        label.backgroundColor = [UIColor clearColor];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
            label.frame =CGRectMake(self.view.frame.size.width - label.frame.size.width - 10,\
                                    12, label.frame.size.width, label.frame.size.height);
        } else {
            label.frame =CGRectMake(self.view.frame.size.width - label.frame.size.width - 20,\
                                    12, label.frame.size.width, label.frame.size.height);
        }
        [cell.contentView addSubview:label];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor grayColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath.row == 7) {
        ChangeThePasswordViewController *VC = [[ChangeThePasswordViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end

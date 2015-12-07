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
    self.title = @"我的账户";
    
    self.dataArr = @[@"手机号",@"用户名",@"修改密码"];
    self.otherArr = @[@"刘凯",@"18910711571"];
    [self createUI];
}


#pragma mark - UI
- (void)createUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height-10) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:self.tableView];
 }

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"account"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"account"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"tab_2"];
    
    if (indexPath.row == 2) {
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
    if (indexPath.row == 2) {
        ChangeThePasswordViewController *VC = [[ChangeThePasswordViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end

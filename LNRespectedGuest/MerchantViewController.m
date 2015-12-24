//
//  MerchantViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/23.
//  Copyright © 2015年 Yun. All rights reserved.
//贵人（员）

#import "MerchantViewController.h"
#import "MerchantPersonCell.h"

@interface MerchantViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MerchantViewController

/**
 *  创建数据源
 */
-(void)createData
{
    self.dataArray = [[NSMutableArray alloc]init];
}
/**
 *  创建tableView
 */
-(void)initView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGTH ) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self initView];
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellName = @"Cell";
    MerchantPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MerchantPersonCell" owner:nil options:nil]firstObject];
    }
    /**
     *  自定义按钮
     */
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [collectionBtn setTitleColor:[UIColor colorWithRed:212./255. green:95./255. blue:114./255. alpha:1.0]forState:UIControlStateNormal];
    [collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [collectionBtn addTarget:self action:@selector(collectionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:collectionBtn];
    [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cell.discountNumLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(cell.contentView.mas_right).offset(-10);
        make.bottom.mas_equalTo(cell.integralLabel.mas_top).offset(-30);
        make.width.offset(30);
    }];
    
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
        make.left.mas_equalTo(shareBtn.mas_right).offset(10);
        make.bottom.mas_equalTo(cell.contentView.mas_bottom).offset(-10);
        make.width.offset(100);
    }];

    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}
#pragma mark - button的点击事件
-(void)collectionBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了收藏按钮");
}
-(void)shareBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了分享按钮");
}
-(void)useBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了立即使用按钮");
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

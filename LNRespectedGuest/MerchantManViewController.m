//
//  MerchantManViewController.m
//  LNRespectedGuest
//
//  Created by 理念空间科技有限公司 on 15/12/24.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MerchantManViewController.h"
#import "MerchantManFirstCell.h"
#import "MerchantManSecondCell.h"

@interface MerchantManViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MerchantManViewController

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
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        static NSString *CellName = @"MerchantManFirstCell";
        MerchantManFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:CellName];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MerchantManFirstCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.textLabel.text = self.dataArray[indexPath.row];
        return cell;

    }
    static NSString *CellName = @"MerchantManSecondCell";
    MerchantManSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:CellName];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MerchantManSecondCell" owner:self options:nil]lastObject];
    }
    /**
     *  自定义按钮
     */
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [collectionBtn setTitleColor:[UIColor colorWithRed:212./255. green:95./255. blue:114./255. alpha:1.0]forState:UIControlStateNormal];
    collectionBtn.layer.cornerRadius = 6.0;//切圆角
    [collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 95;

    }
    if (indexPath.row == 1)
    {
        return 70;
        
    }
    if (indexPath.row == 2)
    {
        return 70;
        
    }
    return 0;
}
#pragma mark - button的点击事件
-(void)collectionBtnClick:(UIButton *)btn
{
    LKLog(@"您点击了收藏按钮");
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

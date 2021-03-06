//
//  MessageViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/17.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation MessageViewController

/**
 *  创建数据源
 */
-(void)creatData
{
    self.dataArray = [[NSMutableArray alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //[self setExtraCellLineHidden:self.tableView];
    
    //self.tableView.separatorColor = [UIColor greenColor];//分割线颜色
    
    [self creatData];
    
    [self.view addSubview:self.tableView];

    
}

#pragma mark - 实现黄金三问

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*必须方法*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*返回每一个分段有多少行*/
    if (self.dataArray.count == 0)
    {
        return 15;
    }
    else
    return self.dataArray.count;
}

/*必须方法*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*声明一个静态的复用标示*/
    static NSString *cellName = @"Cell";
    /*创建一个可以复用的Cell表格*/
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MessageCell" owner:nil options:nil]firstObject];
    }
    /*使用Cell即可*/
    //cell.textLabel.text = self.dataArray[indexPath.row];
    /*返回Cell的实例*/
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //反选
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}


//-(void)setExtraCellLineHidden: (UITableView *)tableView
//{
//    UIView *view = [UIView new];
//    
//    view.backgroundColor = [UIColor clearColor];
//    
//    [tableView setTableFooterView:view       ];
//}
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

//
//  FriendsViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/27.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "FriendsViewController.h"
#import "JHCustomMenu.h"

#import "HeadView.h"

@interface FriendsViewController ()<JHCustomMenuDelegate,UITableViewDataSource,UITableViewDelegate,HeadViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
/*当前的分段数*/
@property(nonatomic,assign)NSUInteger currentSection;
/*当前的行数*/
@property(nonatomic,assign)NSUInteger currentRow;
/*分区头视图*/
@property(nonatomic,strong)NSMutableArray *headViewArray;

@property (nonatomic, strong) JHCustomMenu *menu;


@end

@implementation FriendsViewController


/*创建一个UITableView*/
-(void)createUI
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init]; //只显示数据的cell
    //self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
    
    
}

-(void)createData
{
    if(!_dataArray)
        _dataArray = [NSMutableArray array];
    if(!_headViewArray)
        _headViewArray = [NSMutableArray array];
    for(NSUInteger i = 0 ; i < 2; i++)
    {
        /*头视图*/
        HeadView *head = [[HeadView alloc] init];
        head.section = i;
        head.delegate = self;
        //head.backgroundColor = [UIColor redColor];
        [self.headViewArray addObject:head];
    }
    /*设置分组上每一个分组显示的标题*/
    [((HeadView *)self.headViewArray[0]).backButton setTitle:@"推宝人" forState:UIControlStateNormal];
    [((HeadView *)self.headViewArray[1]).backButton setTitle:@"通讯录" forState:UIControlStateNormal];
   
    /*每个分段里边的内容*/
    for(NSUInteger i = 0 ; i < 10 ; i++)
    {
        if(i < 9)
        {
            [self.dataArray addObject:[NSString stringWithFormat:@"联系人0%lu",i+1]];
        }
        else
        {
            [self.dataArray addObject:[NSString stringWithFormat:@"联系人%lu",i+1]];
        }
    }
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //调用
    [self createUI];
    [self createData];
    
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"schoolListItem.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showSchoolList:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}


#pragma mark - 实现黄金三问

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    /*头视图的数组元素个数*/
    return self.headViewArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HeadView *head = self.headViewArray[section];
    return head.isOpen?self.dataArray.count:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeadView *head = self.headViewArray[indexPath.section];
    return head.isOpen?45.0f:0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headViewArray[section];
}

#pragma mark  - HeadViewDelegate
-(void)selectdWith:(HeadView *)view
{
    view.isOpen = !view.isOpen;
    [self.tableView reloadData];
}



- (void)showSchoolList:(UIBarButtonItem *)barButtonItem
{
    __weak __typeof(self) weakSelf = self;
    if (!self.menu) {
        self.menu = [[JHCustomMenu alloc] initWithDataArr:@[@"加好友", @"扫一扫", @"发动态", @"发起聊天",@"发起聊天"] origin:CGPointMake(0, 0) width:125 rowHeight:44];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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

/**
 *  广告图片
 */
@property (nonatomic,strong)UIImageView *adImageView;
/**
 *  商品名字
 */
@property (nonatomic,strong)UILabel *titleLabel;
/**
 *  评分
 */
@property (nonatomic,strong)UILabel *scoreLabel;
/**
 *  人均钱
 */
@property (nonatomic,strong)UILabel *moneyLabel;
/**
 *  地址
 */
@property (nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UILabel *circleLabel;
@property(nonatomic,strong)UILabel *memberLabel;
@property(nonatomic,strong)UILabel *peopleLabel;

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
    self.view.backgroundColor = [UIColor whiteColor];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];//隐藏导航栏
    
    [self createUI];
    [self createTableView];
    [self createReturn];
}

/**
 *  创建UI
 */
- (void)createUI{
    self.adImageView = [[UIImageView alloc] init];
    self.adImageView.image = [UIImage imageNamed:@"scrollView2.jpg"];
    [self.view addSubview:self.adImageView];
    [self.adImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.offset(150);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"科普卢星区艾尔";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.adImageView.mas_bottom).offset(5);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.offset(20);
    }];
    
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.text = @"泰玛特洛斯-1305";
    self.addressLabel.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.offset(20);
    }];
    
    //上面三个按钮
    //贵圈
    UIView *circleView = [[UIView alloc] init];
    circleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:circleView];
    [self createLine:circleView];
    
    UIButton *circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [circleBtn setImage:[UIImage imageNamed:@"发现_03"] forState:UIControlStateNormal];
    //    circleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:circleBtn];
    
    self.circleLabel = [[UILabel alloc]init];
    //self.circleLabel.backgroundColor = [UIColor lightGrayColor];
    self.circleLabel.text = @"350";
    self.circleLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.circleLabel];
    
    
    //贵元
    UIView *memberView = [[UIView alloc] init];
    memberView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:memberView];
    [self createBottomLine:memberView];
    
    UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [memberBtn setImage:[UIImage imageNamed:@"发现_05"] forState:UIControlStateNormal];
    //    memberBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:memberBtn];
    
    self.memberLabel = [[UILabel alloc]init];
    //self.memberLabel.backgroundColor = [UIColor lightGrayColor];
    self.memberLabel.text = @"350";
    self.memberLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.memberLabel];
    
    //贵人
    UIView *peopleView = [[UIView alloc] init];
    peopleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:peopleView];
    [self createRightLine:peopleView];
    
    UIButton *peopleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [peopleBtn setImage:[UIImage imageNamed:@"发现_07"] forState:UIControlStateNormal];
    //    peopleBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.view addSubview:peopleBtn];
    
    self.peopleLabel = [[UILabel alloc]init];
    //self.peopleLabel.backgroundColor = [UIColor lightGrayColor];
    self.peopleLabel.text = @"350";
    self.peopleLabel.textColor = [UIColor greenColor];
    [self.view addSubview:self.peopleLabel];
    
    //三个背景view的约束
    NSInteger W = self.view.frame.size.width/3;
    [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.offset(W);
        make.top.mas_equalTo(self.addressLabel.mas_bottom).offset(10);
        make.height.offset(100);
    }];
    [memberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.addressLabel.mas_bottom).offset(10);
        make.height.offset(100);
    }];
    [peopleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_right);
        make.width.mas_equalTo(circleView.mas_width);
        make.top.mas_equalTo(self.addressLabel.mas_bottom).offset(10);
        make.height.offset(100);
    }];
    
    //三个按钮的约束
    [circleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(circleView.mas_left).offset(40);
        make.right.mas_equalTo(circleView.mas_right).offset(-40);
        make.top.mas_equalTo(circleView.mas_top).offset(10);
        make.bottom.mas_equalTo(circleView.mas_bottom).offset(-10);
    }];
    [memberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(memberView.mas_left).offset(40);
        make.right.mas_equalTo(memberView.mas_right).offset(-40);
        make.top.mas_equalTo(memberView.mas_top).offset(10);
        make.bottom.mas_equalTo(memberView.mas_bottom).offset(-10);
    }];
    [peopleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(peopleView.mas_left).offset(40);
        make.right.mas_equalTo(peopleView.mas_right).offset(-40);
        make.top.mas_equalTo(peopleView.mas_top).offset(10);
        make.bottom.mas_equalTo(peopleView.mas_bottom).offset(-10);
    }];
    
    //三个label的约束
    [self.circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(circleView.mas_top).offset(+5);
        make.right.mas_equalTo(circleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(memberView.mas_top).offset(+5);
        make.right.mas_equalTo(memberView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(peopleView.mas_top).offset(+5);
        make.right.mas_equalTo(peopleView.mas_right).offset(-5);
        make.height.offset(25);
        make.width.offset(35);
    }];
    
    UIView *tmpView = [[UIView alloc] init];
    tmpView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tmpView];
    [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(circleView.mas_bottom);
        make.height.offset(10);
    }];
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
        make.top.mas_equalTo(self.view.mas_top).offset(320);
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
    [self.view addSubview:returnBtn];
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


#pragma mark - createLine划线
- (void)createLine:(UIView *)view{
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view.mas_bottom);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.height.offset(1);
    }];
}
- (void)createRightLine:(UIView *)view{
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.height.offset(1);
    }];
}
- (void)createBottomLine:(UIView *)view{
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.height.offset(1);
    }];
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.height.offset(1);
    }];
}

@end

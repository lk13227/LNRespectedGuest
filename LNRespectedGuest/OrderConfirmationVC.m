//
//  OrderConfirmationVC.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/18.
//  Copyright © 2015年 Yun. All rights reserved.
//订单确认

#import "OrderConfirmationVC.h"

#import <AlipaySDK/AlipaySDK.h>//支付宝
#import "Order.h"
#import "DataSigner.h"
#import "Product.h"

@interface OrderConfirmationVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)NSArray *otherArr;

@end

@implementation OrderConfirmationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    self.title = @"订单确认";
    self.titleArr = @[@[@"北京理念空间XXX",@"金额",@"折扣信息"],@[@"使用积分",@"使用者",@"服务员",@"贵人积分",@"实收金额"],@[@"我要推荐",@"立即分享到商家"]];
    self.otherArr = @[@[@"",@"￥88",@"7折"],@[@"20",@"id2345678",@"id3456789",@"10",@"￥60.2"]];
    
    [self createTableView];
    [self createNextBtn];
    
    [self generateData];//支付宝数据
}

/**
 *  创建tableview
 */
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH-109) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;//tableview禁止滑动
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];//去掉多余的cell
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView代理方法
//脚视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView  alloc] init];
    view.backgroundColor = [UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1.0];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGTH);
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 5;
    }
    if (section == 2) {
        return 2;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{//组
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"yuio"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"yuio"];
    }
    
    cell.textLabel.text = self.titleArr[indexPath.section][indexPath.row];
    if (indexPath.section == 0 || indexPath.section == 1) {
        cell.detailTextLabel.text = self.otherArr[indexPath.section][indexPath.row];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LKLog(@"%ld %ld",indexPath.section,indexPath.row);
}

#pragma mark - 确认消费按钮
- (void)createNextBtn{
    //退出登录
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确认消费" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.cornerRadius = 8.0;//圆角
    btn.backgroundColor = [UIColor colorWithRed:77.0/255 green:181.0/255 blue:185.0/255 alpha:1.0];
    [btn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.tableView.mas_bottom).offset(+30);
        make.height.offset(40);
    }];
}

- (void)nextClick{
    LKLog(@"确认消费");
    
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    //Product *product = [self.productList objectAtIndex:indexPath.row];
    Product *product = [self.productList firstObject];
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088001577647355";//商户ID
    NSString *seller = @"bjchcxdz@alibaba.com.cn";//支付宝账号
    NSString *privateKey = @"";
    //NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANwyIyNlDqgr/CmhikOQt+K6IG/Y6fHY5rmgV3Ya9MYsouvB6kXErA0A/lL9O5rRPtctBJiQyU2DjYnw221X3iR8ODPKmMp0ZRQG8LE1lDPOH+d+CSo8o9pCzWMHnpMqbA0XRLLgFe7229YdxkdLPrrCZ5aAcui7liTxuZHAvL9xAgMBAAECgYAnBYOQnDISv2i6f/QesSDFPzLMX2ZmA4gv0Shut6w1Cmf826qGnqnWzBxF3LaZYwd93m54EwB5ihylG1fncrDc9jcME1+3L2JQvWxvEPQy66X5EKtU1G3KrFO0hgnL0dv9LuZ6OsFHBCzOsLVApn8hNojhQ9KcGoC4Acwygyg4IQJBAO+vUfodLcHc+E7aFjzQQ5+AmKzbgOrAJYFY8cqnXf0XxEbfNpr6DH60bHACWuApetu6gD4g4Eey4s6+gY6f06UCQQDrLzUUxlLJgsVzd3LePhmJdhKr37sMFvPLUk1Qk4kIp6t0wHOO36A42ihEiU4STRyCKTCbMrC+X28MLzVq4MLdAkAZC3jFacceOri3hJJOSHTIded+KHGQFgPVQDYDtvlbOOCJh0ltaDNmCfRKv/Q++BaeXx6HX2gQFeEdOUrQXGMBAkEAwnJod8G1ZwhpChujbF55rK5jp5k2RDuh2+QzKkChFvfSCZiosmLwTLEKhAfl9bmtrWwy1M5nVS8AWFmb1773PQJAK0A/kvk4OWHrFr6xr08RMMjkhu9xKzSsmC0Zk5KmCvYsV0PeZf3+UAEOVwxWezmu2qzl4YOhIGQB0abRBMZtcg==";//秘钥 用于数据安全，数据加密
    //这三个数据支付宝会提供
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    //把商品转换成订单信息
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;//设置商户ID
    order.seller = seller;//设置支付宝账号
    order.tradeNO = [self generateTradeNO]; //订单ID必须在系统中是唯一的
    order.productName = product.subject; //商品标题
    order.productDescription = product.body; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";//支付类型 如 1:支付 2:退款 等
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    //此处为支付宝回跳scheme
    //NSString *appScheme = @"alisdkdemo";
    NSString *appScheme = @"wxac0f9ec0c1210f41";
    
    //将订单信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    //请求参数252765927
    /*
     partner=""&seller_id=""&out_trade_no="93I93TSJVM9Q32E"&subject="3"&body="我是测试数据"&total_fee="1.01"&notify_url="http://www.xxx.com"&service="mobile.securitypay.pay"&payment_type="1"&_input_charset="utf-8"&it_b_pay="30m"&show_url="m.alipay.com"
     */
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    //RSA 加密技术-加密数据
    //签名对象
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    //签名数据
    /**
     *  签名 类似于每个人的指纹
     *  abc 签名 -> 得到一指纹(字符串)
     *  abd 签名 -> 得到一指纹(字符串)
     
     *  支付
     *  total_fee="0.02"&notify_url="http://www.xxx.com &sign=ABC -> 签名 -> 指纹(ABC)
     *  total_fee="2000"&notify_url="http://www.xxx.com &sign=ABC -> 签名 -> 指纹(ABD)
     */
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        //一个完整的数据提交的支付宝的服务器，一定要有一个签名(sign)
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);//回调
        }];
    }
    
}

#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}



#pragma mark -
#pragma mark   ==============产生订单信息==============

- (void)generateData{
    NSArray *subjects = @[@"1",
                          @"2",@"3",@"4",
                          @"5",@"6",@"7",
                          @"8",@"9",@"10"];
    NSArray *body = @[@"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据",
                      @"我是测试数据"];
    
    if (nil == self.productList) {
        self.productList = [[NSMutableArray alloc] init];
    }
    else {
        [self.productList removeAllObjects];
    }
    
    for (int i = 0; i < [subjects count]; ++i) {
        Product *product = [[Product alloc] init];
        product.subject = [subjects objectAtIndex:i];
        product.body = [body objectAtIndex:i];
        
        product.price = 0.01f+pow(10,i-2);
        [self.productList addObject:product];
    }
}


@end

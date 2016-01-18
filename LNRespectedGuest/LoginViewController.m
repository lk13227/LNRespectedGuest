//
//  LoginViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/23.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "LoginViewController.h"
#import "registeredViewController.h"

#import "MerchantBusinessViewController.h"//贵人圈
#import "FriendsViewController.h"//通讯录
#import "MessageViewController.h"//消息
#import "FindViewController.h"//发现
#import "PersonViewController.h"//我

@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate,UITabBarControllerDelegate>

@property(nonatomic,strong)MerchantBusinessViewController *merchantBusinessVC;
@property(nonatomic,strong)FriendsViewController *friendsVC;
@property(nonatomic,strong)MessageViewController *messageVC;
@property(nonatomic,strong)FindViewController *findVC;
@property(nonatomic,strong)PersonViewController *personVC;

@property (nonatomic,strong) UITextField *userText;
@property (nonatomic,strong) UITextField *passwordText;
@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *passwordLabel;
@property (nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIBarButtonItem *barButton;

@end
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

   
    [self createUI];
    [self createReturn];
    
}

- (void)createUI{
    
    //假导航
    UIView *titleView = [[UIView alloc] init];
    //    titleView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 64);
    titleView.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    [self.view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.view.mas_top);
        make.height.offset(64);
    }];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] init];
    //WithFrame:CGRectMake(self.view.bounds.size.width/2-40, 10, 80, 50)
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    titleLabel.text = @"登录";
    titleLabel.textColor = [UIColor whiteColor];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleView.mas_left).offset(+100);
        make.right.mas_equalTo(titleView.mas_right).offset(-100);
        make.top.mas_equalTo(titleView.mas_top).offset(+10);
        make.height.offset(50);
    }];
    
    //logo
    self.imageView = [[UIImageView alloc] init];
    [self.imageView setImage:[UIImage imageNamed:@"123.jpg"]];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+80);
        make.right.mas_equalTo(self.view.mas_right).offset(-80);
        make.top.mas_equalTo(titleView.mas_bottom).offset(+15);
        make.height.mas_equalTo(self.imageView.mas_width);
    }];
    
    //用户
    UIView *userVIew = [[UIView alloc] init];
    [self.view addSubview:userVIew];
    [userVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(+20);
        make.height.offset(40);
    }];
    [self createLine:userVIew];
    
    self.userLabel = [[UILabel alloc] init];
    self.userLabel.text = @"手机:";
    [userVIew addSubview:self.userLabel];
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(userVIew.mas_bottom);
        make.top.mas_equalTo(userVIew.mas_top);
        make.width.offset(40);
    }];
    
    self.userText = [[UITextField alloc] init];
    self.userText.placeholder = @"手机号";
    self.userText.text = @"123";
    [self.view addSubview:self.userText];
    [self.userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.userLabel.mas_right).offset(10);
        make.top.mas_equalTo(userVIew.mas_top);
        make.right.mas_equalTo(userVIew.mas_right);
        make.height.offset(40);
    }];
    
    //密码
    UIView *passwordVIew = [[UIView alloc] init];
    [self.view addSubview:passwordVIew];
    [passwordVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(userVIew.mas_bottom).offset(+20);
        make.height.offset(40);
    }];
    [self createLine:passwordVIew];
    
    self.passwordLabel = [[UILabel alloc] init];
    self.passwordLabel.text = @"密码:";
    [passwordVIew addSubview:self.passwordLabel];
    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordVIew.mas_left).offset(+10);
        make.top.mas_equalTo(passwordVIew.mas_top);
        make.bottom.mas_equalTo(passwordVIew.mas_bottom);
        make.width.offset(40);
    }];
   
    
    self.passwordText = [[UITextField alloc] init];
    self.passwordText.placeholder = @"请输入您的密码";
    self.passwordText.text = @"123";
    self.passwordText.secureTextEntry = YES;
    [self.view addSubview:self.passwordText];
    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passwordLabel.mas_right).offset(10);
        make.top.mas_equalTo(passwordVIew.mas_top);
        make.right.mas_equalTo(passwordVIew.mas_right);
        make.height.offset(40);
    }];
    
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTintColor:[UIColor whiteColor]];
    loginBtn.layer.cornerRadius = 8.0;//圆角
    [loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(passwordVIew.mas_bottom).offset(+20);
        make.height.offset(40);
    }];
    
    //快速注册
    UIButton *registeredBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registeredBtn.backgroundColor = [UIColor whiteColor];
    [registeredBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [registeredBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [registeredBtn addTarget:self action:@selector(registeredBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registeredBtn];
    [registeredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+200);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(loginBtn.mas_bottom).offset(+20);
        make.height.offset(40);
    }];
    [self createLine:registeredBtn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![self.userText isExclusiveTouch]) {
        [self.userText resignFirstResponder];
    }
    if (![self.passwordText isExclusiveTouch]) {
        [self.passwordText resignFirstResponder];
    }
}


#pragma mark loginClick
- (void)loginBtn:(UIButton *)btn{
    //先来一个蒙板
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.labelText = @"登录中...";//蒙板上的字,就改这个
    [HUD show:YES];//控制手动打开
    if (([self.userText.text  isEqual: @"123"]) && ([self.passwordText.text  isEqual: @"123"])) {
        [HUD removeFromSuperview];//删除蒙板
        
        [self createTabBar];
        
    } else {
        [HUD removeFromSuperview];//删除蒙板
        UIAlertView *storeAlert = [[UIAlertView alloc] initWithTitle:@"账号123密码123" message:nil delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [storeAlert show];
    }
    
}
//- (void)loginBtn:(UIButton *)btn{
////    [self dismissViewControllerAnimated:YES completion:nil];
//    //先来一个蒙板
//    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    HUD.labelText = @"请等待";//蒙板上的字,就改这个
//    [HUD show:YES];//控制手动打开
//    
//    NSMutableDictionary *registerDic = [NSMutableDictionary dictionary];
//    [registerDic setObject:self.userText.text forKey:@"usertel"];
//    [registerDic setObject:self.passwordText.text forKey:@"password"];
//    
//    NSString *postUrl = @"http://www.chongdonghome.com/gr/index.php/user/login";
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
//    
//    [manager POST:postUrl parameters:registerDic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        [HUD removeFromSuperview];//删除蒙板
//        LKLog(@"%@",responseObject);
//        
//        if ([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
//            //注册成功
//            
//            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"登录成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//            alert.alertViewStyle=UIAlertViewStyleDefault;
//            [alert show];
//            
//        }else {
//            //注册失败
//            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:[responseObject objectForKey:@"errMsg"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//            alert.alertViewStyle=UIAlertViewStyleDefault;
//            [alert show];
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        LKLog(@"%@",error);
//        [HUD removeFromSuperview];//删除蒙板
//    }];
//    
//    
//}

#pragma mark -提示框点击方法
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIAlertViewDelegate协议定义，在点击AlertView按钮时自动执行，所以如果这里再用alertView来弹出提//示，就会死循环，不停的弹AlertView
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.userText.text);
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

#pragma mark registeredClick
- (void)registeredBtn:(UIButton *)btn{
    registeredViewController *VC = [[registeredViewController alloc] init];
    [VC returnText:^(NSString *showText) {
        self.userText.text = showText;
    }];
    [self presentViewController:VC animated:YES completion:nil];
}

#pragma mark - block回调
- (void)returnUser:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

#pragma mark - createLine划线
- (void)createLine:(UIView *)view{
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.right.mas_equalTo(view.mas_right);
        make.top.mas_equalTo(view.mas_top);
        make.height.offset(1);
    }];
    
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left);
        make.bottom.mas_equalTo(view.mas_bottom);
        make.top.mas_equalTo(view.mas_top);
        make.width.offset(1);
    }];
    
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
}




/**
 *  返回按钮
 */
- (void)createReturn{
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"返回 拷贝.png"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.width.offset(15);
        make.top.mas_equalTo(self.view.mas_top).offset(25);
        make.height.offset(20);
    }];
}
/**
 *  返回事件
 */
- (void)returnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 创建tabbar
- (void)createTabBar{

    /*创建一个导航分栏控制器的对象*/
    UITabBarController *tbc = [[UITabBarController alloc]init];
    [tbc.tabBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"]];
    /*设置分栏控制器的委托人属性*/
    tbc.delegate = self;
    self.merchantBusinessVC = [[MerchantBusinessViewController alloc]init];
    UIImage *tabbarImage1 = [UIImage imageNamed:@"tab_0"];
    [self setOneController:self.merchantBusinessVC andVCTabbarImage:tabbarImage1 andTabbar:tbc andVCTitle:@"贵人圈"];

    self.friendsVC = [[FriendsViewController alloc]init];
    UIImage *tabbarImage2 = [UIImage imageNamed:@"tab_1"];
    [self setOneController:self.friendsVC andVCTabbarImage:tabbarImage2 andTabbar:tbc andVCTitle:@"联系人"];

    self.messageVC = [[MessageViewController  alloc]init];
    UIImage *tabbarImage3 = [UIImage imageNamed:@"tab_2"];
    [self setOneController:self.messageVC andVCTabbarImage:tabbarImage3 andTabbar:tbc andVCTitle:@"消息"];

    self.findVC = [[FindViewController alloc]init];
    UIImage *tabbarImage4 = [UIImage imageNamed:@"tab_3"];
    [self setOneController:self.findVC andVCTabbarImage:tabbarImage4 andTabbar:tbc andVCTitle:@"发现"];

    self.personVC = [[PersonViewController alloc]init];
    UIImage *tabbarImage5 = [UIImage imageNamed:@"tab_3"];
    [self setOneController:self.personVC andVCTabbarImage:tabbarImage5 andTabbar:tbc andVCTitle:@"我"];
    
    [self presentViewController:tbc animated:YES completion:nil];//单纯界面跳转
}

- (void)setOneController:(UIViewController *)VC andVCTabbarImage:(UIImage *)tabbarImage andTabbar:(UITabBarController *)tabbar andVCTitle:(NSString *)title{
    
    VC.title = title;
    VC.tabBarItem.image = tabbarImage;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
        forBarMetrics:UIBarMetricsDefault];
    /*添加导航控制器*/
    UINavigationController *Nav = [[UINavigationController alloc]initWithRootViewController:VC];
    Nav.navigationBar.tintColor = [UIColor whiteColor];//改变导航箭头颜色123456
    [Nav.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];//改变导航标题颜色
    [Nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar_color"] forBarMetrics:UIBarMetricsDefault];
    
    /*导航栏风格--背景*/
    //businessNav.navigationBar.barStyle = UIBarStyleDefault;
    
    /*导航栏透明*/
    Nav.navigationBar.translucent = YES;
    
    [tabbar addChildViewController:Nav];
}

@end

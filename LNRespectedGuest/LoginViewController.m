//
//  LoginViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/23.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "LoginViewController.h"
#import "registeredViewController.h"

@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>


@property (nonatomic,strong) UITextField *userText;
@property (nonatomic,strong) UITextField *passwordText;
@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *passwordLabel;
@property (nonatomic,strong) UIImageView *imageView;

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
    loginBtn.layer.cornerRadius = 8.0;
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
//    [self dismissViewControllerAnimated:YES completion:nil];
    //先来一个蒙板
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"请等待";//蒙板上的字,就改这个
    [HUD show:YES];//控制手动打开
    
    NSMutableDictionary *registerDic = [NSMutableDictionary dictionary];
    [registerDic setObject:self.userText.text forKey:@"usertel"];
    [registerDic setObject:self.passwordText.text forKey:@"password"];
    
    NSString *postUrl = @"http://www.chongdonghome.com/gr/index.php/user/login";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [manager POST:postUrl parameters:registerDic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [HUD removeFromSuperview];//删除蒙板
        LKLog(@"%@",responseObject);
        
        if ([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            //注册成功
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"登录成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.alertViewStyle=UIAlertViewStyleDefault;
            [alert show];
            
        }else {
            //注册失败
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:[responseObject objectForKey:@"errMsg"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.alertViewStyle=UIAlertViewStyleDefault;
            [alert show];
            
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        LKLog(@"%@",error);
        [HUD removeFromSuperview];//删除蒙板
    }];
    
    
}

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

@end

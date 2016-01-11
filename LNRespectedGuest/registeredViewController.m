//
//  registeredViewController.m
//  LNRespectedGuest
//
//  Created by Barry on 15/11/23.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "registeredViewController.h"

#import <CoreLocation/CoreLocation.h>//定位

#define SEC 60

@interface registeredViewController ()<UIAlertViewDelegate,CLLocationManagerDelegate>

@property (nonatomic,strong)UITextField *userText;
@property (nonatomic,strong)UITextField *phoneText;
@property (nonatomic,strong)UITextField *passwordText;
@property (nonatomic,strong)UITextField *confirmText;
@property (nonatomic,strong)UITextField *verificationText;

@property (nonatomic,strong)UITextField *positioningText;

@property (nonatomic,strong)CLLocationManager *mgr;//定位管理

@end

@implementation registeredViewController{
    UIButton *_verifyBtn;
    UILabel  *_timeLab;
}

- (CLLocationManager *)mgr{
    if (_mgr == nil) {
        //1.创建定位管理者
        _mgr = [[CLLocationManager alloc] init];
        _mgr.delegate = self;
        //2.位置间隔之后重新定位
        _mgr.distanceFilter = 10;
        //3.定位的精确度
        _mgr.desiredAccuracy = kCLLocationAccuracyBestForNavigation;

    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    
    
}

- (void)creatUI{
    
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
    titleLabel.text = @"注册";
    titleLabel.textColor = [UIColor whiteColor];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleView.mas_left).offset(+100);
        make.right.mas_equalTo(titleView.mas_right).offset(-100);
        make.top.mas_equalTo(titleView.mas_top).offset(+10);
        make.height.offset(50);
    }];
    
    //姓名
    UIView *userVIew = [[UIView alloc] init];
    [self.view addSubview:userVIew];
    [userVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(titleView.mas_bottom).offset(+20);
        make.height.offset(40);
    }];
    [self createLine:userVIew];
    
    UILabel *userLabel = [[UILabel alloc] init];
    userLabel.text = @"姓名:";
    [userVIew addSubview:userLabel];
    [userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(userVIew.mas_bottom);
        make.top.mas_equalTo(userVIew.mas_top);
        make.width.offset(40);
    }];
    
    self.userText = [[UITextField alloc] init];
    self.userText.placeholder = @"请输入姓名";
    [self.view addSubview:self.userText];
    [self.userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userLabel.mas_right).offset(10);
        make.top.mas_equalTo(userVIew.mas_top);
        make.right.mas_equalTo(userVIew.mas_right);
        make.height.offset(40);
    }];
    
    //手机号
    UIView *phoneVIew = [[UIView alloc] init];
    [self.view addSubview:phoneVIew];
    [phoneVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(userVIew.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    [self createLine:phoneVIew];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    phoneLabel.text = @"手机:";
    [phoneVIew addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(phoneVIew.mas_bottom);
        make.top.mas_equalTo(phoneVIew.mas_top);
        make.width.offset(40);
    }];
    
    self.phoneText = [[UITextField alloc] init];
    self.phoneText.placeholder = @"请输入手机号";
    [self.view addSubview:self.phoneText];
    [self.phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneLabel.mas_right).offset(10);
        make.top.mas_equalTo(phoneVIew.mas_top);
        make.right.mas_equalTo(phoneVIew.mas_right);
        make.height.offset(40);
    }];
    
    //密码
    UIView *passwordVIew = [[UIView alloc] init];
    [self.view addSubview:passwordVIew];
    [passwordVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(phoneVIew.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    [self createLine:passwordVIew];
    
    UILabel *passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"密码:";
    [passwordVIew addSubview:passwordLabel];
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(passwordVIew.mas_bottom);
        make.top.mas_equalTo(passwordVIew.mas_top);
        make.width.offset(40);
    }];
    
    self.passwordText = [[UITextField alloc] init];
    self.passwordText.placeholder = @"请输入至少6位字符或数字";
    self.passwordText.secureTextEntry = YES;
    [self.view addSubview:self.passwordText];
    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordLabel.mas_right).offset(10);
        make.top.mas_equalTo(passwordVIew.mas_top);
        make.right.mas_equalTo(passwordVIew.mas_right);
        make.height.offset(40);
    }];
    
    //确认密码
    UIView *confirmVIew = [[UIView alloc] init];
    [self.view addSubview:confirmVIew];
    [confirmVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(passwordVIew.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    [self createLine:confirmVIew];
    
    UILabel *confirmLabel = [[UILabel alloc] init];
    confirmLabel.text = @"确认密码:";
    [confirmVIew addSubview:confirmLabel];
    [confirmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(confirmVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(confirmVIew.mas_bottom);
        make.top.mas_equalTo(confirmVIew.mas_top);
        make.width.offset(80);
    }];
    
    self.confirmText = [[UITextField alloc] init];
    self.confirmText.placeholder = @"请再次输入密码";
    self.confirmText.secureTextEntry = YES;
    [self.view addSubview:self.confirmText];
    [self.confirmText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(confirmLabel.mas_right).offset(10);
        make.top.mas_equalTo(confirmVIew.mas_top);
        make.right.mas_equalTo(confirmVIew.mas_right);
        make.height.offset(40);
    }];
    
    //验证码输入框
    UIView *verificationView = [[UIView alloc] init];
    //WithFrame:CGRectMake(40, 400, 200, 40)
    [self.view addSubview:verificationView];
    [verificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.top.mas_equalTo(confirmVIew.mas_bottom).offset(+10);
        make.height.offset(40);
        make.width.offset(150);
    }];
    [self createLine:verificationView];
    
    self.verificationText = [[UITextField alloc] init];
    self.verificationText.placeholder = @"请输入验证码";
    [self.view addSubview:self.verificationText];
    [self.verificationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(verificationView.mas_right);
        make.top.mas_equalTo(confirmVIew.mas_bottom).offset(+10);
        make.left.mas_equalTo(verificationView.mas_left);
        make.bottom.mas_equalTo(verificationView.mas_bottom);
    }];
    
    //验证码按钮
    _verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verifyBtn setTintColor:[UIColor whiteColor]];
//    _verifyBtn.backgroundColor = [UIColor blueColor];
    _verifyBtn.backgroundColor = [UIColor colorWithRed:53.0/255 green:110.0/255 blue:191.0/255 alpha:1.0];
    _verifyBtn.layer.cornerRadius = 10.0;
    [_verifyBtn addTarget:self action:@selector(messageClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_verifyBtn];
    [_verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(confirmVIew.mas_bottom).offset(+10);
        make.left.mas_equalTo(verificationView.mas_right).offset(20);
        make.height.offset(40);
    }];
    //验证码label
    _timeLab = [[UILabel alloc] init];
    _timeLab.backgroundColor = [UIColor clearColor];
    _timeLab.textAlignment = NSTextAlignmentCenter;
    _timeLab.font = [UIFont systemFontOfSize:16];
    _timeLab.textColor = [UIColor whiteColor];
    _timeLab.text = @"获取验证码";
    [_verifyBtn addSubview:_timeLab];
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_verifyBtn.mas_right);
        make.top.mas_equalTo(_verifyBtn.mas_top);
        make.left.mas_equalTo(_verifyBtn.mas_left);
        make.bottom.mas_equalTo(_verifyBtn.mas_bottom);
    }];
    
    //注册
    UIButton *validationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    validationBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    [validationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [validationBtn setTitle:@"注册" forState:UIControlStateNormal];
    validationBtn.layer.cornerRadius = 8.0;
    [validationBtn addTarget:self action:@selector(validationClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:validationBtn];
    [validationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(verificationView.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    
    //定位输入框
    UIView *positioningView = [[UIView alloc] init];
    [self.view addSubview:positioningView];
    [positioningView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.top.mas_equalTo(validationBtn.mas_bottom).offset(+10);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.height.offset(40);
    }];
    [self createLine:positioningView];
    
    self.positioningText = [[UITextField alloc] init];
    self.positioningText.placeholder = @"测试定位";
    [self.view addSubview:self.positioningText];
    [self.positioningText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(positioningView.mas_right);
        make.top.mas_equalTo(positioningView.mas_top);
        make.left.mas_equalTo(positioningView.mas_left);
        make.bottom.mas_equalTo(positioningView.mas_bottom);
    }];
    
    //定位按钮
    UIButton *positioningBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    positioningBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    [positioningBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [positioningBtn setTitle:@"定位" forState:UIControlStateNormal];
    positioningBtn.layer.cornerRadius = 8.0;
    [positioningBtn addTarget:self action:@selector(positioningClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:positioningBtn];
    [positioningBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(positioningView.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![self.userText isExclusiveTouch]) {
        [self.userText resignFirstResponder];
    }
    if (![self.passwordText isExclusiveTouch]) {
        [self.passwordText resignFirstResponder];
    }
    if (![self.phoneText isExclusiveTouch]) {
        [self.phoneText resignFirstResponder];
    }
    if (![self.confirmText isExclusiveTouch]) {
        [self.confirmText resignFirstResponder];
    }
    if (![self.verificationText isExclusiveTouch]) {
        [self.verificationText resignFirstResponder];
    }
    if (![self.positioningText isExclusiveTouch]) {//定位textfile
        [self.positioningText resignFirstResponder];//收起键盘
    }
}

#pragma mark - 定位按钮
- (void)positioningClick{
//    //1.创建定位管理者
//    CLLocationManager *mgr = [[CLLocationManager alloc] init];
//    
//    //2.成为代理 CLLocationManagerDelegate
//    mgr.delegate = self;
    
    //3.开始定位
    [self.mgr startUpdatingLocation];
    
    //测试位置
    NSString *latiude = @"40.06";
    NSString *longitude = @"116.39";
    if (latiude.length == 0 || longitude.length == 0) {
        return;
    }
    
    //反地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latiude.floatValue longitude:longitude.floatValue];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(placemarks.count == 0 || error) return ;
        
        CLPlacemark *pm = [placemarks firstObject];
        LKLog(@"%@-----%@",pm.name,pm.locality);
        self.positioningText.text = pm.name;
    }];
}

/**
 *  定位到用户位置会调用该方法(非常耗电)
 *
 *  @param locations 存放定位的所有位置
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    //1.获取位置对象
    CLLocation *cllocation = [locations lastObject];
    CLLocationCoordinate2D coordinate = cllocation.coordinate;
    LKLog(@"纬度%f  经度%f",coordinate.latitude, coordinate.longitude);
    
    //取出经纬度
//    NSString *latiude = [NSString stringWithFormat:@"%f",coordinate.latitude];
//    NSString *longitude = [NSString stringWithFormat:@"%f",coordinate.longitude];
    NSString *latiude = @"114";
    NSString *longitude = @"23";
    if (latiude.length == 0 || longitude.length == 0) {
        return;
    }
    
    //反地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latiude.floatValue longitude:longitude.floatValue];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if(placemarks.count == 0 || error) return ;
        
        CLPlacemark *pm = [placemarks firstObject];
        LKLog(@"%@-----%@",pm.name,pm.locality);
        self.positioningText.text = pm.name;
    }];
    
    
    [manager stopUpdatingLocation];//停止定位
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


#pragma mark 注册方法
- (void)validationClick:(UIButton *)btn{
    //先来一个蒙板
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"请稍等";//蒙板上的字,就改这个
    [HUD show:YES];//控制手动打开
    
    NSLog(@"点击验证");
   // [self dismissViewControllerAnimated:YES completion:nil];
    
    NSMutableDictionary *registerDic = [NSMutableDictionary dictionary];
    [registerDic setObject:self.userText.text forKey:@"username"];
    [registerDic setObject:self.phoneText.text forKey:@"usertel"];
    [registerDic setObject:self.passwordText.text forKey:@"password"];
    [registerDic setObject:self.confirmText.text forKey:@"cpassword"];
    
    NSString *postUrl = @"http://www.chongdonghome.com/gr/index.php/user/register";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    [manager POST:postUrl parameters:registerDic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        LKLog(@"%@",responseObject);
        
        [HUD removeFromSuperview];//删除蒙板
        if ([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            //注册成功
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.alertViewStyle=UIAlertViewStyleDefault;
            [alert show];
            
        }else {
            [HUD removeFromSuperview];//删除蒙板
            //注册失败
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:[responseObject objectForKey:@"errMsg"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            alert.alertViewStyle=UIAlertViewStyleDefault;
            [alert show];

        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        LKLog(@"%@",error);
    }];
    
}

#pragma mark -提示框点击方法
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIAlertViewDelegate协议定义，在点击AlertView按钮时自动执行，所以如果这里再用alertView来弹出提//示，就会死循环，不停的弹AlertView
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.phoneText.text);
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


#pragma mark   短信验证方法
- (void)messageClick:(UIButton *)btn{
    LKLog(@"短信验证");
    NSString *str = _timeLab.text;
    if ([str isEqualToString:@"获取验证码"]) {
        //启动倒计时
        [self performSelector:@selector(reflashGetKeyBt:) withObject:[NSNumber numberWithInt:SEC] afterDelay:0];
    }
    
}

//倒数
- (void)reflashGetKeyBt:(NSNumber *)second
{
    if ([second integerValue] == 0)
    {
        _timeLab.text = @"获取验证码";
    }
    else
    {
        int i = [second intValue];
        _timeLab.text=[NSString stringWithFormat:@"%i秒后重发",i];
        [self performSelector:@selector(reflashGetKeyBt:) withObject:[NSNumber numberWithInt:i-1] afterDelay:1];
    }
    
}

#pragma mark - block回调
- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

@end

//
//  ChangeThePasswordViewController.m
//  LNRespectedGuest
//
//  Created by 理念科技有限公司 on 15/12/7.
//  Copyright © 2015年 Yun. All rights reserved.
//

#import "ChangeThePasswordViewController.h"

@interface ChangeThePasswordViewController ()

@property (nonatomic,strong)UITextField *originalText;
@property (nonatomic,strong)UITextField *passwordText;
@property (nonatomic,strong)UITextField *confirmText;

@end

@implementation ChangeThePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    [self createUI];
}

#pragma mark - UI
- (void)createUI{
    //姓名
    UIView *originalView = [[UIView alloc] init];
    [self.view addSubview:originalView];
    [originalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(self.view.mas_top).offset(+84);
        make.height.offset(40);
    }];
    [self createLine:originalView];
    
    UILabel *originalLabel = [[UILabel alloc] init];
    originalLabel.text = @"原密码:";
    [originalView addSubview:originalLabel];
    [originalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(originalView.mas_left).offset(10);
        make.bottom.mas_equalTo(originalView.mas_bottom);
        make.top.mas_equalTo(originalView.mas_top);
        make.width.offset(80);
    }];
    
    self.originalText = [[UITextField alloc] init];
//    self.originalText.placeholder = @"请输入姓名";
    [self.view addSubview:self.originalText];
    [self.originalText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(originalLabel.mas_right).offset(10);
        make.top.mas_equalTo(originalView.mas_top);
        make.right.mas_equalTo(originalView.mas_right);
        make.height.offset(40);
    }];
    //密码
    UIView *passwordVIew = [[UIView alloc] init];
    [self.view addSubview:passwordVIew];
    [passwordVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(originalView.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
    [self createLine:passwordVIew];
    
    UILabel *passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"新密码:";
    [passwordVIew addSubview:passwordLabel];
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordVIew.mas_left).offset(10);
        make.bottom.mas_equalTo(passwordVIew.mas_bottom);
        make.top.mas_equalTo(passwordVIew.mas_top);
        make.width.offset(80);
    }];
    
    self.passwordText = [[UITextField alloc] init];
//    self.passwordText.placeholder = @"请输入至少6位字符或数字";
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
//    self.confirmText.placeholder = @"请再次输入密码";
    self.confirmText.secureTextEntry = YES;
    [self.view addSubview:self.confirmText];
    [self.confirmText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(confirmLabel.mas_right).offset(10);
        make.top.mas_equalTo(confirmVIew.mas_top);
        make.right.mas_equalTo(confirmVIew.mas_right);
        make.height.offset(40);
    }];
    //注册
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.backgroundColor = [UIColor colorWithRed:64.0/255 green:169.0/255 blue:179.0/255 alpha:1.0];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [confirmBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    confirmBtn.layer.cornerRadius = 8.0;
    [confirmBtn addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(+50);
        make.right.mas_equalTo(self.view.mas_right).offset(-50);
        make.top.mas_equalTo(confirmVIew.mas_bottom).offset(+10);
        make.height.offset(40);
    }];
}

#pragma mark - 确认密码事件
- (void)confirmClick:(UIButton *)btn{
    LKLog(@"确认修改");
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
@end

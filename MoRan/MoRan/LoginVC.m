//
//  LoginVC.m
//  MoRan
//
//  Created by LYC on 15/11/23.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "LoginVC.h"
#import "Globe.h"
#import "netDataManager.h"
#import "RegisterVC.h"


@interface LoginVC () <UITextFieldDelegate>

@end

@implementation LoginVC

- (void)loadView {
    [super loadView];

    CGRect titleViewRect = CGRectMake(0, 0, fullSrceenWidth(), fullScreenHeight()*0.3);
    UIView *titleView = [[UIView alloc] initWithFrame:titleViewRect];
    titleView.backgroundColor = RGB(0xee, 0x7f, 0x41);
    [self.view addSubview:titleView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    imageView.frame = CGRectMake(fullSrceenWidth()/2 - 30, 60, 60, 90);
    [titleView addSubview:imageView];
    
    CGRect contentFrame = CGRectMake(0, CGRectGetHeight(titleView.frame), fullSrceenWidth(), fullScreenHeight()-CGRectGetHeight(titleView.frame));
    UIView *contectView = [[UIView alloc] initWithFrame:contentFrame];
    contectView.backgroundColor = RGB(0xeb, 0xec, 0xec);
    [self.view addSubview:contectView];
    
    
    UIFont *font = [UIFont fontWithName:@"Heiti SC" size:14];
    
    UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
    email.text = @"邮箱：";
    email.backgroundColor = contectView.backgroundColor;
    email.textColor = RGB(0x44, 0x44, 0x44);
    email.font = font;
    [contectView addSubview:email];
    
    _accountTF = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(email.frame)+5, fullSrceenWidth()-30, 30)];
    _accountTF.backgroundColor = [UIColor whiteColor];
    _accountTF.font        = font;
    _accountTF.delegate    = self;
    _accountTF.borderStyle = UITextBorderStyleNone;
    _accountTF.layer.cornerRadius = 5.0;
    _accountTF.layer.masksToBounds = YES;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _accountTF.leftView = paddingView;
    _accountTF.leftViewMode = UITextFieldViewModeAlways;
    [contectView addSubview:_accountTF];
    
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_accountTF.frame)+10, 60, 20)];
    password.text = @"密码：";
    password.backgroundColor = contectView.backgroundColor;
    password.textColor = RGB(0x44, 0x44, 0x44);
    password.font = font;
    [contectView addSubview:password];
    
    _pwdTF = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(password.frame)+5, fullSrceenWidth()-30, 30)];
    _pwdTF.backgroundColor = [UIColor whiteColor];
    _pwdTF.font        = font;
    _pwdTF.delegate    = self;
    _pwdTF.borderStyle = UITextBorderStyleNone;
    _pwdTF.layer.cornerRadius = 5.0;
    _pwdTF.layer.masksToBounds = YES;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _pwdTF.leftView = paddingView;
    _pwdTF.leftViewMode = UITextFieldViewModeAlways;
    [contectView addSubview:_pwdTF];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.frame = CGRectMake(15, CGRectGetMaxY(_pwdTF.frame)+20, fullSrceenWidth()-30, 30);
    _loginBtn.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:16];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:RGB(0xff, 0xff, 0xff) forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:RGB(0xee, 0x7f, 0x41)];
    [_loginBtn addTarget:self
              action:@selector(onTouchLoginBtn)
    forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.layer.cornerRadius = 5.0;
    _loginBtn.layer.masksToBounds = YES;
    [contectView addSubview:_loginBtn];
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.frame = CGRectMake(15, CGRectGetMaxY(_loginBtn.frame)+5, fullSrceenWidth()-30, 30);
    _registerBtn.titleLabel.font = font;
    _registerBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_registerBtn setTitle:@"注册新账号" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:RGB(0x44, 0x44, 0x44) forState:UIControlStateNormal];
    [_registerBtn setBackgroundColor:contectView.backgroundColor];
    [_registerBtn addTarget:self
                  action:@selector(onTouchRegisterBtn)
        forControlEvents:UIControlEventTouchUpInside];
    [contectView addSubview:_registerBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 * @flag 点击登录按钮响应方法
 */
- (void)onTouchLoginBtn
{
    NSString *account = _accountTF.text;
    NSString *password = _pwdTF.text;
    
    if (![self checkEmail:_accountTF.text]) {
        /* TODO:提示用户 */
        return;
    }
    
    if (![self checkPassword:_pwdTF.text]) {
        /* TODO:提示用户 */
        return;
    }
    
    [[netDataManager manager] loginWithEmail:account password:password gid:GID];
}

/**
 * @flag 点击注册按钮响应方法
 */
- (void)onTouchRegisterBtn
{
    RegisterVC *registerVC = [RegisterVC new];
    [self presentViewController:registerVC animated:YES completion:^{}];
}

#pragma mark - textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _accountTF) {
        if (![self checkEmail:_accountTF.text]) {
            /* TODO:提示用户 */
        }
    }
    else if (textField == _pwdTF) {
        if (![self checkPassword:_pwdTF.text]) {
            /* TODO:提示用户 */
        }
    }
}

- (BOOL)checkEmail:(NSString *)email
{
    /* TODO:检测Email是否合法 */
    return YES;
}

- (BOOL)checkPassword:(NSString *)pwd
{
    /* TODO:检测Email是否合法 */
    return YES;
}

@end

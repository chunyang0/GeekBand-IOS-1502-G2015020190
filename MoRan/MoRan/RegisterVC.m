//
//  RegisterVC.m
//  MoRan
//
//  Created by LYC on 15/12/16.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import "RegisterVC.h"
#import "Globe.h"
#import "netDataManager.h"

@interface RegisterVC () <UITextFieldDelegate>

@end

@implementation RegisterVC

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
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_accountTF.frame)+10, 60, 20)];
    name.text = @"昵称：";
    name.backgroundColor = contectView.backgroundColor;
    name.textColor = RGB(0x44, 0x44, 0x44);
    name.font = font;
    [contectView addSubview:name];
    
    _nameTF = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(name.frame)+5, fullSrceenWidth()-30, 30)];
    _nameTF.backgroundColor = [UIColor whiteColor];
    _nameTF.font        = font;
    _nameTF.delegate    = self;
    _nameTF.borderStyle = UITextBorderStyleNone;
    _nameTF.layer.cornerRadius = 5.0;
    _nameTF.layer.masksToBounds = YES;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _nameTF.leftView = paddingView;
    _nameTF.leftViewMode = UITextFieldViewModeAlways;
    [contectView addSubview:_nameTF];
    
    UILabel *password = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_nameTF.frame)+10, 60, 20)];
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
    
    UILabel *secondPwd = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_pwdTF.frame)+10, 100, 20)];
    secondPwd.text = @"重复密码：";
    secondPwd.backgroundColor = contectView.backgroundColor;
    secondPwd.textColor = RGB(0x44, 0x44, 0x44);
    secondPwd.font = font;
    [contectView addSubview:secondPwd];
    
    _pwdSecondTF = [[UITextField alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(secondPwd.frame)+5, fullSrceenWidth()-30, 30)];
    _pwdSecondTF.backgroundColor = [UIColor whiteColor];
    _pwdSecondTF.font        = font;
    _pwdSecondTF.delegate    = self;
    _pwdSecondTF.borderStyle = UITextBorderStyleNone;
    _pwdSecondTF.layer.cornerRadius = 5.0;
    _pwdSecondTF.layer.masksToBounds = YES;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    _pwdSecondTF.leftView = paddingView;
    _pwdSecondTF.leftViewMode = UITextFieldViewModeAlways;
    [contectView addSubview:_pwdSecondTF];
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerBtn.frame = CGRectMake(15, CGRectGetMaxY(_pwdSecondTF.frame)+20, fullSrceenWidth()-30, 30);
    _registerBtn.titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:16];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:RGB(0xff, 0xff, 0xff) forState:UIControlStateNormal];
    [_registerBtn setBackgroundColor:RGB(0xee, 0x7f, 0x41)];
    [_registerBtn addTarget:self
                     action:@selector(onTouchLoginBtn)
           forControlEvents:UIControlEventTouchUpInside];
    _registerBtn.layer.cornerRadius = 5.0;
    _registerBtn.layer.masksToBounds = YES;
    [contectView addSubview:_registerBtn];
    
    _backToLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backToLoginBtn.frame = CGRectMake(15, CGRectGetMaxY(_registerBtn.frame)+5, fullSrceenWidth()-30, 30);
    _backToLoginBtn.titleLabel.font = font;
    _backToLoginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_backToLoginBtn setTitle:@"返回登录" forState:UIControlStateNormal];
    [_backToLoginBtn setTitleColor:RGB(0x44, 0x44, 0x44) forState:UIControlStateNormal];
    [_backToLoginBtn setBackgroundColor:contectView.backgroundColor];
    [_backToLoginBtn addTarget:self
                        action:@selector(closeView)
              forControlEvents:UIControlEventTouchUpInside];
    [contectView addSubview:_backToLoginBtn];
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
    NSString *name = _nameTF.text;
    NSString *password = _pwdTF.text;
    
    [[netDataManager manager] registerWithName:name password:password email:account gid:GID];
}

/**
 * @flag 点击注册按钮响应方法
 */
- (void)closeView
{
    [self dismissViewControllerAnimated:YES completion:^{ }];
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
        
    }
}

@end

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


@interface LoginVC ()

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
    
    //NSArray *test = [UIFont familyNames];
    
    UILabel *email = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
    email.text = @"邮箱：";
    email.backgroundColor = contectView.backgroundColor;
    email.textColor = RGB(0x44, 0x44, 0x44);
    email.font = [UIFont fontWithName:@"Heiti SC" size:14];
    [contectView addSubview:email];
    
    /* TODO:设置属性 */
    _accountTF = [[UITextField alloc] initWithFrame:CGRectZero];
    
    /* TEST CODE */
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

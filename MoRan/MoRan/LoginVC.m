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
    /* titleView色值 */
    CGRect titleViewRect = CGRectMake(0, 0, fullSrceenWidth(), 348);
    UIView *titleView = [[UIView alloc] initWithFrame:titleViewRect];
    titleView.backgroundColor = RGB(0xee, 0x7f, 0x41);
    [self.view addSubview:titleView];
    
    CGRect contentFrame = CGRectMake(0, 348, fullSrceenWidth(), fullScreenHeight()-348);
    UIView *contectView = [[UIView alloc] initWithFrame:contentFrame];
    contectView.backgroundColor = RGB(0xeb, 0xec, 0xec);
    [self.view addSubview:contectView];
    
    /* TODO:设置属性 */
    _accountTF = [[UITextField alloc] initWithFrame:CGRectZero];
    
    /* TEST CODE */
//    [[netDataManager manager] registerWithName:@"quxianglan" password:@"123456" email:@"lycliyicong@163.com" gid:@"1234567"];
    
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

//
//  RegisterVC.h
//  MoRan
//
//  Created by LYC on 15/12/16.
//  Copyright © 2015年 GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController

@property (nonatomic) UITextField *accountTF;
@property (nonatomic) UITextField *nameTF;
@property (nonatomic) UITextField *pwdTF;
@property (nonatomic) UITextField *pwdSecondTF;
@property (nonatomic) UIButton    *registerBtn;
@property (nonatomic) UIButton    *backToLoginBtn;

@end

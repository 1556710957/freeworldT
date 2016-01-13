//
//  LoginVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/4.
//  Copyright © 2016年 One. All rights reserved.
//

#import "LoginVC.h"
#import "Constants.h"

@implementation LoginVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    //    self.view.backgroundColor = colorWithRGB(0x181562, 1.0);
    
    
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, mainW, mainH-20)];
    bgImage.backgroundColor = colorWithRGB(0x181562, 1.0);
    [self.view addSubview:bgImage];
    
    //用户名
    UIView *nameView = [[UIView alloc]initWithFrame:CGRectMake(50, mainH/3, mainW-100, 50)];
    nameView.layer.cornerRadius = 8;
    nameView.layer.borderWidth = 1;
    nameView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:nameView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    nameLabel.text = @"用户名:";
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor whiteColor];
    [nameView addSubview:nameLabel];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), 10, 100, 30)];
    [nameView addSubview:_nameTextField];
    
    //密码
    UIView *pwdView = [[UIView alloc]initWithFrame:CGRectMake(50,CGRectGetMaxY(nameView.frame)+20, mainW-100, 50)];
    pwdView.layer.cornerRadius = 8;
    pwdView.layer.borderWidth = 1;
    pwdView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:pwdView];
    
    UILabel *pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    pwdLabel.text = @"密    码:";
    pwdLabel.font = [UIFont systemFontOfSize:15];
    pwdLabel.textColor = [UIColor whiteColor];
    [pwdView addSubview:pwdLabel];
    
    _pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), 10, 100, 30)];
    [pwdView addSubview:_pwdTextField];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    loginBtn.alpha = 0.6;
    loginBtn.layer.cornerRadius = 8;
    loginBtn.tag = 1;
    [loginBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake(50,CGRectGetMaxY(pwdView.frame)+20, mainW-100, 50);
    [loginBtn setTitle:@"确 认 登 陆" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    loginBtn.backgroundColor = colorWithRGB(0x2198da, 1.0);
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];

    
}

-(void)btnClick
{
    NSLog(@"点击了登陆");
}

@end

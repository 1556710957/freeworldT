
//
//  StartLoginVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/4.
//  Copyright © 2016年 One. All rights reserved.
//

#import "StartLoginVC.h"
#import "Constants.h"
#import "LoginVC.h"
#import "RegisterVC.h"

@implementation StartLoginVC

-(void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = colorWithRGB(0x181562, 1.0);
    
    
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, mainW, mainH-20)];
    bgImage.backgroundColor = colorWithRGB(0x181562, 1.0);
    [self.view addSubview:bgImage];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.alpha = 0.6;
    loginBtn.layer.cornerRadius = 5;
    loginBtn.tag = 1;
    [loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake((mainW-240)/2, mainH/3+50, 240, 40);
    [loginBtn setTitle:@"立 即 登 陆" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    loginBtn.backgroundColor = [UIColor whiteColor];
    [loginBtn setTitleColor:colorWithRGB(0x888888, 1.0) forState:UIControlStateNormal];
    
    [self.view addSubview:loginBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.layer.cornerRadius = 5;
    registerBtn.alpha = 0.6;
    registerBtn.tag = 2;
    [registerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(loginBtn.frame)+15, 240, 40);
    [registerBtn setTitle:@"马 上 注 册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    registerBtn.backgroundColor = colorWithRGB(0x2198da, 1.0);
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];

    
    
}

-(void)btnClick:(UIButton *)sender
{
    if (sender.tag ==1) {
        NSLog(@"点击了登陆");
        LoginVC *login =  [[LoginVC alloc]init];
        login.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:login animated:YES];
    }if (sender.tag ==2) {
        NSLog(@"点击了注册");
        
        RegisterVC *registerVC =  [[RegisterVC alloc]init];
        registerVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:registerVC animated:YES];
    }

}





@end

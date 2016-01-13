//
//  PayofMarginVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "PayofMarginVC.h"
#import "Constants.h"

@implementation PayofMarginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    //    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"支付保证金";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UILabel *amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, mainW, 40)];
    amountLabel.text = @"请输入任务保证金额";
    amountLabel.textAlignment = NSTextAlignmentCenter;
    amountLabel.textColor = colorWithRGB(0x666666, 1.0);
    amountLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:amountLabel];
    
    _amountTextField = [[UITextField alloc]initWithFrame:CGRectMake((mainW-240)/2,CGRectGetMaxY(amountLabel.frame),240, 40)];
    _amountTextField.delegate = self;
    _amountTextField.backgroundColor = [UIColor whiteColor];
    _amountTextField.layer.cornerRadius = 5;
    _amountTextField.textColor = [UIColor redColor];
    _amountTextField.placeholder = @"  请输入金额";
    [_amountTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_amountTextField];
    
    for (int i = 0; i<3; i++) {
        UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contentBtn.frame = CGRectMake(0,i*50+CGRectGetMaxY(_amountTextField.frame)+20, mainW, 50);
        contentBtn.backgroundColor = [UIColor whiteColor];
        contentBtn.tag = i;
        [contentBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:contentBtn];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, mainW, 1)];
        line.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        [contentBtn addSubview:line];
        
        UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 40, 40)];
        leftImage.backgroundColor = [UIColor redColor];
        [contentBtn addSubview:leftImage];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame)+10, 10, mainW/3, 30)];
        contentLabel.textColor = colorWithRGB(0x666666, 1.0);
        contentLabel.font = [UIFont systemFontOfSize:15];
        [contentBtn addSubview:contentLabel];
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
        arrowImage.backgroundColor = [UIColor blueColor];
        [contentBtn addSubview:arrowImage];
        
        if (i==0) {
            contentLabel.text = @"支付宝";
        }if (i==1) {
            contentLabel.text = @"微信支付";
        }
        if (i==2) {
            contentLabel.text = @"钱包余额";
        }
    }
    
    //上传保证金
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    payBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    payBtn.layer.cornerRadius = 5;
    [payBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    payBtn.frame = CGRectMake((mainW-240)/2,CGRectGetMaxY(_amountTextField.frame)+50*3+50,240, 40);
    [self.view addSubview:payBtn];


}

-(void)payBtnClick
{
    NSLog(@"去支付");
}

@end

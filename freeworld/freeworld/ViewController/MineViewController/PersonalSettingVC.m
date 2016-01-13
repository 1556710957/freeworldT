//
//  PersonalSettingVC.m
//  freeworld
//
//  Created by 冯春 on 16/1/13.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "PersonalSettingVC.h"
#import "Constants.h"
#import "LoginVC.h"

@implementation PersonalSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 44)];
    topView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:topView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 44)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"设置";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [topView addSubview:title];
    
    
    //常见问题
    UIView *commentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), mainW, 50)];
    commentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:commentView];
    
    UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, mainW-20, 30)];
    commentLabel.text = @"常见问题";
    commentLabel.textColor = colorWithRGB(0x666666, 1.0);
    commentLabel.font = [UIFont systemFontOfSize:15];
    [commentView addSubview:commentLabel];
    
    
    //新消息提醒
    UIView *messageView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(commentView.frame)+1, mainW, 50)];
    messageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:messageView];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, mainW/3, 30)];
    messageLabel.text = @"新消息提醒";
    messageLabel.textColor = colorWithRGB(0x666666, 1.0);
    messageLabel.font = [UIFont systemFontOfSize:15];
    [messageView addSubview:messageLabel];
    
    UISwitch *switchOne = [[UISwitch alloc]initWithFrame:CGRectMake(mainW-80, 15, 40, 20)];
    [messageView addSubview:switchOne];
    
    //声音开关
    UIView *voiceView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(messageView.frame)+1, mainW, 50)];
    voiceView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:voiceView];
    
    UILabel *voiceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, mainW/3, 30)];
    voiceLabel.text = @"声音开关";
    voiceLabel.textColor = colorWithRGB(0x666666, 1.0);
    voiceLabel.font = [UIFont systemFontOfSize:15];
    [voiceView addSubview:voiceLabel];
    
    UISwitch *switchTwo = [[UISwitch alloc]initWithFrame:CGRectMake(mainW-80, 15, 40, 20)];
    [voiceView addSubview:switchTwo];
    
    
    //震动开关
    UIView *shakeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(voiceView.frame)+1, mainW, 50)];
    shakeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shakeView];
    
    UILabel *shakeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, mainW/3, 30)];
    shakeLabel.text = @"震动开关";
    shakeLabel.textColor = colorWithRGB(0x666666, 1.0);
    shakeLabel.font = [UIFont systemFontOfSize:15];
    [shakeView addSubview:shakeLabel];
    
    UISwitch *switchThree = [[UISwitch alloc]initWithFrame:CGRectMake(mainW-80, 15, 40, 20)];
    [shakeView addSubview:switchThree];
    
    //勿扰模式
    UIView *modelView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(shakeView.frame)+1, mainW, 50)];
    modelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:modelView];
    
    UILabel *modelLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, mainW/3, 30)];
    modelLabel.text = @"勿扰模式";
    modelLabel.textColor = colorWithRGB(0x666666, 1.0);
    modelLabel.font = [UIFont systemFontOfSize:15];
    [modelView addSubview:modelLabel];
    
    UISwitch *switchFour = [[UISwitch alloc]initWithFrame:CGRectMake(mainW-80, 15, 40, 20)];
    [modelView addSubview:switchFour];
    
    //切换账号
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.layer.cornerRadius = 8;
    changeBtn.tag = 1;
    [changeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    changeBtn.frame = CGRectMake(50,CGRectGetMaxY(modelView.frame)+20, mainW-100, 40);
    [changeBtn setTitle:@"切 换 账 号" forState:UIControlStateNormal];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    changeBtn.backgroundColor = colorWithRGB(0x35bd99, 1.0);
    [changeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:changeBtn];
    
    //退出账号
    UIButton *existBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    existBtn.layer.cornerRadius = 8;
    existBtn.tag = 2;
    [existBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    existBtn.frame = CGRectMake(50,CGRectGetMaxY(changeBtn.frame)+20, mainW-100, 40);
    [existBtn setTitle:@"退 出 账 号" forState:UIControlStateNormal];
    existBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    existBtn.backgroundColor = colorWithRGB(0xf36c68, 1.0);
    [existBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:existBtn];



    
}

-(void)btnClick:(UIButton *)sender
{
    if ( sender.tag ==1) {
        LoginVC *login = [[LoginVC alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }if (sender.tag==2) {
        
    }
}


@end

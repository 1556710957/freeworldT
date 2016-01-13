//
//  PostPictureVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/6.
//  Copyright © 2016年 One. All rights reserved.
//

#import "PostPictureVC.h"
#import "Constants.h"

@implementation PostPictureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 44)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 44)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
//    _titleLabel.text = @"上传身份证";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor whiteColor];
    [BgView addSubview:_titleLabel];
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [submitBtn setTitle:@"上传" forState:UIControlStateNormal];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitBtn.frame = CGRectMake(mainW-50,0,50, 44);
    [BgView addSubview:submitBtn];
    
    
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn addTarget:self action:@selector(cameraBtn) forControlEvents:UIControlEventTouchUpInside];
    cameraBtn.backgroundColor = colorWithRGB(0x3d3c41, 1.0);
    [cameraBtn setTitle:@"拍摄照片" forState:UIControlStateNormal];
    cameraBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cameraBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cameraBtn.frame = CGRectMake(0,CGRectGetMaxY(BgView.frame),mainW/3, mainW/3);
    [self.view addSubview:cameraBtn];
    

    
}

-(void)btnClick
{
    NSLog(@"点击了提交");
}
-(void)cameraBtn
{
    NSLog(@"点击了相机");
}
@end

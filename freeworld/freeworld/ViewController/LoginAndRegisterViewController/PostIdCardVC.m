//
//  PostIdCardVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/5.
//  Copyright © 2016年 One. All rights reserved.
//

#import "PostIdCardVC.h"
#import "Constants.h"
#import "PostPictureVC.h"

@implementation PostIdCardVC

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
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, mainW, 44)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"上传身份证";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOne addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btnOne.frame = CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, 50);
    btnOne.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnOne];
    
    UILabel *addLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 20, 20)];
    addLabel.text = @"+";
    addLabel.textAlignment = NSTextAlignmentCenter;
    addLabel.layer.cornerRadius = 10;
    addLabel.layer.borderWidth = 1;
    addLabel.layer.borderColor = colorWithRGB(0x1caceb, 1.0).CGColor;
    addLabel.font = [UIFont systemFontOfSize:15];
    addLabel.textColor = colorWithRGB(0x1caceb, 1.0);
    [btnOne addSubview:addLabel];
    
    
    UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, mainW/3, 30)];
    labelOne.text = @"上传身份证正面";
    labelOne.font = [UIFont systemFontOfSize:15];
    labelOne.textColor = colorWithRGB(0x1caceb, 1.0);
    [btnOne addSubview:labelOne];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTwo addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btnTwo.frame = CGRectMake(0, CGRectGetMaxY(btnOne.frame)+1, mainW, 50);
    btnTwo.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnTwo];
    
    UILabel *addLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 20, 20)];
    addLabel1.text = @"+";
    addLabel1.textAlignment = NSTextAlignmentCenter;
    addLabel1.layer.cornerRadius = 10;
    addLabel1.layer.borderWidth = 1;
    addLabel1.layer.borderColor = colorWithRGB(0x888888, 1.0).CGColor;
    addLabel1.font = [UIFont systemFontOfSize:15];
    addLabel1.textColor = colorWithRGB(0x888888, 1.0);
    [btnTwo addSubview:addLabel1];
    
    UILabel *labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, mainW/3, 30)];
    labelTwo.text = @"上传身份证反面";
    labelTwo.font = [UIFont systemFontOfSize:15];
    labelTwo.textColor = colorWithRGB(0x888888, 1.0);
    [btnTwo addSubview:labelTwo];
}

-(void)btnClick
{
//    PostPictureVC *pictureVC = [[PostPictureVC alloc]init];
//    pictureVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:pictureVC animated:YES];
    
    NSUInteger sourceType = 0;
    sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // 跳转到相机或相册页面
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.allowsEditing = YES;
    
    imagePickerController.sourceType = sourceType;
  
    [self presentViewController:imagePickerController animated:YES completion:^{}];

}

@end

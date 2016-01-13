//
//  DialogueWindowVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/7.
//  Copyright © 2016年 One. All rights reserved.
//

#import "DialogueWindowVC.h"
#import "Constants.h"
#import "CollectVC.h"
#import "PostPictureVC.h"

@implementation DialogueWindowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"哈哈哈哈公司";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.selected = NO;
    rightBtn.frame = CGRectMake(mainW-50, 20, 40, 40);
//    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    [self.view addSubview:rightBtn];
    
    
    UIView *bottomView = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomView.frame = CGRectMake(0, mainH-120, mainW, 120);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    _dialogueTF = [[UITextField alloc]initWithFrame:CGRectMake(50, 5, mainW-100, 30)];
    _dialogueTF.backgroundColor = [UIColor clearColor];
    [bottomView addSubview:_dialogueTF];
    
    UIButton *voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    voiceBtn.frame = CGRectMake(10, 10, 25, 25);
    voiceBtn.layer.cornerRadius = 25/2;
    voiceBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    [voiceBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    voiceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [voiceBtn setTitle:@"+" forState:UIControlStateNormal];
    [bottomView addSubview:voiceBtn];

    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(mainW-40, 10, 25, 25);
    addBtn.layer.cornerRadius = 25/2;
    addBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [bottomView addSubview:addBtn];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 29, mainW-100, 1)];
    line.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [_dialogueTF addSubview:line];
    
    
    for (int i = 0; i<5; i++) {
        UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomBtn.tag = i;
        bottomBtn.frame = CGRectMake(10+i*10+i*(mainW-60)/5, 40, (mainW-60)/5, (mainW-60)/5);
        [bottomBtn addTarget:self action:@selector(bottomBtn:) forControlEvents:UIControlEventTouchUpInside];
        bottomBtn.backgroundColor = [UIColor redColor];
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [bottomView addSubview:bottomBtn];
        
        if (i==0) {
            [bottomBtn setTitle:@"图片" forState:UIControlStateNormal];
        }if (i==1) {
            [bottomBtn setTitle:@"文件" forState:UIControlStateNormal];
        }
        if (i==2) {
            [bottomBtn setTitle:@"收藏" forState:UIControlStateNormal];
        }
        if (i==3) {
            [bottomBtn setTitle:@"定位" forState:UIControlStateNormal];
        }
        if (i==4) {
            [bottomBtn setTitle:@"名片" forState:UIControlStateNormal];
        }

    }

}

-(void)addBtnClick
{
    NSLog(@"点击了加号");
}


-(void)bottomBtn:(UIButton *)sender
{
    if (sender.tag == 0) {
        NSLog(@"图片");
        PostPictureVC *postPic = [[PostPictureVC alloc]init];
        postPic.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:postPic animated:YES];
        
    }if (sender.tag == 1) {
        NSLog(@"文件");
    }
    if (sender.tag == 2) {
        NSLog(@"收藏");
        CollectVC *collect = [[CollectVC alloc]init];
        collect.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:collect animated:YES];
    }
    if (sender.tag == 3) {
        NSLog(@"定位");
    }
    if (sender.tag == 4) {
        NSLog(@"名片");
    }

}
@end

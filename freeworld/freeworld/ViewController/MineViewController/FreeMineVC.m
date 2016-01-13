//
//  FreeMineVC.m
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import "FreeMineVC.h"
#import "Constants.h"
#import "StartLoginVC.h"
#import "CollectVC.h"
#import "MyPublishVC.h"
#import "EditDataVC.h"
#import "MyFriendVC.h"
#import "VirtualCompanyVC.h"
#import "ScanMineVC.h"
#import "FamilyVC.h"
#import "MyWalletVC.h"
#import "CommentForMeVC.h"
#import "PersonalSettingVC.h"

@interface FreeMineVC ()

@end

@implementation FreeMineVC

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]init];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 44)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"自己";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UILabel *lineOne = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame), mainW, 2)];
    lineOne.backgroundColor = colorWithRGB(0x25263a, 1.0);
    [BgView addSubview:lineOne];
    
    
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, 0, 100, 44);
    [leftBtn setTitle:@"登陆注册" forState:UIControlStateNormal];
    leftBtn.backgroundColor = [UIColor purpleColor];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [BgView addSubview:leftBtn];
    
    
    //头像
    _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(title.frame)+15, 70, 70)];
    _photoImage.backgroundColor = [UIColor purpleColor];
    _photoImage.layer.cornerRadius = 35;
    [BgView addSubview:_photoImage];
    
    _companyName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photoImage.frame)+10, CGRectGetMaxY(title.frame)+15, mainW/3, 30)];
    _companyName.text = @"公司名称";
    _companyName.textColor = [UIColor whiteColor];
    _companyName.font = [UIFont systemFontOfSize:15];
    [BgView addSubview:_companyName];
    
    _btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOne.frame = CGRectMake(CGRectGetMaxX(_companyName.frame)+10, CGRectGetMaxY(title.frame)+20, 20, 20);
    _btnOne.layer.cornerRadius = 10;
    [_btnOne setImage:[UIImage imageNamed:@"34"] forState:UIControlStateNormal];
    [BgView addSubview:_btnOne];
    
    _btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnTwo.frame = CGRectMake(CGRectGetMaxX(_btnOne.frame)+10,CGRectGetMaxY(title.frame)+20, 20, 20);
    _btnTwo.layer.cornerRadius = 10;
    [_btnTwo setImage:[UIImage imageNamed:@"35"] forState:UIControlStateNormal];
    [BgView addSubview:_btnTwo];
    
    
    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photoImage.frame)+10, CGRectGetMaxY(_companyName.frame), mainW*2/3, 30)];
    _numberLabel.text = @"[自由地球号]987654321";
    _numberLabel.textColor = [UIColor whiteColor];
    _numberLabel.font = [UIFont systemFontOfSize:13];
    [BgView addSubview:_numberLabel];
    
    UIImageView *editImg = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-60, CGRectGetMaxY(lineOne.frame)+10, 20, 20)];
    editImg.backgroundColor = [UIColor redColor];
    [BgView addSubview:editImg];
    
    UILabel *editLabel = [[UILabel alloc]initWithFrame:CGRectMake(mainW-80, CGRectGetMaxY(editImg.frame)+10, 80, 20)];
    editLabel.text = @"修改资料";
    editLabel.font = [UIFont systemFontOfSize:13];
    editLabel.textColor = colorWithRGB(0x138dce, 1.0);
    [BgView addSubview:editLabel];
    
    UIControl *controlClick = [[UIControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lineOne.frame), mainW, 90)];
//    controlClick.backgroundColor = [UIColor redColor];
    [controlClick addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
    [BgView addSubview:controlClick];

    
    UILabel *lineTwo = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_photoImage.frame)+10, mainW, 2)];
    lineTwo.backgroundColor = colorWithRGB(0x25263a, 1.0);
    [BgView addSubview:lineTwo];
    BgView.frame = CGRectMake(0, 20, mainW, CGRectGetMaxY(lineTwo.frame)+mainW/3);
    
    for (int i = 0; i<3; i++) {
        
        UIButton *threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        threeBtn.tag = i;
        threeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [threeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        threeBtn.frame = CGRectMake(mainW/3*i, CGRectGetMaxY(lineTwo.frame), mainW/3, mainW/3);
        [threeBtn addTarget:self action:@selector(threeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [threeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 40, 0)];
        [BgView addSubview:threeBtn];
        
        UILabel *classLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,mainW/3-50, mainW/3, 30)];
        classLabel.textAlignment = NSTextAlignmentCenter;
        classLabel.font = [UIFont systemFontOfSize:15];
        classLabel.textColor = [UIColor whiteColor];
        [threeBtn addSubview:classLabel];
        
        if (i==0) {
//            [threeBtn setTitle:@"我的好友" forState:UIControlStateNormal];
            classLabel.text = @"我的好友";
            [threeBtn setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
        }if (i==1) {
//            [threeBtn setTitle:@"虚拟公司" forState:UIControlStateNormal];
            classLabel.text = @"虚拟公司";
            [threeBtn setImage:[UIImage imageNamed:@"29"] forState:UIControlStateNormal];
        }
        if (i==2) {
//            [threeBtn setTitle:@"谁看过我" forState:UIControlStateNormal];
            classLabel.text = @"谁看过我";
            [threeBtn setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
        }

        
        if (i<2) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(mainW/3-2,0, 2,mainW/3)];
            line.backgroundColor = colorWithRGB(0x25263a, 1.0);
            [threeBtn addSubview:line];

        }
        
    }
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, mainH-CGRectGetMaxY(BgView.frame)-50)];
//    _scrollView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [self.view addSubview:_scrollView];

    
    for (int i = 0; i<7; i++) {
        UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contentBtn.frame = CGRectMake(0,i*50, mainW, 50);
        //        contentBtn.backgroundColor = [UIColor yellowColor];
        contentBtn.tag = i;
        [contentBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:contentBtn];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, mainW, 1)];
        line.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        [contentBtn addSubview:line];
        
        UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,10, 30, 30)];
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
            contentLabel.text = @"我的相册";
        }if (i==1) {
            contentLabel.text = @"我的钱包";
        }
        if (i==2) {
            contentLabel.text = @"族谱";
        }
        if (i==3) {
            contentLabel.text = @"发布任务";
        }if (i==4) {
            contentLabel.text = @"收藏";
        }if (i==5) {
            contentLabel.text = @"别人对我的评论";
        }if (i==6) {
            contentLabel.text = @"个人设置";
        }

    }
    _scrollView.contentSize = CGSizeMake(0, 360);
//    float abc= CGRectGetMaxY(lineTwo.frame)-CGRectGetMaxY(lineOne.frame);
    NSLog(@"距离==%f",mainW/3);

    
}


-(void)threeBtnClick:(UIButton *)sender
{
    if (sender.tag ==0) {
        MyFriendVC *friend = [[MyFriendVC alloc]init];
        friend.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:friend animated:YES];
    }    if (sender.tag ==1) {
        VirtualCompanyVC *virtual = [[VirtualCompanyVC alloc]init];
        virtual.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:virtual animated:YES];
        
    }    if (sender.tag ==2) {
        ScanMineVC *scan = [[ScanMineVC alloc]init];
        scan.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scan animated:YES];
        
    }
}


-(void)btnClick:(UIButton *)sender
{
    if (sender.tag ==0) {
        NSLog(@"我的相册");
    }if (sender.tag ==1) {
        NSLog(@"我的钱包");
        MyWalletVC *wallet = [[MyWalletVC alloc]init];
        wallet.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wallet animated:YES];

    }if (sender.tag ==2) {
        NSLog(@"族谱");
        FamilyVC *family = [[FamilyVC alloc]init];
        family.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:family animated:YES];

    }if (sender.tag ==3) {
        NSLog(@"发布任务");
        MyPublishVC *publish = [[MyPublishVC alloc]init];
        publish.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:publish animated:YES];
    }if (sender.tag ==4) {
        NSLog(@"收藏");
        CollectVC *collect = [[CollectVC alloc]init];
        collect.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:collect animated:YES];
    }if (sender.tag ==5) {
        NSLog(@"别人对我的评价");
        
        CommentForMeVC *comment = [[CommentForMeVC alloc]init];
        comment.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:comment animated:YES];
        
    }if (sender.tag ==6) {
        NSLog(@"个人设置");
        PersonalSettingVC *setting = [[PersonalSettingVC alloc]init];
        setting.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setting animated:YES];
    }
}

-(void)leftBtnClick
{
    StartLoginVC *start = [[StartLoginVC alloc]init];
    start.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:start animated:YES];
}

-(void)controlClick
{
    EditDataVC *edit = [[EditDataVC alloc]init];
    edit.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:edit animated:YES];

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

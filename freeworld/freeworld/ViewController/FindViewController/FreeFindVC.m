//
//  FreeFindVC.m
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import "FreeFindVC.h"
#import "Constants.h"

@interface FreeFindVC ()

@end

@implementation FreeFindVC

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"发现";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(mainW-80, 20, 40, 40);
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:addBtn];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(mainW-40, 30, 25, 25);
    [searchBtn setImage:[UIImage imageNamed:@"40"] forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];
    
    
    UIView *scrollView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, 140)];
    scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:scrollView];
    
    for (int i = 0; i<4; i++) {
        UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        contentBtn.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame)+i*50, mainW, 50);
//        contentBtn.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:contentBtn];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, mainW, 1)];
        line.backgroundColor = [UIColor lightGrayColor];
        [contentBtn addSubview:line];
        
        UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
//        leftImage.backgroundColor = [UIColor redColor];
        [contentBtn addSubview:leftImage];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame)+10, 10, mainW/3, 30)];
        contentLabel.textColor = colorWithRGB(0x666666, 1.0);
        contentLabel.font = [UIFont systemFontOfSize:15];
        [contentBtn addSubview:contentLabel];
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
        arrowImage.image = [UIImage imageNamed:@"4"];
        arrowImage.backgroundColor = [UIColor lightGrayColor];
        [contentBtn addSubview:arrowImage];
       
        if (i==0) {
            contentLabel.text = @"动态发布";
            leftImage.image = [UIImage imageNamed:@"19"];
        }if (i==1) {
            contentLabel.text = @"物质交换";
            leftImage.image = [UIImage imageNamed:@"19"];
        }
        if (i==2) {
            contentLabel.text = @"自由人问答";
            leftImage.image = [UIImage imageNamed:@"14"];
        }
        if (i==3) {
            contentLabel.text = @"通讯录";
            leftImage.image = [UIImage imageNamed:@"13"];
        }

    }

    
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

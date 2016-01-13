//
//  CommentForMeVC.m
//  freeworld
//
//  Created by 冯春 on 16/1/13.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "CommentForMeVC.h"
#import "Constants.h"

@implementation CommentForMeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 44)];
    topView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:topView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 44)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"别人对我的评价";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [topView addSubview:title];
}


@end

//
//  BaseVC.m
//  freeworld
//
//  Created by 冯春 on 16/1/11.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "BaseVC.h"

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}



- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        
        //只有在二级页面生效
        if ([self.navigationController.viewControllers count] !=1)
        {
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
            
            self.navigationController.navigationBarHidden = YES;
            UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [leftButton setFrame:CGRectMake(5, 20, 60, 44)];
            leftButton.tag = 0;
            [leftButton addTarget:self action:@selector(btnBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [leftButton setTitle:@"返回" forState:UIControlStateNormal];
            leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
            leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            //            [leftButton setTitleColor:mainTextColor forState:UIControlStateNormal];
            [leftButton setImage:[UIImage imageNamed:@"icon-backto"] forState:UIControlStateNormal];
            [self.view addSubview:leftButton];
            
        }
    }
    
}
- (void) btnBackButtonClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end

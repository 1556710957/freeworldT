//
//  MainVC.m
//  freeworld
//
//  Created by 冯春 on 16/1/11.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "MainVC.h"
#import "FreeHomeVC.h"
#import "FreeFindVC.h"
#import "FreeMessageVC.h"
#import "FreeMineVC.h"
#import "Constants.h"



@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FreeHomeVC *tab3 = [[FreeHomeVC alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController: tab3];
    UITabBarItem *time3 = [[UITabBarItem alloc] initWithTitle: @"自由人" image: [UIImage imageNamed:@"tab3"] tag: 1];
    nav3.tabBarItem = time3;
    
    
    FreeFindVC *tab1 = [[FreeFindVC alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController: tab1];
    UITabBarItem *time = [[UITabBarItem alloc] initWithTitle: @"发现" image: [UIImage imageNamed:@"tab1"] tag: 2];
    nav1.tabBarItem = time;
    
    
    
    FreeMessageVC *tab4 = [[FreeMessageVC alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController: tab4];
    UITabBarItem *time4 = [[UITabBarItem alloc] initWithTitle: @"消息" image: [UIImage imageNamed:@"tab4"] tag: 3];
    nav4.tabBarItem = time4;
    
    FreeMineVC *tab5 = [[FreeMineVC alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController: tab5];
    UITabBarItem *time5 = [[UITabBarItem alloc] initWithTitle: @"自己" image: [UIImage imageNamed:@"tab5"] tag: 4];
    nav5.tabBarItem = time5;
    
    //    [nav1.navigationBar setBackgroundImage:[Tooles imageWithColor:[UIColor colorWithRed:(77/255.0) green:(185 / 255.0) blue:(77 / 255.0) alpha:1]] forBarMetrics:UIBarMetricsDefault];
    //
    //
    //
    //    [nav3.navigationBar setBackgroundImage:[Tooles imageWithColor:[UIColor colorWithRed:(77/255.0) green:(185 / 255.0) blue:(77 / 255.0) alpha:1]] forBarMetrics:UIBarMetricsDefault];
    //
    //    [nav4.navigationBar setBackgroundImage:[Tooles imageWithColor:[UIColor colorWithRed:(77/255.0) green:(185 / 255.0) blue:(77 / 255.0) alpha:1]] forBarMetrics:UIBarMetricsDefault];
    //
    //    [nav5.navigationBar setBackgroundImage:[Tooles imageWithColor:[UIColor colorWithRed:(77/255.0) green:(185 / 255.0) blue:(77 / 255.0) alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    nav1.navigationBar.titleTextAttributes = dict;
    //    nav2.navigationBar.titleTextAttributes = dict;
    nav3.navigationBar.titleTextAttributes = dict;
    nav4.navigationBar.titleTextAttributes = dict;
    nav5.navigationBar.titleTextAttributes = dict;
    
    
    //    self.tabBar.tintColor = [UIColor colorWithRed:(77/255.0) green:(185 / 255.0) blue:(77 / 255.0) alpha:1];
    
    //设置底部状态栏的颜色
    self.tabBar.barTintColor  = colorWithRGB(0x26293a, 1.0);
    //文字颜色
    self.tabBar.tintColor=[UIColor greenColor];
    self.viewControllers = [NSArray arrayWithObjects:nav3 ,nav1,nav4,nav5,nil];
}


@end

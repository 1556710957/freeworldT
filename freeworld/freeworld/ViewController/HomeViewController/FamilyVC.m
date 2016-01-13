//
//  FamilyVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "FamilyVC.h"
#import "Constants.h"
#import "CreateFamilyVC.h"

@implementation FamilyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"族谱";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake((mainW-240)/2, mainH/3, 240, 50)];
    stateLabel.font = [UIFont systemFontOfSize:15];
    stateLabel.numberOfLines = 2;
    stateLabel.textColor = colorWithRGB(0x666666, 1.0);
    stateLabel.text = @"您尚未创建或参加到任何族谱中，是否创建或添加族谱?";
    [self.view addSubview:stateLabel];
    
    
    UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn.layer.cornerRadius = 5;
    createBtn.tag = 1;
    createBtn.backgroundColor =colorWithRGB(0x1dadea, 1.0);
    createBtn.frame = CGRectMake((mainW-240)/2,CGRectGetMaxY(stateLabel.frame)+10, 240, 40);
    [createBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    createBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [createBtn setTitle:@"创建族谱" forState:UIControlStateNormal];
    [self.view addSubview:createBtn];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.layer.cornerRadius = 5;
    addBtn.tag = 2;
    addBtn.backgroundColor = colorWithRGB(0x1ebda7, 1.0);
    addBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(createBtn.frame)+15, 240, 40);
    [addBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [addBtn setTitle:@"添加族谱" forState:UIControlStateNormal];
    [self.view addSubview:addBtn];

}

-(void)btnClick:(UIButton *)sender
{

    if (sender.tag ==1) {
        //创建族谱
        CreateFamilyVC *createVC = [[CreateFamilyVC alloc]init];
        createVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:createVC animated:YES];
        
    }if (sender.tag ==1) {
        //添加族谱
        
    }
}


@end

//
//  CreateFamilyVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "CreateFamilyVC.h"
#import "Constants.h"

@implementation CreateFamilyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
//    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"创建族谱";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    //姓名
    UIView *reallView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame)+1, mainW, 50)];
    reallView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:reallView];
    
    UILabel *reallLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    reallLabel.text = @"族谱名字:";
    reallLabel.font = [UIFont systemFontOfSize:15];
    reallLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [reallView addSubview:reallLabel];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(reallLabel.frame), 10, mainW-120, 30)];
    _nameTextField.delegate = self;
    _nameTextField.placeholder = @"请输入族谱姓名";
    [_nameTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [reallView addSubview:_nameTextField];
    

    //籍贯
    UIView *nationView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(reallView.frame)+1, mainW, 50)];
    nationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nationView];
    
    UILabel *nationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    nationLabel.text = @"籍贯:";
    nationLabel.font = [UIFont systemFontOfSize:15];
    nationLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [nationView addSubview:nationLabel];
    
    _nationTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nationLabel.frame), 10, mainW-120, 30)];
    _nationTextField.delegate = self;
    _nationTextField.placeholder = @"请输入籍贯";
    [_nationTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [nationView addSubview:_nationTextField];
    
    
    //祖训
    UIView *lessonView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nationView.frame)+1, mainW, 50)];
    lessonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lessonView];
    
    UILabel *lessonLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    lessonLabel.text = @"祖训:";
    lessonLabel.font = [UIFont systemFontOfSize:15];
    lessonLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [lessonView addSubview:lessonLabel];
    
    _lessonTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lessonLabel.frame), 10, mainW-120, 30)];
    _lessonTextField.delegate = self;
    _lessonTextField.placeholder = @"请输入祖训";
    [_lessonTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [lessonView addSubview:_lessonTextField];
    
    
    //简介
    UIView *introView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lessonView.frame)+1, mainW, 50)];
    introView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:introView];
    
    UILabel *introlLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    introlLabel.text = @"族谱简介:";
    introlLabel.font = [UIFont systemFontOfSize:15];
    introlLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [introView addSubview:introlLabel];


    
    _introlTextField = [[UITextField alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(introView.frame)+1, mainW, 50)];
    _introlTextField.backgroundColor=  [UIColor whiteColor];
    _introlTextField.delegate = self;
    _introlTextField.placeholder = @"请输入简介";
    [_introlTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_introlTextField];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.layer.cornerRadius = 5;
    addBtn.tag = 2;
    addBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    addBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_introlTextField.frame)+20, 240, 40);
    [addBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [addBtn setTitle:@"确认提交" forState:UIControlStateNormal];
    [self.view addSubview:addBtn];


}

-(void)sureBtnClick
{
    NSLog(@"确定");
}

@end

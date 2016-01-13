//
//  EditDataVC.m
//  freeworld
//
//  Created by 冯春 on 16/1/13.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "EditDataVC.h"
#import "Constants.h"

@implementation EditDataVC

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
    title.text = @"修改资料";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [topView addSubview:title];
    
    UILabel *lineOne = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame), mainW, 2)];
    lineOne.backgroundColor = colorWithRGB(0x25263a, 1.0);
    [topView addSubview:lineOne];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame), mainW, mainH-CGRectGetMaxY(topView.frame))];
    _scrollView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [self.view addSubview:_scrollView];
    
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW,100)];
//    bgView.frame = CGRectMake(0, 20, mainW,140);
    bgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [_scrollView addSubview:bgView];

    //头像
    _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,15, 70, 70)];
    _photoImage.backgroundColor = [UIColor purpleColor];
    _photoImage.layer.cornerRadius = 35;
    [bgView addSubview:_photoImage];

    _companyName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photoImage.frame)+10, 20, 100, 30)];
    _companyName.text = @"名字";
    _companyName.textColor = [UIColor whiteColor];
    _companyName.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:_companyName];

    _btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOne.frame = CGRectMake(CGRectGetMaxX(_companyName.frame)+10,20, 20, 20);
    _btnOne.layer.cornerRadius = 10;
    [_btnOne setImage:[UIImage imageNamed:@"34"] forState:UIControlStateNormal];
    [bgView addSubview:_btnOne];

    _btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnTwo.frame = CGRectMake(CGRectGetMaxX(_btnOne.frame)+10,20, 20, 20);
    _btnTwo.layer.cornerRadius = 10;
    [_btnTwo setImage:[UIImage imageNamed:@"35"] forState:UIControlStateNormal];
    [bgView addSubview:_btnTwo];
    
    
    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_photoImage.frame)+10, CGRectGetMaxY(_companyName.frame), mainW*2/3, 30)];
    _numberLabel.text = @"[自由地球号]987654321";
    _numberLabel.textColor = [UIColor whiteColor];
    _numberLabel.font = [UIFont systemFontOfSize:13];
    [bgView addSubview:_numberLabel];
  
    UIButton *introlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    introlBtn.frame = CGRectMake(0, CGRectGetMaxY(bgView.frame), mainW, 50);
    [introlBtn setTitle:@"自我介绍" forState:UIControlStateNormal];
    introlBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    introlBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    introlBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    introlBtn.backgroundColor = [UIColor whiteColor];
    [introlBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [introlBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:introlBtn];

    _introlLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(introlBtn.frame), mainW, 60)];
    _introlLabel.text = @"介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍";
    _introlLabel.font = [UIFont systemFontOfSize:15];
    _introlLabel.numberOfLines = 2;
    _introlLabel.hidden = YES;
    [_scrollView addSubview:_introlLabel];
    
    UIButton *areaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    areaBtn.frame = CGRectMake(0, CGRectGetMaxY(introlBtn.frame)+1, mainW, 50);
    [areaBtn setTitle:@"地区" forState:UIControlStateNormal];
    areaBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    areaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    areaBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    [areaBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    areaBtn.backgroundColor = [UIColor whiteColor];
//    [areaBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:areaBtn];
    

    //真实姓名
    UIView *petView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(areaBtn.frame)+1, mainW, 50)];
    petView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:petView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    nameLabel.text = @"真实姓名:";
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [petView addSubview:nameLabel];
    
    
    _nameFiled = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), 10, mainW-130, 30)];
    _nameFiled.delegate = self;
    _nameFiled.placeholder = @"请输入姓名";
    [_nameFiled setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [petView addSubview:_nameFiled];
    
   
    //性别
    UIView *sexView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(petView.frame)+1, mainW, 50)];
    sexView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:sexView];
    
    UILabel *sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    sexLabel.text = @"*性别:";
    sexLabel.font = [UIFont systemFontOfSize:15];
    sexLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [sexView addSubview:sexLabel];
    
    _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _womanBtn.selected = NO;
    [_womanBtn addTarget:self action:@selector(womanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_womanBtn setImage:[UIImage imageNamed:@"39"] forState:UIControlStateNormal];
    [_womanBtn setImage:[UIImage imageNamed:@"42"] forState:UIControlStateSelected];
    _womanBtn.frame = CGRectMake(CGRectGetMaxX(sexLabel.frame), 15, 20, 20) ;
    _womanBtn.layer.cornerRadius = 10;
    //    _womanBtn.backgroundColor = [UIColor redColor];
    [sexView addSubview:_womanBtn];
    
    
    UILabel *momanLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_womanBtn.frame)+10, 10, 40, 30)];
    momanLabel.text = @"女生";
    momanLabel.font = [UIFont systemFontOfSize:15];
    momanLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [sexView addSubview:momanLabel];
    
    _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_manBtn addTarget:self action:@selector(manBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _manBtn.selected = NO;
    [_manBtn setImage:[UIImage imageNamed:@"38"] forState:UIControlStateNormal];
    [_manBtn setImage:[UIImage imageNamed:@"43"] forState:UIControlStateSelected];
    _manBtn.frame = CGRectMake(CGRectGetMaxX(momanLabel.frame)+10, 15, 20, 20) ;
    _manBtn.layer.cornerRadius = 10;
    //    _manBtn.backgroundColor = [UIColor redColor];
    [sexView addSubview:_manBtn];
    
    UILabel *manLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_manBtn.frame)+10, 10, 40, 30)];
    manLabel.text = @"男生";
    manLabel.font = [UIFont systemFontOfSize:15];
    manLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [sexView addSubview:manLabel];
    
    //出生日期
    UIView *birthView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sexView.frame)+1, mainW, 50)];
    birthView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:birthView];
    
    UILabel *birthLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    birthLabel.text = @"*出生日期:";
    birthLabel.font = [UIFont systemFontOfSize:15];
    birthLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [birthView addSubview:birthLabel];
    
    _birthFiled = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(birthLabel.frame), 10, mainW-120, 30)];
    _birthFiled.delegate = self;
    _birthFiled.placeholder = @"请填入出生日期";
    [_birthFiled setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [birthView addSubview:_birthFiled];
    
    //身份证
    UIView *IDView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(birthView.frame)+1, mainW, 50)];
    IDView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:IDView];
    
    UILabel *IDLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    IDLabel.text = @"*法人身份证:";
    IDLabel.font = [UIFont systemFontOfSize:15];
    IDLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [IDView addSubview:IDLabel];
    
    _IDTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IDLabel.frame), 10, mainW-220, 30)];
    //    _phoneTextField.backgroundColor = [UIColor redColor];
    _IDTextField.delegate = self;
    _IDTextField.placeholder = @"请输入身份证号码";
    [_IDTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [IDView addSubview:_IDTextField];


      //住址
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(IDView.frame)+1, mainW, 50)];
    addressView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:addressView];
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    addressLabel.text = @"*住址:";
    addressLabel.font = [UIFont systemFontOfSize:15];
    addressLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [addressView addSubview:addressLabel];
    
    _addressTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressLabel.frame), 10, mainW-120, 30)];
    _addressTextField.delegate = self;
    _addressTextField.placeholder = @"请填入住址";
    [_addressTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [addressView addSubview:_addressTextField];
    
    //电话
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addressView.frame)+1, mainW, 50)];
    phoneView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:phoneView];
    
    UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    phoneLabel.text = @"*手机验证码:";
    phoneLabel.font = [UIFont systemFontOfSize:15];
    phoneLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [phoneView addSubview:phoneLabel];
    
    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneLabel.frame), 10, mainW-220, 30)];
    //    _phoneTextField.backgroundColor = [UIColor redColor];
    _phoneTextField.delegate = self;
    _phoneTextField.placeholder = @"请输入电话号码";
    [_phoneTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [phoneView addSubview:_phoneTextField];


    //学历专业
    _educationView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(phoneView.frame)+1, mainW, 50)];
    _educationView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_educationView];
    
    UILabel *educationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    educationLabel.text = @"*学历专业:";
    educationLabel.font = [UIFont systemFontOfSize:15];
    educationLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [_educationView addSubview:educationLabel];
    
    //上传照片
    _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_educationView.frame)+1, mainW, 50)];
    _postView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_postView];
    
    _picBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,mainW, 50)];
    _picBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _picBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    _picBtn.selected = NO;
    [_picBtn addTarget:self action:@selector(picClick) forControlEvents:UIControlEventTouchUpInside];
    [_picBtn setTitle:@"上传照片证明" forState:UIControlStateNormal];
    _picBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_picBtn setTitleColor:colorWithRGB(0x666666, 1.0) forState:UIControlStateNormal];
    [_postView addSubview:_picBtn];
    
    
    UILabel *lastLine = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, mainW, 1)];
    lastLine.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [_postView addSubview:lastLine];
    
    
    //确认提交
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
    _sureBtn.backgroundColor = colorWithRGB(0x1caceb, 1.0);
    [_sureBtn setTitle:@"确认提交" forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _sureBtn.layer.cornerRadius = 5;
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scrollView addSubview:_sureBtn];
    
    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);

    
}

-(void)womanBtnClick
{
    _womanBtn.selected = !_womanBtn.selected;
    if (_womanBtn.selected) {
        _manBtn.selected = NO;
    }if (_manBtn.selected) {
        _womanBtn.selected = NO;
    }
    
}
-(void)manBtnClick
{
    _manBtn.selected = !_manBtn.selected;
    
    if (_manBtn.selected) {
        _womanBtn.selected = NO;
    }if (_womanBtn.selected) {
        _manBtn.selected = NO;
    }
}

-(void)picClick
{
    NSLog(@"aaaa");
    _picBtn.selected = !_picBtn.selected;
    
    if (_picBtn.selected == YES) {
        
        _postView.frame =  CGRectMake(0, CGRectGetMaxY(_educationView.frame)+1, mainW,50+(mainW-20-6)/4);
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);
        
        _tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, mainW, (mainW-20-6)/4)];
        [_postView addSubview:_tempView];
        
        
    }else
    {
        _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_educationView.frame)+1,
                                                            mainW, 50)];
        [_tempView removeFromSuperview];
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);
        
    }
    
}


@end

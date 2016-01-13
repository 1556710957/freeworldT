//
//  PersonalRegisterVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/4.
//  Copyright © 2016年 One. All rights reserved.
//

#import "PersonalRegisterVC.h"
#import "Constants.h"
#import "PostIdCardVC.h"

@implementation PersonalRegisterVC

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
    title.text = @"注册账号";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, mainH-CGRectGetMaxY(BgView.frame))];
    _scrollView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [self.view addSubview:_scrollView];
  
    
    
    UIView *scrollView = [[UIView alloc]initWithFrame:CGRectMake(0,0, mainW, 110)];
    scrollView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:scrollView];
    
    
    //昵称
    UIView *petView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame), mainW, 50)];
    petView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:petView];
    
    UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    nickName.text = @"*昵称:";
    nickName.font = [UIFont systemFontOfSize:15];
    nickName.textColor = colorWithRGB(0x3d3c40, 1.0);
    [petView addSubview:nickName];
    
    
    _petTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nickName.frame), 10, mainW-130, 30)];
    _petTextField.delegate = self;
    _petTextField.placeholder = @"请输入昵称";
    [_petTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [petView addSubview:_petTextField];
    
    //监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeOne) name:UITextFieldTextDidChangeNotification object:_petTextField];

    
    _imageOne = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
    _imageOne.image = [UIImage imageNamed:@"2"];
    [petView addSubview:_imageOne];
    
    
    //密码
    UIView *pwdView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(petView.frame)+1, mainW, 50)];
    pwdView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:pwdView];
    
    UILabel *pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 30)];
    pwdLabel.text = @"*密码:";
    pwdLabel.font = [UIFont systemFontOfSize:15];
    pwdLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [pwdView addSubview:pwdLabel];
    
    _pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pwdLabel.frame), 10, mainW-130, 30)];
    _pwdTextField.delegate = self;
    _pwdTextField.placeholder = @"请输入密码";
    [_pwdTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [pwdView addSubview:_pwdTextField];
    
    //监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeTwo) name:UITextFieldTextDidChangeNotification object:_pwdTextField];
    
    _imageTwo = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
    _imageTwo.image = [UIImage imageNamed:@"2"];
    [pwdView addSubview:_imageTwo];
    
    
    //重复密码
    UIView *repeatView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pwdView.frame)+1, mainW, 50)];
    repeatView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:repeatView];
    
    UILabel *repeatLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    repeatLabel.text = @"*重复密码:";
    repeatLabel.font = [UIFont systemFontOfSize:15];
    repeatLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [repeatView addSubview:repeatLabel];
    
    _repeatTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(repeatLabel.frame), 10, mainW-130, 30)];
    _repeatTextField.delegate = self;
    _repeatTextField.placeholder = @"请重复密码";
    [_repeatTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [repeatView addSubview:_repeatTextField];
    
    //监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeThree) name:UITextFieldTextDidChangeNotification object:_repeatTextField];
    
    _imageThree = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
    _imageThree.image = [UIImage imageNamed:@"2"];
    [repeatView addSubview:_imageThree];
    
    
    //电话
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(repeatView.frame)+1, mainW, 50)];
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
    
    //获取验证码
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.frame = CGRectMake(CGRectGetMaxX(_phoneTextField.frame)+15, 10, 80, 30) ;
    codeBtn.backgroundColor = colorWithRGB(0x1caceb, 1.0);
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    codeBtn.layer.cornerRadius = 5;
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [phoneView addSubview:codeBtn];
    
    
    
    //真实姓名
    UIView *reallView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(phoneView.frame)+1, mainW, 50)];
    reallView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:reallView];
    
    UILabel *reallLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    reallLabel.text = @"*真实姓名:";
    reallLabel.font = [UIFont systemFontOfSize:15];
    reallLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [reallView addSubview:reallLabel];
    
    _reallTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(reallLabel.frame), 10, mainW-120, 30)];
    _reallTextField.delegate = self;
    _reallTextField.placeholder = @"请填入真实姓名";
    [_reallTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [reallView addSubview:_reallTextField];
    
    
    //性别
    UIView *sexView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(reallView.frame)+1, mainW, 50)];
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
    
    _reallTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(reallLabel.frame), 10, mainW-120, 30)];
    _reallTextField.delegate = self;
    _reallTextField.placeholder = @"请填入出生日期";
    [_reallTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [birthView addSubview:_reallTextField];


    //身份证
    UIView *IDView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(birthView.frame)+1, mainW, 50)];
    IDView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:IDView];
    
    UILabel *IDLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 25)];
    IDLabel.text = @"*手机验证码:";
    IDLabel.font = [UIFont systemFontOfSize:15];
    IDLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [IDView addSubview:IDLabel];
    
    _IDTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneLabel.frame), 5, mainW-220, 25)];
    //    _phoneTextField.backgroundColor = [UIColor redColor];
    _IDTextField.delegate = self;
    _IDTextField.placeholder = @"请输入身份证号码";
    [_IDTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [IDView addSubview:_IDTextField];
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(IDLabel.frame)-5, mainW*2/3, 20)];
    stateLabel.text = @"需上传身份证正反面,便于工作人员审核";
    stateLabel.font = [UIFont systemFontOfSize:12];
    stateLabel.textColor = [UIColor lightGrayColor];
    [IDView addSubview:stateLabel];
    
    
    //获取验证码
    UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [postBtn addTarget:self action:@selector(postBtnClick) forControlEvents:UIControlEventTouchUpInside];
    postBtn.frame = CGRectMake(CGRectGetMaxX(_IDTextField.frame)+15, 10, 80, 30) ;
    postBtn.backgroundColor = colorWithRGB(0x1caceb, 1.0);
    [postBtn setTitle:@"上传身份证照" forState:UIControlStateNormal];
    postBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    postBtn.layer.cornerRadius = 5;
    [postBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [IDView addSubview:postBtn];

    
    
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
    
    //学历专业
    UIView *educationView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addressView.frame)+1, mainW, 50)];
    educationView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:educationView];
    
    UILabel *educationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    educationLabel.text = @"*学历专业:";
    educationLabel.font = [UIFont systemFontOfSize:15];
    educationLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [educationView addSubview:educationLabel];
    
//    _addressTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressLabel.frame), 10, mainW-120, 30)];
//    _addressTextField.delegate = self;
//    _addressTextField.placeholder = @"请填入住址";
//    [_addressTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//    [educationView addSubview:_addressTextField];
    
    //地区
    _areaView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(educationView.frame)+1, mainW, 50)];
    _areaView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_areaView];
    
    UILabel *areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    areaLabel.text = @"*地区:";
    areaLabel.font = [UIFont systemFontOfSize:15];
    areaLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [_areaView addSubview:areaLabel];
    
    //上传照片
    _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_areaView.frame)+1, mainW, 50)];
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

- (void)textFieldTextDidChangeOne
{
    if (_petTextField.text.length>5) {
        
        _imageOne.image = [UIImage imageNamed:@"1"];
        
    }else
    {
       _imageOne.image = [UIImage imageNamed:@"2"];
    }
    
}
- (void)textFieldTextDidChangeTwo
{
    if (_pwdTextField.text.length>5) {
        
        _imageTwo.image = [UIImage imageNamed:@"1"];
        
    }else
    {
        _imageTwo.image = [UIImage imageNamed:@"2"];
    }
    
    
}

- (void)textFieldTextDidChangeThree
{
    if (_repeatTextField.text.length>5) {
        
        _imageThree.image = [UIImage imageNamed:@"1"];
        
    }else
    {
        _imageThree.image = [UIImage imageNamed:@"2"];
    }
    
    
}


-(void)postBtnClick
{
    NSLog(@"身份证");
    PostIdCardVC *CardVC = [[PostIdCardVC alloc]init];
    CardVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:CardVC animated:YES];
}


-(void)picClick
{
    NSLog(@"aaaa");
    _picBtn.selected = !_picBtn.selected;
    
    if (_picBtn.selected == YES) {
        
        _postView.frame =  CGRectMake(0, CGRectGetMaxY(_areaView.frame)+1, mainW,50+(mainW-20-6)/4);
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);
        
        _tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, mainW, (mainW-20-6)/4)];
        [_postView addSubview:_tempView];


    }else
    {
        _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_areaView.frame)+1,
                                                    mainW, 50)];
        [_tempView removeFromSuperview];
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);

    }

}

@end

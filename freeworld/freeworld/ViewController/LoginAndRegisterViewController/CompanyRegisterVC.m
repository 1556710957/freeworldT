//
//  CompanyRegisterVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/5.
//  Copyright © 2016年 One. All rights reserved.
//

#import "CompanyRegisterVC.h"
#import "Constants.h"

@implementation CompanyRegisterVC

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
    
    
    //公司名称
    UIView *petView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame), mainW, 50)];
    petView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:petView];
    
    UILabel *nickName = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    nickName.text = @"*公司名称:";
    nickName.font = [UIFont systemFontOfSize:15];
    nickName.textColor = colorWithRGB(0x3d3c40, 1.0);
    [petView addSubview:nickName];
    
    
    _companyTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nickName.frame), 10, mainW-100, 30)];
    _companyTextField.delegate = self;
    _companyTextField.placeholder = @"请输入公司名称";
    [_companyTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [petView addSubview:_companyTextField];
    
    //监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeOne) name:UITextFieldTextDidChangeNotification object:_companyTextField];
    
    
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
    
    _pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(pwdLabel.frame), 10, mainW-100, 30)];
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
    
    _repeatTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(repeatLabel.frame), 10, mainW-120, 30)];
    _repeatTextField.delegate = self;
    _repeatTextField.placeholder = @"请重复密码";
    [_repeatTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [repeatView addSubview:_repeatTextField];
    
    //监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeThree) name:UITextFieldTextDidChangeNotification object:_repeatTextField];
    
    _imageThree = [[UIImageView alloc]initWithFrame:CGRectMake(mainW-30, 15, 20, 20)];
    _imageThree.image = [UIImage imageNamed:@"2"];
    [repeatView addSubview:_imageThree];
    
    
    
    //住址
    UIView *addressView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(repeatView.frame)+1, mainW, 50)];
    addressView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:addressView];
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    addressLabel.text = @"*公司地址:";
    addressLabel.font = [UIFont systemFontOfSize:15];
    addressLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [addressView addSubview:addressLabel];
    
    _addressTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(addressLabel.frame), 10, mainW-120, 30)];
    _addressTextField.delegate = self;
    _addressTextField.placeholder = @"请填入公司地址";
    [_addressTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [addressView addSubview:_addressTextField];
    
    
    //范围
    UIView *rangeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(addressView.frame)+1, mainW, 50)];
    rangeView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:rangeView];
    
    UILabel *rangeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    rangeLabel.text = @"*营业范围:";
    rangeLabel.font = [UIFont systemFontOfSize:15];
    rangeLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [rangeView addSubview:rangeLabel];
    
    _rangeTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rangeLabel.frame), 10, mainW-120, 30)];
    _rangeTextField.delegate = self;
    _rangeTextField.placeholder = @"请填入营业范围";
    [_rangeTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [rangeView addSubview:_rangeTextField];
    
    
    //营业执照
    UIView *licenseView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(rangeView.frame)+1, mainW, 50)];
    licenseView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:licenseView];
    
    UILabel *licenseLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    licenseLabel.text = @"*营业执照:";
    licenseLabel.font = [UIFont systemFontOfSize:15];
    licenseLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [licenseView addSubview:licenseLabel];
    
//    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneLabel.frame), 10, mainW-220, 30)];
//    //    _phoneTextField.backgroundColor = [UIColor redColor];
//    _phoneTextField.delegate = self;
//    _phoneTextField.placeholder = @"请输入电话号码";
//    [_phoneTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
//    [licenseView addSubview:_phoneTextField];
    
    //上传营业执照
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.frame = CGRectMake(mainW-100, 10, 80, 30) ;
    codeBtn.backgroundColor = colorWithRGB(0x1caceb, 1.0);
    [codeBtn setTitle:@"上传营业执照" forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    codeBtn.layer.cornerRadius = 5;
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [licenseView addSubview:codeBtn];
    
    
    //姓名
    UIView *reallView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(licenseView.frame)+1, mainW, 50)];
    reallView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:reallView];
    
    UILabel *reallLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    reallLabel.text = @"*法人姓名:";
    reallLabel.font = [UIFont systemFontOfSize:15];
    reallLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [reallView addSubview:reallLabel];
    
    _reallTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(reallLabel.frame), 10, mainW-120, 30)];
    _reallTextField.delegate = self;
    _reallTextField.placeholder = @"请填入真实姓名";
    [_reallTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [reallView addSubview:_reallTextField];


    //身份证
    UIView *IDView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(reallView.frame)+1, mainW, 50)];
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
    
    //地区
    UIView * areaView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(IDView.frame)+1, mainW, 50)];
    areaView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:areaView];
    
    UILabel *areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    areaLabel.text = @"*地区";
    areaLabel.font = [UIFont systemFontOfSize:15];
    areaLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [areaView addSubview:areaLabel];
    
    
    //联系方式
    _contactView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(areaView.frame)+1, mainW, 50)];
    _contactView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_contactView];
    
    UILabel *contactLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    contactLabel.text = @"*联系方式:";
    contactLabel.font = [UIFont systemFontOfSize:15];
    contactLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [_contactView addSubview:contactLabel];
    
    _contactField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IDLabel.frame), 10, mainW-220, 30)];
    _contactField.delegate = self;
    _contactField.placeholder = @"请输入电话号码";
    [_contactField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [_contactView addSubview:_contactField];
    
    
    //上传照片
    _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contactView.frame)+1, mainW, 50)];
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

- (void)textFieldTextDidChangeOne
{
    if (_companyTextField.text.length>5) {
        
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


-(void)picClick
{
    NSLog(@"aaaa");
    _picBtn.selected = !_picBtn.selected;
    
    if (_picBtn.selected == YES) {
        
        _postView.frame =  CGRectMake(0, CGRectGetMaxY(_contactView.frame)+1, mainW,50+(mainW-20-6)/4);
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);
        
        _tempView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, mainW, (mainW-20-6)/4)];
        [_postView addSubview:_tempView];
        
        
    }else
    {
        _postView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_contactView.frame)+1,
                                                            mainW, 50)];
        [_tempView removeFromSuperview];
        _sureBtn.frame = CGRectMake((mainW-240)/2, CGRectGetMaxY(_postView.frame)+15, 240, 40) ;
        _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(_sureBtn.frame)+20);
        
    }
    
}

@end

//
//  CompanyRegisterVC.h
//  Freeearth
//
//  Created by 冯春 on 16/1/5.
//  Copyright © 2016年 One. All rights reserved.
//

#import "BaseVC.h"

@interface CompanyRegisterVC : BaseVC<UITextFieldDelegate>
{
  UIScrollView *_scrollView;
    
    UIImageView *_imageOne;
    
    UIImageView *_imageTwo;
    
    UIImageView *_imageThree;
    
    //公司
    UITextField *_companyTextField;
    
    //密码
    UITextField *_pwdTextField;
    
    //重复密码
    UITextField *_repeatTextField;
    
    //地址
    UITextField *_addressTextField;
    
    
    //范围
    UITextField *_rangeTextField;
    
    //真实姓名
    UITextField *_reallTextField;
    
    //身份证
    UITextField *_IDTextField;
    
    //联系方式
    UITextField *_contactField;
    
    //图片背景
    UIView *_postView;
    
    //提交
    UIButton *_sureBtn;
    
    UIButton *_picBtn;
    
    //背景
    UIView *_tempView;
    
    //联系方式
    UIView *_contactView;
    
    
}

@end

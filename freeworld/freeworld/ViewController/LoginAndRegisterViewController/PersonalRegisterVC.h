//
//  PersonalRegisterVC.h
//  Freeearth
//
//  Created by 冯春 on 16/1/4.
//  Copyright © 2016年 One. All rights reserved.
//

#import "BaseVC.h"

@interface PersonalRegisterVC : BaseVC<UITextFieldDelegate>
{
    
    UIScrollView *_scrollView;
    //昵称
    UITextField *_petTextField;
    
    UIImageView *_imageOne;
    
    UIImageView *_imageTwo;
    
    UIImageView *_imageThree;
    
    UIButton *_womanBtn;
    
    UIButton *_manBtn;
    
    //密码
    UITextField *_pwdTextField;
    
    //重复密码
    UITextField *_repeatTextField;
    
    //电话号码
    UITextField *_phoneTextField;
    
    //真实姓名
    UITextField *_reallTextField;
    
    //身份证
    UITextField *_IDTextField;
    
    //住址
    UITextField *_addressTextField;
    
    //地区
    UIView *_areaView;
    
    //图片背景
   UIView *_postView;
    
    //提交
    UIButton *_sureBtn;
    
    //
    UIButton *_picBtn;
    
    //图片
    UIImageView *_picImage;
    
    
    //背景
    UIView *_tempView;
}

@end

//
//  EditDataVC.h
//  freeworld
//
//  Created by 冯春 on 16/1/13.
//  Copyright © 2016年 Yunnan Dandelion Network Technology Co., Ltd. All rights reserved.
//

#import "BaseVC.h"

@interface EditDataVC : BaseVC<UITextFieldDelegate>
{
     UIScrollView *_scrollView;
    
  UIImageView *_photoImage;
    
    UIButton *_btnOne;
    UIButton *_btnTwo;
    
    UIButton *_womanBtn;
    
    UIButton *_manBtn;
    
    
    UILabel *_companyName;
    UILabel *_numberLabel;
    
    UILabel *_introlLabel;
    
    UITextField *_nameFiled;
    
    UITextField *_birthFiled;
    
    UITextField *_IDTextField;
    
    UITextField *_addressTextField;
    
    UITextField *_phoneTextField;
    
    UIView *_educationView;
    
    UIView *_postView;
    
    UIButton *_picBtn;
    
    UIButton *_sureBtn;
    
    UIView *_tempView;

}

@end

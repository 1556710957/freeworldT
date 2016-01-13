//
//  CreateFamilyVC.h
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "BaseVC.h"

@interface CreateFamilyVC : BaseVC<UITextFieldDelegate>
{
    //姓名
    UITextField *_nameTextField;
    
    //籍贯
    UITextField *_nationTextField;
    
    //祖训
    UITextField *_lessonTextField;
    
    //简介
    UITextField *_introlTextField;

}

@end

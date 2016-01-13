//
//  PublishPTaskVC.h
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "BaseVC.h"

@interface PublishPTaskVC : BaseVC<UITextFieldDelegate>
{
    
    UIScrollView *_scrollView;
    //标题
    UITextField *_titleTextField;
    
    //时间
    UITextField *_timeTextField;
    
    //数量
    UITextField *_amountTextField;
    
    //保证金
    UITextField *_moneyTextField;


}

@end

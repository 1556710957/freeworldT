//
//  FreeMineVC.h
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface FreeMineVC : BaseVC
{
    UIScrollView *_scrollView;
    UIImageView *_photoImage;
    
    UIButton *_btnOne;
    UIButton *_btnTwo;
    
    UILabel *_companyName;
    UILabel *_numberLabel;
}

@end

//
//  FreeMessageVC.h
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface FreeMessageVC : BaseVC<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tvContent;
    
    UIButton *_rightBtn;
    
    UIView * _topView;
    
    UIView *_selectView;
}

@end

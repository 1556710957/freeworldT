//
//  FreeHomeVC.h
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface FreeHomeVC : BaseVC<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *_leftLabel;
    
    UIButton *_rightBtn;
    
    UITextField *_searchField;
    
    UITableView *_tvContent;
    
    UIView *_selectView;
    
    UIView *_layerView;
}

@end

//
//  TaskCell.m
//  Freeearth
//
//  Created by 冯春 on 16/1/11.
//  Copyright © 2016年 One. All rights reserved.
//

#import "TaskCell.h"
#import "Constants.h"

@implementation TaskCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, mainW-20, 40)];
        self.bgView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        self.bgView.layer.borderColor = colorWithRGB(0x888888, 1.0).CGColor;
        self.bgView.clipsToBounds = YES;
        self.bgView.layer.borderWidth = 1.0;
        [self.contentView addSubview:self.bgView];
        
        
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,0, screenWidth -140, 40)];
        self.introLabel.font = [UIFont systemFontOfSize:15];
        self.introLabel.textColor = [UIColor lightGrayColor];
        self.introLabel.text = @"内容提示内容提示内容提示内容提示内容提示内容提示";
        self.introLabel.numberOfLines = 2;
        [self.bgView addSubview:self.introLabel];
        
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
        self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.introLabel.frame)+10,0,100 , 40);
        [self.rightBtn setTitle:@"保证金" forState:UIControlStateNormal];
        [self.rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 15, 0)];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.bgView addSubview:self.rightBtn];
        
        
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,20,100, 20)];
        self.countLabel.font = [UIFont systemFontOfSize:15];
        self.countLabel.textColor = [UIColor whiteColor];
        self.countLabel.text = @"666.00";
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        [self.rightBtn addSubview:self.countLabel];
    }
    return self;
}


@end

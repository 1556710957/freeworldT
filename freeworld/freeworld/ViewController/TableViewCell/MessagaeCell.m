//
//  MessagaeCell.m
//  Freeearth
//
//  Created by 冯春 on 16/1/3.
//  Copyright © 2016年 One. All rights reserved.
//

#import "MessagaeCell.h"
#import "Constants.h"

@implementation MessagaeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        self.ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 65, 65)];
        self.ivImage.layer.cornerRadius = 5;
        self.ivImage.image = [UIImage imageNamed:@"def-2"];
        self.ivImage.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.ivImage];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ivImage.frame) + 10, 10, screenWidth - CGRectGetMaxX(self.ivImage.frame) - 20 , 16)];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = colorWithRGB(0x138dce, 1.0);
        self.titleLabel.text = @"某公司某公司某公司";
        [self.contentView addSubview:self.titleLabel];
        
        
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ivImage.frame)+10,CGRectGetMaxY(self.titleLabel.frame), screenWidth - (CGRectGetMaxX(self.ivImage.frame)  + 10) - 20-30, 40)];
        self.introLabel.font = [UIFont systemFontOfSize:15];
        self.introLabel.textColor = [UIColor lightGrayColor];
        self.introLabel.text = @"内容提示内容提示内容提示内容提示内容提示内容提示";
        self.introLabel.numberOfLines = 2;
        [self.contentView addSubview:self.introLabel];
        
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.backgroundColor = colorWithRGB(0x242c39, 1.0);
        self.rightBtn.frame = CGRectMake(CGRectGetMaxX(self.introLabel.frame) + 10, CGRectGetMaxY(self.titleLabel.frame)+3,20 , 20);
        self.rightBtn.layer.cornerRadius = 10;
//        [self.rightBtn setTitle:@"保证金" forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.rightBtn];
        
        
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainW-100,10 , 80 , 20)];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = colorWithRGB(0x666666, 1.0);
        self.timeLabel.text = @"2015-05-26";
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.timeLabel];
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, screenWidth, 1)];
        lineView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        [self.contentView addSubview:lineView];
        
    }
    return self;
}

@end

//
//  HomeCell.m
//  Freeearth
//
//  Created by 冯春 on 16/1/2.
//  Copyright © 2016年 One. All rights reserved.
//

#import "HomeCell.h"
#import "Constants.h"

@implementation HomeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
        self.ivImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 65, 65)];
        self.ivImage.image = [UIImage imageNamed:@"def-2"];
        self.ivImage.layer.cornerRadius = 5;
        self.ivImage.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.ivImage];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.ivImage.frame) + 10, 10, screenWidth - CGRectGetMaxX(self.ivImage.frame) - 160 , 16)];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
//        self.titleLabel.backgroundColor = [UIColor purpleColor];
        self.titleLabel.textColor = colorWithRGB(0x666666, 1.0);
        self.titleLabel.text = @"好吧";
        [self.contentView addSubview:self.titleLabel];
        
        
        self.proofLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame), 10,20 , 20)];
        self.proofLabel.font = [UIFont boldSystemFontOfSize:15];
        self.proofLabel.textColor = [UIColor whiteColor];
        self.proofLabel.text = @"证";
        self.proofLabel.textAlignment = NSTextAlignmentCenter;
        self.proofLabel.backgroundColor = colorWithRGB(0xf1463b, 1.0);
        self.proofLabel.layer.cornerRadius = 10;
        self.proofLabel.clipsToBounds = YES;
        [self.contentView addSubview:self.proofLabel];
        
        self.peopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.proofLabel.frame)+5, 10,20 , 20)];
        self.peopleLabel.font = [UIFont boldSystemFontOfSize:15];
        self.peopleLabel.textColor = [UIColor whiteColor];
        self.peopleLabel.text = @"人";
        self.peopleLabel.textAlignment = NSTextAlignmentCenter;
        self.peopleLabel.backgroundColor = colorWithRGB(0x1ebda7, 1.0);
        self.peopleLabel.layer.cornerRadius = 10;
        self.peopleLabel.clipsToBounds = YES;
        [self.contentView addSubview:self.peopleLabel];
        
        self.sexBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.sexBtn.frame = CGRectMake(mainW-75,10,15 , 15);
        [self.sexBtn setImage:[UIImage imageNamed:@"39"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.sexBtn];
        
        
        self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(mainW-80, 10,60 , 20)];
        self.ageLabel.font = [UIFont systemFontOfSize:16];
        self.ageLabel.textAlignment = NSTextAlignmentRight;
        self.ageLabel.textColor = colorWithRGB(0x666666, 1.0);
        self.ageLabel.text = @"25岁";
        [self.contentView addSubview:self.ageLabel];
        
        
        
        
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ivImage.frame) + 10, CGRectGetMaxY(self.titleLabel.frame)+3 , screenWidth - (CGRectGetMaxX(self.ivImage.frame)  + 10) - 10-80, 40)];
        bgView.backgroundColor = colorWithRGB(0xf5f4fa, 1.0);
        bgView.layer.borderWidth = 1;
        bgView.layer.cornerRadius = 5;
        bgView.layer.borderColor = colorWithRGB(0xa9a9a9, 1.0).CGColor;
        [self.contentView addSubview:bgView];
        
        self.introLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,0, screenWidth - (CGRectGetMaxX(self.ivImage.frame)  + 10) - 20-80, 40)];
        self.introLabel.font = [UIFont systemFontOfSize:13];
        self.introLabel.textColor = colorWithRGB(0x666666, 1.0);
        self.introLabel.text = @"内容提示内容提示内容提示内容提示内容提示内容提示";
        self.introLabel.numberOfLines = 2;
        [bgView addSubview:self.introLabel];
        
        
        self.payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.payBtn.backgroundColor = colorWithRGB(0x242c39, 1.0);
        self.payBtn.frame = CGRectMake(CGRectGetMaxX(bgView.frame) + 10, CGRectGetMaxY(self.titleLabel.frame)+3,70 , 40);
        [self.payBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
        [self.payBtn setTitle:@"保证金" forState:UIControlStateNormal];
        [self.payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.payBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.payBtn];
        
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,20,70,20)];
        self.countLabel.font = [UIFont systemFontOfSize:15];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.textColor = colorWithRGB(0xffb35a, 1.0);
        self.countLabel.text = @"999";
        self.countLabel.numberOfLines = 2;
        [self.payBtn addSubview:self.countLabel];
        
        
        
        self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.commentBtn.backgroundColor = [UIColor redColor];
        self.commentBtn.frame = CGRectMake(CGRectGetMaxX(self.ivImage.frame) + 10, CGRectGetMaxY(bgView.frame),80 , 20);
        self.commentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.commentBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        [self.commentBtn setTitle:@"24条评论" forState:UIControlStateNormal];
        [self.commentBtn setTitleColor:colorWithRGB(0x1dadea, 1.0) forState:UIControlStateNormal];
        self.commentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.commentBtn];
        
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commentBtn.frame)+10, CGRectGetMaxY(bgView.frame) , 80 , 20)];
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.textColor = colorWithRGB(0x666666, 1.0);
        self.timeLabel.text = @"2015-05-26";
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.timeLabel];

        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, screenWidth, 1)];
        lineView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        [self.contentView addSubview:lineView];
        
    }
    return self;
}

@end

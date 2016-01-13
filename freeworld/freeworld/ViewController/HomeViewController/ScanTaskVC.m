//
//  ScanTaskVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/11.
//  Copyright © 2016年 One. All rights reserved.
//

#import "ScanTaskVC.h"
#import "Constants.h"
#import "PayofMarginVC.h"

@implementation ScanTaskVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    //    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"发布任务预览";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, mainH-CGRectGetMaxY(BgView.frame))];
    [self.view addSubview:_scrollView];

    
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:contentView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, mainW, 50)];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"任务标题";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = colorWithRGB(0x666666, 1.0);
    [_scrollView addSubview:titleLabel];
    

    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.textColor = colorWithRGB(0x666666, 1.0);
    NSString *content = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
//    contentLabel.backgroundColor = [UIColor yellowColor];
//    NSLog(@"===%@",content);
    CGSize sizeInfo = [content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(screenWidth-40, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    contentLabel.text = content;
    //        contentLabel.backgroundColor = [UIColor whiteColor];
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.frame = CGRectMake(10,0, screenWidth-20 , sizeInfo.height);//
    [contentView addSubview:contentLabel];
    
    contentView.frame = CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+1, mainW, contentLabel.frame.size.height+10);
    
    //图片
    UIView *picView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(contentView.frame)+1, mainW, (mainW-50)/4+20)];
    picView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:picView];
    
    for (int i = 0; i<4; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10+(mainW-50)/4*i+i*10, 10, (mainW-50)/4, (mainW-50)/4)];
        image.backgroundColor = [UIColor purpleColor];
        [picView addSubview:image];
    }
    
    //时间
    UIView *dateView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(picView.frame)+1, mainW, 50)];
    dateView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:dateView];
    
    UIImageView *timeImage  = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
    timeImage.backgroundColor = [UIColor redColor];
    [dateView addSubview:timeImage];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 70, 30)];
    timeLabel.text = @"起止时间";
    timeLabel.font = [UIFont systemFontOfSize:15];
    timeLabel.textColor = colorWithRGB(0x666666, 1.0);
    [dateView addSubview:timeLabel];
    
    UILabel *timeContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLabel.frame), 10,160, 30)];
//    timeContent.backgroundColor = [UIColor redColor];
    timeContent.text = @"2016.1.10-2016.2.16";
    timeContent.font = [UIFont systemFontOfSize:15];
    timeContent.textColor = colorWithRGB(0x1dadea, 1.0);
    [dateView addSubview:timeContent];

    
    //人数
    UIView *peopleView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(dateView.frame)+1, mainW, 50)];
    peopleView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:peopleView];
    
    UIImageView *peopleImage  = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
    peopleImage.backgroundColor = [UIColor redColor];
    [peopleView addSubview:peopleImage];
    
    UILabel *peopleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 70, 30)];
    peopleLabel.text = @"参与人数";
    peopleLabel.font = [UIFont systemFontOfSize:15];
    peopleLabel.textColor = colorWithRGB(0x666666, 1.0);
    [peopleView addSubview:peopleLabel];
    
    UILabel *peopleContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(peopleLabel.frame), 10,160, 30)];
    peopleContent.text = @"名额25人/已参加16人";
    peopleContent.font = [UIFont systemFontOfSize:15];
    peopleContent.textColor = colorWithRGB(0x1dadea, 1.0);
    [peopleView addSubview:peopleContent];
    
    
    //资金
    UIView *fundView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(peopleView.frame)+1, mainW, 50)];
    fundView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:fundView];
    
    UIImageView *fundImage  = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
    fundImage.backgroundColor = [UIColor redColor];
    [fundView addSubview:fundImage];
    
    UILabel *fundLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 70, 30)];
    fundLabel.text = @"预计资金";
    fundLabel.font = [UIFont systemFontOfSize:15];
    fundLabel.textColor = colorWithRGB(0x666666, 1.0);
    [fundView addSubview:fundLabel];
    
    UILabel *fundContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(fundLabel.frame), 10,60, 30)];
    fundContent.text = @"2016元";
    fundContent.font = [UIFont systemFontOfSize:15];
    fundContent.textColor = colorWithRGB(0x1dadea, 1.0);
    [fundView addSubview:fundContent];
    
    
    //上传保证金
    UIButton *postBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    postBtn.tag = 2;
    [postBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    postBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    postBtn.layer.cornerRadius = 5;
    if (mainW==320) {
        postBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }else{
        postBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    [postBtn setTitle:@"上传保证金" forState:UIControlStateNormal];
    [postBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    postBtn.frame = CGRectMake(CGRectGetMaxX(fundContent.frame),10,60, 30);
    [fundView addSubview:postBtn];
    
    _countLabel= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(postBtn.frame)+10, 10, 50, 30)];
    _countLabel.clipsToBounds = YES;
    _countLabel.layer.cornerRadius = 5;
    _countLabel.layer.borderColor = colorWithRGB(0xdddddd, 1.0).CGColor;
    _countLabel.layer.borderWidth = 1;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.text = @"6天";
    _countLabel.textColor = colorWithRGB(0x666666, 1.0);
    _countLabel.font = [UIFont systemFontOfSize:15];
    [fundView addSubview:_countLabel];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(countClick) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(CGRectGetMaxX(_countLabel.frame), 10, 30, 30);
    rightBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    [fundView addSubview:rightBtn];


    
    //确认发布
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.tag = 1;
    [payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    payBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    payBtn.layer.cornerRadius = 5;
    [payBtn setTitle:@"确认发布" forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    payBtn.frame = CGRectMake((mainW-240)/2,CGRectGetMaxY(fundView.frame)+20,240, 40);
    [_scrollView addSubview:payBtn];
    
    //取消任务
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.tag = 3;
    [cancelBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.backgroundColor = colorWithRGB(0x28293d, 1.0);
    cancelBtn.layer.cornerRadius = 5;
    [cancelBtn setTitle:@"取消任务" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake((mainW-240)/2,CGRectGetMaxY(payBtn.frame)+15,240, 40);
    [_scrollView addSubview:cancelBtn];
    
    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(cancelBtn.frame)+20);
    
}

//时间
-(void)countClick
{
    _count++;
       _countLabel.text = [NSString stringWithFormat:@"%ld天",_count+6];
    
}

-(void)payBtnClick:(UIButton *)sender
{
    if (sender.tag ==1) {
        NSLog(@"确认发布");
    }if (sender.tag ==2) {
        NSLog(@"上传保证金");
        PayofMarginVC *pay = [[PayofMarginVC alloc]init];
        [self.navigationController pushViewController:pay animated:YES];
    }if (sender.tag ==3) {
        NSLog(@"取消发布");
    }

}

@end

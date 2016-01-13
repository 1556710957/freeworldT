//
//  PublishPTaskVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "PublishPTaskVC.h"
#import "Constants.h"
#import "PayofMarginVC.h"
#import "ScanTaskVC.h"

@implementation PublishPTaskVC
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
    title.text = @"发布任务";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, mainH-CGRectGetMaxY(BgView.frame))];
    //    _scrollView.backgroundColor = colorWithRGB(0xdddddd, 1.0);
    [self.view addSubview:_scrollView];
    
    //标题
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 50)];
    titleView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    titleLabel.text = @"任务标题:";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [titleView addSubview:titleLabel];
    
    _titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 10, mainW-120, 30)];
    _titleTextField.delegate = self;
    _titleTextField.placeholder = @"请输入任务标题";
    [_titleTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [titleView addSubview:_titleTextField];
    
    //时间
    UIView *timeView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame)+1, mainW, 50)];
    timeView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:timeView];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    timeLabel.text = @"起止时间:";
    timeLabel.font = [UIFont systemFontOfSize:15];
    timeLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [timeView addSubview:timeLabel];
    
    _timeTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLabel.frame), 10, mainW-120, 30)];
    _timeTextField.delegate = self;
    _timeTextField.placeholder = @"请输入起止时间";
    [_timeTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [timeView addSubview:_timeTextField];
    
    
    //数量
    UIView *amountView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(timeView.frame)+1, mainW, 50)];
    amountView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:amountView];
    
    UILabel *amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    amountLabel.text = @"计划人数:";
    amountLabel.font = [UIFont systemFontOfSize:15];
    amountLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [amountView addSubview:amountLabel];
    
    _amountTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(amountLabel.frame), 10, mainW-120, 30)];
    _amountTextField.delegate = self;
    _amountTextField.placeholder = @"请输入数量";
    [_amountTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [amountView addSubview:_amountTextField];
    
    //保证金
    UIView *moneyView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(amountView.frame)+1, mainW, 50)];
    moneyView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:moneyView];
    
    UILabel *moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    moneyLabel.text = @"保证金:";
    moneyLabel.font = [UIFont systemFontOfSize:15];
    moneyLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [moneyView addSubview:moneyLabel];
    
    _moneyTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyLabel.frame), 10,100, 30)];
    _moneyTextField.delegate = self;
    _moneyTextField.placeholder = @"请输入保证金";
    [_moneyTextField setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [moneyView addSubview:_moneyTextField];
    
    //上传保证金
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    payBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    payBtn.layer.cornerRadius = 5;
    [payBtn setTitle:@"上传保证金" forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    payBtn.frame = CGRectMake(CGRectGetMaxX(_moneyTextField.frame),10,100, 30);
    [moneyView addSubview:payBtn];

    
    
    
    //内容说明
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(moneyView.frame)+1, mainW, 50)];
    contentView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:contentView];
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 30)];
    contentLabel.text = @"内容说明";
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [contentView addSubview:contentLabel];
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(contentView.frame), mainW, 80)];
    stateLabel.text = @"这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容是内容这是内容这是内容这是内容这是内容这是内容这是内容是内容这是内容这是内容这是内容这是内容这是内容这是内容是内容这是内容这是内容这是内容这是内容这是内容这是内容";
    stateLabel.numberOfLines = 4;
    stateLabel.font = [UIFont systemFontOfSize:14];
    stateLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [_scrollView addSubview:stateLabel];

    UILabel *picLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(stateLabel.frame), mainW, 50)];
    picLabel.backgroundColor = [UIColor whiteColor];
    picLabel.text = @"上传照片说明";
    picLabel.font = [UIFont systemFontOfSize:15];
    picLabel.textColor = colorWithRGB(0x3d3c40, 1.0);
    [_scrollView addSubview:picLabel];
    
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cameraBtn.tag = 1;
    [cameraBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    cameraBtn.backgroundColor = [UIColor whiteColor];
    //colorWithRGB(0x3d3c41, 1.0);
    [cameraBtn setTitle:@"拍摄照片" forState:UIControlStateNormal];
    cameraBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cameraBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    cameraBtn.frame = CGRectMake(10,CGRectGetMaxY(picLabel.frame)+5,(mainW-50)/3, (mainW-50)/3);
    [_scrollView addSubview:cameraBtn];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.tag = 2;
    sureBtn.layer.cornerRadius = 5;
    [sureBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    //colorWithRGB(0x3d3c41, 1.0);
    [sureBtn setTitle:@"确认发布" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.frame = CGRectMake((mainW-240)/2,CGRectGetMaxY(cameraBtn.frame)+15,240,40);
    [_scrollView addSubview:sureBtn];

    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(sureBtn.frame)+20);
}

-(void)payBtnClick
{
    PayofMarginVC *pay = [[PayofMarginVC alloc]init];
    [self.navigationController pushViewController:pay animated:YES];

}

-(void)btnClick:(UIButton *)sender
{
    if (sender.tag ==1) {
        NSLog(@"照片");
    }if (sender.tag ==2) {
        NSLog(@"确认发布");
        ScanTaskVC *scanVC = [[ScanTaskVC alloc]init];
        [self.navigationController pushViewController:scanVC animated:YES];
    }

}

@end

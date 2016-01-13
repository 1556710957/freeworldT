//
//  FreeMessageVC.m
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import "FreeMessageVC.h"
#import "Constants.h"
#import "MessagaeCell.h"
#import "DialogueWindowVC.h"

@interface FreeMessageVC ()

@end

@implementation FreeMessageVC

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, mainW, 40)];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"消息";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.selected = NO;
    _rightBtn.frame = CGRectMake(mainW-50, 20, 40, 40);
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [self.view addSubview:_rightBtn];
    
    
    UIView *searchBg = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, 80)];
    searchBg.backgroundColor = colorWithRGB(0xf3f3f3, 1.0);
    [self.view addSubview:searchBg];
    
    UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, mainW-20 ,40)];
    searchField.placeholder = @" 搜索关键字";
    searchField.layer.cornerRadius = 5;
    searchField.layer.borderWidth = 1;
    searchField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    searchField.backgroundColor = [UIColor whiteColor];
    [searchBg addSubview:searchField];
    
    _tvContent = [[UITableView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(searchBg.frame), mainW, mainH-CGRectGetMaxY(searchBg.frame)-50)];
    _tvContent.backgroundColor = [UIColor whiteColor];
    _tvContent.delegate = self;
    _tvContent.dataSource = self;
    _tvContent.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tvContent];

}


-(void)rightBtnClick
{
    
//    _rightBtn.selected = !_rightBtn.selected;
//    if (_rightBtn.selected) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _topView.userInteractionEnabled=YES;
        _topView.backgroundColor=[UIColor blackColor];
        _topView.alpha=0.5;
        [self.view addSubview:_topView];
        
        _selectView=[[UIView alloc]initWithFrame:CGRectMake(mainW-130, 64, 120, 200)];
        _selectView.userInteractionEnabled=YES;
        _selectView.backgroundColor = colorWithRGB(0x28293d, 1.0);
        [self.view addSubview:_selectView];
        
        
        UIControl *control=[[UIControl alloc]initWithFrame:CGRectMake(0,0, mainW, mainH)];
        [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:control];
        
        
        for (int i =0; i<5; i++) {
            UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            selectBtn.tag = i;
            [selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            selectBtn.frame = CGRectMake(0, i*40, 110, 40);
            selectBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_selectView addSubview:selectBtn];
            
            if (i==0) {
                [selectBtn setTitle:@"全部消息" forState:UIControlStateNormal];
            }if (i==1) {
                [selectBtn setTitle:@"个人消息" forState:UIControlStateNormal];
            }if (i==2) {
                [selectBtn setTitle:@"虚拟公司消息" forState:UIControlStateNormal];
            }if (i==3) {
                [selectBtn setTitle:@"族谱消息" forState:UIControlStateNormal];
            }if (i==4) {
                [selectBtn setTitle:@"公告消息" forState:UIControlStateNormal];
            }
        }

//    }
}

-(void)selectBtnClick:(UIButton *)sender
{
    _topView.hidden = YES;
    _selectView.hidden = YES;
    [_topView removeFromSuperview];
    NSLog(@"点击了==%@",sender.titleLabel.text);
}

-(void)controlClick
{
    NSLog(@"点击了蒙板");
    _topView.hidden = YES;
    _selectView.hidden = YES;
    [_topView removeFromSuperview];
}


#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    if (self.dataArray.count>0) {
    //        return self.dataArray.count;
    //    }
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cell";
    MessagaeCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil)
    {
        cell=[[MessagaeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    //设置cell选中时为无色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DialogueWindowVC *dialogueVC = [[DialogueWindowVC alloc]init];
    dialogueVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dialogueVC animated:YES];
    

}

@end

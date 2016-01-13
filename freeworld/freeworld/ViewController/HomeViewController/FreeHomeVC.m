//
//  FreeHomeVC.m
//  Freeearth
//
//  Created by 冯春 on 15/12/31.
//  Copyright © 2015年 One. All rights reserved.
//

#import "FreeHomeVC.h"
#import "Constants.h"
#import "HomeCell.h"
#import "FamilyVC.h"
#import "MyPublishVC.h"

@interface FreeHomeVC ()

@end

@implementation FreeHomeVC

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]init];
    BgView.backgroundColor = colorWithRGB(0x26293a, 1.0);
    colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];

    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"自由人";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    
    UIImageView *leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 20, 20)];
    leftImage.image = [UIImage imageNamed:@"41"];
    [BgView addSubview:leftImage];
    
    _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 40, 40)];
    _leftLabel.text = @"中国";
    _leftLabel.font = [UIFont systemFontOfSize:15];
    _leftLabel.textAlignment = NSTextAlignmentCenter;
    _leftLabel.textColor = [UIColor whiteColor];
    [BgView addSubview:_leftLabel];
    
    _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(mainW-50, 0, 50, 40)];
    [_rightBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BgView addSubview:_rightBtn];
    
    UILabel *lineOne = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame)+5, mainW, 2)];
    lineOne.backgroundColor = colorWithRGB(0x25263a, 1.0);
    [BgView addSubview:lineOne];
    
    for (int i = 0; i<5; i++) {

        UIButton *classBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*mainW/5, CGRectGetMaxY(lineOne.frame), mainW/5,mainW/5)];
        classBtn.tag = i;
        [classBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 20, 0)];
        [classBtn addTarget:self action:@selector(classBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [classBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [BgView addSubview:classBtn];
        
//        UIImageView *classImage = [[UIImageView alloc]initWithFrame:CGRectMake((mainW/5-30)/2, 5, 30, 30)];
//        [classBtn addSubview:classImage];
        
        UILabel *classLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,mainW/5-25, mainW/5, 20)];
        classLabel.textAlignment = NSTextAlignmentCenter;
        classLabel.font = [UIFont systemFontOfSize:15];
        classLabel.textColor = [UIColor whiteColor];
        [classBtn addSubview:classLabel];
        
        if (i<4) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(mainW/5-2,0, 2, 240-CGRectGetMaxY(lineOne.frame))];
            line.backgroundColor = colorWithRGB(0x25263a, 1.0);
            [classBtn addSubview:line];
            
        }
        if (i==0) {
            classLabel.text = @"个人";
//            classImage.image = [UIImage imageNamed:@"12"];
            [classBtn setImage:[UIImage imageNamed:@"12"] forState:UIControlStateNormal];
        }if (i==1) {
            classLabel.text = @"东家";
//            classImage.image = [UIImage imageNamed:@"11"];
            [classBtn setImage:[UIImage imageNamed:@"11"] forState:UIControlStateNormal];
        }if (i==2) {
            classLabel.text = @"虚拟公司";
//            classImage.image = [UIImage imageNamed:@"29"];
            [classBtn setImage:[UIImage imageNamed:@"29"] forState:UIControlStateNormal];
            
        }if (i==3) {
            classLabel.text = @"物质交换";
//            classImage.image = [UIImage imageNamed:@"29"];
            [classBtn setImage:[UIImage imageNamed:@"17"] forState:UIControlStateNormal];
        }if (i==4) {
            classLabel.text = @"族谱";
//            classImage.image = [UIImage imageNamed:@"17"];
            [classBtn setImage:[UIImage imageNamed:@"17"] forState:UIControlStateNormal];
        }
        BgView.frame = CGRectMake(0, 20, mainW, CGRectGetMaxY(classBtn.frame));
    }

    UIView *searchBg = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(BgView.frame), mainW, 60)];
    searchBg.backgroundColor = colorWithRGB(0xf3f3f3, 1.0);
    [self.view addSubview:searchBg];
    
    _searchField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, mainW-110, 40)];
    _searchField.placeholder = @" 搜索关键字";
    _searchField.layer.cornerRadius = 5;
    _searchField.layer.borderWidth = 1;
    _searchField.layer.borderColor = colorWithRGB(0xa9a9a9, 1.0).CGColor;
    _searchField.backgroundColor = [UIColor whiteColor];
    [searchBg addSubview:_searchField];
    
    //放大镜图标
        UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 20)];
        iconView.image = [UIImage imageNamed:@"icon-search"];
        iconView.contentMode = UIViewContentModeCenter;//居中
        _searchField.leftView = iconView;
        _searchField.leftViewMode = UITextFieldViewModeAlways;//永远显示左边的View
        _searchField.font = [UIFont systemFontOfSize:13];
        _searchField.clearButtonMode = UITextFieldViewModeAlways;
        _searchField.backgroundColor = [UIColor whiteColor];
        //设置提醒文字
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
        _searchField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索服务关键字" attributes:attrs];
//        [BgView addSubview:_searchField];
    
    
    UIButton *publicBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_searchField.frame)+10,10,80, 40)];
    [publicBtn addTarget:self action:@selector(publicBtnClick) forControlEvents:UIControlEventTouchUpInside];
    publicBtn.layer.cornerRadius = 5;
    publicBtn.backgroundColor= colorWithRGB(0x1dadea, 1.0) ;
    [publicBtn setTitle:@"发布新任务" forState:UIControlStateNormal];
    publicBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [publicBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBg addSubview:publicBtn];
    
    _tvContent = [[UITableView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(searchBg.frame), mainW, mainH-CGRectGetMaxY(searchBg.frame)-50)];
    _tvContent.backgroundColor = [UIColor whiteColor];
    _tvContent.delegate = self;
    _tvContent.dataSource = self;
    _tvContent.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tvContent];
}

-(void)publicBtnClick
{
    MyPublishVC *publicVC = [[MyPublishVC alloc]init];
    publicVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:publicVC animated:YES];
}

-(void)classBtnClick:(UIButton *)sender
{
    if (sender.tag ==0) {
        NSLog(@"个人");
    }if (sender.tag ==1) {
        NSLog(@"东家");
    }if (sender.tag ==2) {
        NSLog(@"虚拟公司");
    }if (sender.tag ==3) {
        NSLog(@"物质交换");
    }if (sender.tag ==4) {
        NSLog(@"族谱");
        FamilyVC *family = [[FamilyVC alloc]init];
        family.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:family animated:YES];
    }
   
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 101;
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
    HomeCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil)
    {
        cell=[[HomeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
//    if (self.dataArray.count > 0)
//    {
//        NSDictionary *model = [self.dataArray objectAtIndex:indexPath.row] ;
//        NSString *picUrl = [NSString stringWithFormat:@"%@%@",BASEURL,[model objectForKey:@"imageUrl"]];
//        NSLog(@"pic==%@",picUrl);
//        [cell.ivImage sd_setImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:[UIImage imageNamed:@"def-2"]];
//        cell.titleLabel.text=[model objectForKey:@"title"];
//        cell.introLabel.text=[model objectForKey:@"intro"];
//        
//        NSString *time = [[model objectForKey:@"releaseDate"] substringToIndex:10];
//        cell.dateLabel.text=time;
//        
//        
//    }
    
    //设置cell选中时为无色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)btnClick
{
    _rightBtn.selected = !_rightBtn.selected;
    if (_rightBtn.selected) {
        
        _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, mainW, mainH-65)];
        _layerView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_layerView];
        
        
        _selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 67, mainW, 150)];
        _selectView.backgroundColor = colorWithRGB(0x26293a, 1.0);
        [self.view addSubview:_selectView];
        
        UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_selectView.frame), mainW, mainH-CGRectGetMaxY(_selectView.frame))];
        [control addTarget:self action:@selector(controlClick) forControlEvents:UIControlEventTouchUpInside];
        [_layerView addSubview:control];
        
    }else{
        _selectView.hidden = YES;
        [_layerView removeFromSuperview];
    }
    
   
}

-(void)controlClick
{
    _selectView.hidden = YES;
    [_layerView removeFromSuperview];
}


@end

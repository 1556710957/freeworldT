//
//  MyPublishVC.m
//  Freeearth
//
//  Created by 冯春 on 16/1/10.
//  Copyright © 2016年 One. All rights reserved.
//

#import "MyPublishVC.h"
#import "MyPublishVC.h"
#import "Constants.h"
#import "PublishPTaskVC.h"
#import "TaskCell.h"

@implementation MyPublishVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = colorWithRGB(0xdddddd, 1.0);
        self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, mainW, 20)];
    statusBg.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBg];
    
    UIView *BgView = [[UIView alloc]init];
    BgView.backgroundColor = colorWithRGB(0x28293d, 1.0);
    [self.view addSubview:BgView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, mainW-100, 40)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"我的发布";
    title.font = [UIFont systemFontOfSize:15];
    title.textColor = [UIColor whiteColor];
    [BgView addSubview:title];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(mainW-100, 20, 40, 40);
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:addBtn];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(mainW-50, 20, 40, 40);
    searchBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:searchBtn];
    
    
    UILabel *lineOne = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame)+5, mainW, 2)];
    lineOne.backgroundColor = colorWithRGB(0x25263a, 1.0);
    [BgView addSubview:lineOne];
    
    for (int i = 0; i<4; i++) {
        
        UIButton *classBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*mainW/4, CGRectGetMaxY(lineOne.frame), mainW/4,mainW/4+20)];
        //        classBtn.backgroundColor= [UIColor redColor] ;
        classBtn.tag = i;
        [classBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 40, 0)];
        [classBtn addTarget:self action:@selector(classBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [classBtn setTitle:@"筛选" forState:UIControlStateNormal];
        classBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [classBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [BgView addSubview:classBtn];
        
        UILabel *classLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,mainW/4-20, mainW/4, 20)];
        classLabel.textAlignment = NSTextAlignmentCenter;
        classLabel.font = [UIFont systemFontOfSize:12];
        classLabel.textColor = [UIColor whiteColor];
        [classBtn addSubview:classLabel];
        
        if (i<3) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(mainW/4-2,0, 2,mainW/4+20)];
            line.backgroundColor = colorWithRGB(0x25263a, 1.0);
            [classBtn addSubview:line];
            
        }
        if (i==0) {
            classLabel.text = @"全部";
        }if (i==1) {
            classLabel.text = @"我接受的任务";
        }if (i==2) {
            classLabel.text = @"我发布的任务";
        }if (i==3) {
            classLabel.text = @"虚拟公司业务";
        }
        BgView.frame = CGRectMake(0, 20, mainW, CGRectGetMaxY(classBtn.frame));
    }


    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(10, CGRectGetMaxY(BgView.frame)+20, mainW-20, 40);
    sureBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setTitle:@"我要发布新任务" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:sureBtn];
    
    
    //查看任务
//    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    testBtn.frame = CGRectMake(20, CGRectGetMaxY(sureBtn.frame)+20, mainW-40, 40);
//    testBtn.backgroundColor = colorWithRGB(0x1dadea, 1.0);
//    [testBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [testBtn setTitle:@"查看任务" forState:UIControlStateNormal];
//    testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:testBtn];
    
    _tvContent = [[UITableView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(sureBtn.frame)+5, mainW, mainH-CGRectGetMaxY(sureBtn.frame))];
    _tvContent.backgroundColor = [UIColor whiteColor];
    _tvContent.delegate = self;
    _tvContent.dataSource = self;
    _tvContent.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tvContent];



}

-(void)sureBtnClick
{

    PublishPTaskVC *taskVC = [[PublishPTaskVC alloc]init];
    taskVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:taskVC animated:YES];
}

-(void)classBtnClick:(UIButton *)sender
{
    if (sender.tag==0) {
        NSLog(@"全部");
    }if (sender.tag==1) {
        NSLog(@"我接受的任务");
    }
    if (sender.tag==2) {
        NSLog(@"我发布的任务");
    }
    if (sender.tag==3) {
        NSLog(@"虚拟公司任务");
    }
   
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
    TaskCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil)
    {
        cell=[[TaskCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
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

@end

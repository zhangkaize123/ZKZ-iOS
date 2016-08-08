//
//  MainViewController.m
//  NIB表示图
//
//  Created by 张凯泽 on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "MyTableViewCell.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //加载到内存
    UINib *nib=[UINib nibWithNibName:@"MyCell" bundle:nil];
    
    [self.tableview registerNib:nib forCellReuseIdentifier:@"mycell"];
    
    
    
}
#pragma mark - 表示图
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"mycell";
    
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    //在文件中注册了@“mycell”就不需要再创建新的单元格了。
//    if (cell==nil)
//    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//    }
//    cell.textLabel.text=@"xx";
    //1.如何在MyCell中的lable显示数据。此时在MyCell.xib中没有任何关联。
    /*
    ********************************
    
     在MyCell是使用的空的视图来创建的  tableviewcell
     
     
    */
    
    
    
//    UILabel *lable=(UILabel *)[self.view viewWithTag:10];
//    lable.text=@"dd";
    //2.如何实现自己的tableviewcell
    // 点击大纲视图把tableviewcell变成建立的.（my)tableviewcell
    
    cell.showLable.text=@"rrrrr";
    
    
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

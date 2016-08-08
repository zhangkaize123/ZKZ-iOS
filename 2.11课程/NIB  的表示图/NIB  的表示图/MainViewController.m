//
//  MainViewController.m
//  NIB  的表示图
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
/*
 表示图使用nib 注意事项总结：
     1.当前控制器必须要实现tableview代理及数据源，
    2.再nib中需要把tableview的代理及数据源与文件拥有者链接起来。
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib=[UINib nibWithNibName:@"MyTableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"mycell"];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableview
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
    static NSString *str=@"mycell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    //设置单元格选中时背景不发生变化
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    if (cell==nil) {
//        
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
//    }
 //cell.textLabel.text=[NSString stringWithFormat:@"%02d",(int)indexPath.row];
    
    return cell;
}

//可以调节左侧文本标签离左侧的距离。
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
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

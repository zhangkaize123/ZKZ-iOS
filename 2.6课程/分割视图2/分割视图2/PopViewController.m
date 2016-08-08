//
//  PopViewController.m
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    array=[NSArray arrayWithObjects:@"中文",@"拼音" ,nil];
    
    self.view.backgroundColor=[UIColor brownColor];
    
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.delegate=self;
    tableview.dataSource=self;
}
#pragma mark - tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *s=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:s];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:s];
    }
    cell.backgroundColor=[UIColor orangeColor];
    cell.textLabel.text=array[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0)
    {
        [[NSNotificationCenter defaultCenter ]postNotificationName:@"ZHONGWEN" object:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter ]postNotificationName:@"PINYIN" object:nil];
    }
    NSLog(@"indexpath=%d",indexPath.row);
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

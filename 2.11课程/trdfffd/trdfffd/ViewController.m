//
//  ViewController.m
//  trdfffd
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UINib *nib=[UINib nibWithNibName:@"MycellEmpty" bundle:nil];
    [self.tableviewiiii registerNib:nib forCellReuseIdentifier:@"mycell"];
    // Do any additional setup after loading the view, typically from a nib.
}

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
    myTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
//    if (cell==nil)
//    {
//        cell=[[myTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
//    }
    cell.textLabel.text=@"23456";
    //方法1
    //UILabel *lable=(UILabel *)[self.view viewWithTag:10];
    //lable.text=@"abc";
    
    //cell.showlable.text=@"456";
    return cell;
    
}
//设置的使cell.textLabel.text 移动的距离
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

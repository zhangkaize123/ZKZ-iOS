//
//  mainViewController.m
//  表示图1
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()

@end

@implementation mainViewController
@synthesize names;
- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor brownColor];
    names=[NSMutableArray arrayWithObjects:@"zs",@"lis",@"wangwu",@"zhaoliu", nil];
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    [self.view addSubview:self.tableview];
    self.tableview.dataSource=self;
    self.tableview.delegate=self;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//确定有几个区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//确定有几行

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    
    cell.textLabel.text=names[indexPath.row];
    
    
    return cell;
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

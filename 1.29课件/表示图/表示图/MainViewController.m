//
//  MainViewController.m
//  表示图
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "MyTableViewCell.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    names=[[NSArray alloc]initWithObjects:@"张三",@"里斯",@"王五",@"赵柳", nil];
    UITableView *tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    
    [self.view addSubview:tableview];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//分区的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return names.count;
}
//单元格
/*
 左————》右 1.图片  2.text.lable    3.detail.lable   4.附件
 
 
 */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MyTableViewCell *cell;
    static NSString *cellid=@"cell";
    cell= [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil)
    {
        cell=[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.inputext.text=names[indexPath.row];
//    NSInteger row=indexPath.row;
//    if (row%2)
//    {
//        cell.backgroundColor=[UIColor yellowColor];
//    }
    //cell.imageView.image=[UIImage imageNamed:@"yumi.jpg"];
//    cell=[UITableView dequeueReusableCellWithIdentifier:cellid];
//    
//    if (cell==nil)
//    {
//        
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
//    }
//    
//    cell.textLabel.text=names[indexPath.row];
//    //图片
//    cell.imageView.image=[UIImage imageNamed:@"yumi.jpg"];
//    //详细标签
//    cell.detailTextLabel.text=@"男";
//    //附件的详细按钮
    //cell.accessoryType=UITableViewCellAccessoryDetailButton;
    //附件的标记
    //cell.accessoryType=UITableViewCellAccessoryCheckmark;
    //附件的按钮和。。
    //cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //indexPath.section
    //NSLog(@"section=%ld",(long)indexPath.section);
    //NSLog(@"row=%ld",(long)indexPath.row);
   return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"xxxxx");
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

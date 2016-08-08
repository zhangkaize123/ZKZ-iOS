//
//  MenuTableViewController.m
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MenuTableViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController



- (void)viewDidLoad
{
    path=[NSHomeDirectory() stringByAppendingPathComponent:@"persons.plist"];
    NSLog(@"%@",path);
    //创建数组对象
    self.allnames=[[NSMutableArray alloc]initWithContentsOfFile:path];
    if (self.allnames==nil)
    {
        self.allnames=[[NSMutableArray alloc]init];
    }
    //self.allnames=[[NSMutableArray alloc]init];
    //增加联系人通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addpesonTage:) name:@"ADD" object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editpesonTage:) name:@"EDIT" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zhongwenTage:) name:@"ZHONGWEN" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pinyinTage:) name:@"PINYIN" object:nil];
    self.title=@"菜单";
    [super viewDidLoad];
    //创建左侧edit按钮--------以前未用过注意》》》》》》》
    //***********************************************************
    
        self.navigationItem.leftBarButtonItem=self.editButtonItem;
    
    //***********************************************************
    //创建右侧按钮add
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTage:)];
    self.navigationItem.rightBarButtonItem=right;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark - 通知方法
-(void)addpesonTage:(id)obj
{
    NSString *string=[obj object];
    NSLog(@"string=%@",string);
    [self.allnames addObject:string];
    [self.allnames writeToFile:path atomically:YES];
}
//-(void)editpesonTage:(id)obj
//{
//    NSString *string1=[obj object];
//    NSLog(@"%@",string1);
//    [self.allnames replaceObjectAtIndex:indexp.row withObject:string1];
//    //self.allnames[indexp.row]=string1;
//    //UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexp];
//    //cell.textLabel.text=string1;
//    [self.allnames writeToFile:path atomically:YES];
//    [self.tableView reloadData];
//    
//    
//}
-(void)zhongwenTage:(id)obj
{
    [self.allnames removeAllObjects];
    [self.allnames addObjectsFromArray:savenames];
    //NSLog(@"");
    [self.tableView reloadData];
}
-(void)pinyinTage:(id)obj
{
    savenames=[[NSMutableArray alloc]init];
    savenames=[self.allnames mutableCopy];
    [self.allnames removeAllObjects];

    NSLog(@"拼音");
    for (NSString *s1 in savenames)
    {
        NSString *s2=[self phonetic:s1];
        [self.allnames addObject:s2];
    }
    [self.tableView reloadData];
    
    
}
- (NSString *) phonetic:(NSString*)sourceString {
    NSMutableString *source = [sourceString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleDelete;
//}
#pragma mark - uibarbutton
//菜单项添加按钮
-(void)addTage:(UIBarButtonItem *)sender
{
    
    //NSLog(@"这是addTagebutton");
    AddViewController *addVc=[[AddViewController alloc]init];
    [self.navigationController pushViewController:addVc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.allnames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mycell=@"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mycell];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mycell];
    }
    cell.textLabel.text=self.allnames[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexp=indexPath;
    NSString *s=self.allnames[indexPath.row];
    //NSLog(@"");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"SHOW" object:s];
    
}
//删除操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"删除按钮");
    p=indexPath;
    NSLog(@"%d",p.row);
    
    
    
    
//                [self.allnames removeObjectAtIndex:indexPath.row];
//        
//    
//            [self.allnames writeToFile:path atomically:YES];
//        
//            [self.tableView reloadData];
    
    
    //报警条操作
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请回答" message: @"你确定要删除吗"delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
//    [alert show];
    //操作表操作
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"delete" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
    
    
}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex==0)//是
//    {
//        [self.allnames removeObjectAtIndex:p.row];
//    }
//    //重新加载数据
//    [self.allnames writeToFile:path atomically:YES];
//    [self.tableView reloadData];
//}

//操作表实现方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"asfnasofjas");
//    if (buttonIndex==0)
//    {
//        [self.allnames removeObjectAtIndex:p.row];
//        
//    }
//    [self.allnames writeToFile:path atomically:YES];
//    
//    [self.tableView reloadData];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

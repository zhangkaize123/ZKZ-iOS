//
//  ViewController.m
//  编辑表示图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{/*
  布局关系
  底层是view－－－》1.UIsearchbar
                  2.tableview
  
  
  */
    
    self.names=[[NSMutableArray alloc]init];
    [self.names addObject:@"zs"];
    [self.names addObject:@"ls"];
    [self.names addObject:@"ys"];
    [self.names addObject:@"is"];
    [self.names addObject:@"zu"];
    //[self.names addObject:UITableViewIndexSearch];
    self.currentnames=[self.names mutableCopy];
    //搜索栏设置
    sb=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    
    sb.autocapitalizationType=UITextAutocapitalizationTypeNone;
    //sb.showsCancelButton=YES;
    //修改字符集
    sb.delegate=self;
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.dataSource=self;
    tableview.delegate=self;
    
    //1.加tableview
    //tableview.tableHeaderView=sb;
    //2.加在self.view
    [self.view addSubview:sb];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentnames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        
    }
    cell.textLabel.text=self.currentnames[indexPath.row];
    return cell;
    
}

//1.表示图删除功能。
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    delename=indexPath.row;
    sectioname=indexPath.section;
    NSLog(@"%ld",(long)sectioname);
    //如果是多个区如何删除。
    // 1.警报－－－－》方法1alert
    /*UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请回答" message: @"你确定要删除吗"delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
    [alert show];*/
    //操作表-－－－－》方法2
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
    
}
//操作表方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)//是
    {
        [self.names removeObjectAtIndex:delename];
    }
    //重新加载数据
    [tableview reloadData];

}
//消息对话框方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)//是
    {
        [self.names removeObjectAtIndex:delename];
    }
    //重新加载数据
    [tableview reloadData];
}





//2.搜索功能
//搜索栏键盘按钮
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //searchBar,text---.>搜索内容
    //对searchBar,text进行校验
    NSString *str=searchBar.text;
    NSLog(@"%@",searchBar.text);
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(str.length>0)//有搜索内容
    {
        [self.currentnames removeAllObjects];//清空显示内容
        for(NSString * s in self.names)
        {
            if([s containsString:str])
            {
                [self.currentnames addObject:s];
            }
        }
    }
    [tableview reloadData];//更新的时候走表格单元吗
    
}

//取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar

{
    //取消
    
    NSLog(@"这是取消按钮");
    sb.showsCancelButton =NO;
    searchBar.text=@"";
    //点击取消按钮时要呈现所有的数据
    self.currentnames=[self.names mutableCopy];
    [tableview reloadData];
    
    
    
}
//编辑searchbar栏
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    sb.showsCancelButton=YES;
    //NSLog(@"这是seacher bar%@",searchBar.text);
}



@end

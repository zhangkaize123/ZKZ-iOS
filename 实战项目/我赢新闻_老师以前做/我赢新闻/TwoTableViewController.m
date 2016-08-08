//
//  TwoTableViewController.m
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-28.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "TwoTableViewController.h"
#import "ZHQNews.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "DetailViewController.h"
@interface TwoTableViewController ()

@end

@implementation TwoTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title=@"排行榜";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Reachability * reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status=[reach currentReachabilityStatus];
    self.news=[[NSMutableArray alloc]initWithCapacity:100];
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    if(status==NotReachable)//如果没有网络
    {
        //NSLog(@"没有网络!");
        [self loadLocalData];//加载本地数据
    }
    else//有网络
    {
        [self loadData];//加载远端数据
    }
    [SVProgressHUD dismiss];
    
}
-(void)loadData
{
    //清空集合
    [self.news removeAllObjects];
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    
    [db executeUpdate:@"delete from orders"];
    NSURL * url=[NSURL URLWithString:@"http://127.0.0.1/news/getorders.php"];
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data!=nil)
    {
        //对数据进行json解析
        NSArray * news=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if(news==nil)
        {
            UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"新闻加载失败，请稍后再试！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
        if([news count]>0)
        {
            for(NSDictionary * dict in news)
            {
                NSArray * keys=[dict allKeys];
                ZHQNews * xinwen=[[ZHQNews alloc]init];
                for(NSString * str in keys)
                {
                    //对对象的属性一一賦值kvc
                    [xinwen setValue:[dict objectForKey:str] forKey:str];
                }
                NSString * imgName=[NSString stringWithFormat:@"http://127.0.0.1/news/images/%@",xinwen.picture];
                //NSLog(@"%@",imgName);
                
                NSURL * url=[NSURL URLWithString:imgName];
                NSURLRequest * request=[NSURLRequest requestWithURL:url];
                NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                xinwen.img=[UIImage imageWithData:data];
                [self.news addObject:xinwen];
                
                BOOL b=[db executeUpdate:@"insert into orders(idid,title,subtitle,picture,content,author,flid,time,clicks,pic) values(?,?,?,?,?,?,?,?,?,?)",xinwen.idid,xinwen.title,xinwen.subtitle,xinwen.picture,xinwen.content,xinwen.author,xinwen.flid,xinwen.time,xinwen.clicks,data];
                if(!b)
                {
                    NSLog(@"insert into error!");
                }
            }
        }
        [self.tableView reloadData];
    }
    else
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"新闻加载失败，请稍后再试！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
-(void)loadLocalData
{
    //清空集合
    [self.news removeAllObjects];
    NSLog(@"从本地加载数据!");
    //获得数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    FMResultSet * rs=[db executeQuery:@"select * from orders"];
    while ([rs next])
    {
        ZHQNews * news=[[ZHQNews alloc]init];
        news.title=[rs stringForColumn:@"title"];
        news.subtitle=[rs stringForColumn:@"subtitle"];
        news.idid=[NSNumber numberWithInt:[rs intForColumn:@"idid"]];
        news.picture=[rs stringForColumn:@"picture"];
        news.content=[rs stringForColumn:@"content"];
        news.author=[rs stringForColumn:@"author"];
        news.time=[rs stringForColumn:@"time"];
        news.flid=[NSNumber numberWithInt:[rs intForColumn:@"flid"]];
        news.clicks=[NSNumber numberWithInt:[rs intForColumn:@"clicks"]];
        NSData * data=[rs dataNoCopyForColumn:@"pic"];
        news.img=[UIImage imageWithData:data];
        [self.news addObject:news];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        //表格的样式是子标题的样式
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    ZHQNews * news=self.news[indexPath.row];
    //标题
    cell.textLabel.text=news.title;
    //子标题
    cell.detailTextLabel.text=news.subtitle;
    //显示图片
    cell.imageView.image=news.img;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detail=[[DetailViewController alloc]initWithNibName:nil bundle:nil];
    detail.news=self.news[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}
@end

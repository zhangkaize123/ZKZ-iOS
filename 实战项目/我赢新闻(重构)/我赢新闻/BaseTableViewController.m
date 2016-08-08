//
//  BaseTableViewController.m
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
#pragma mark - view

- (void)viewDidLoad {
    [super viewDidLoad];
    self.news=[[NSMutableArray alloc]init];
}
#pragma mark - myself
-(void)loadDataWithDatabase
{
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    //清空集合
    [self.news removeAllObjects];
    [self.tableView reloadData];
    //获得数据库对象
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray * arr=[[NSMutableArray alloc]init];
        AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
        FMDatabase * db=app.db;
        NSString * sql=[NSString stringWithFormat:@"select * from saves"];
        FMResultSet * rs=[db executeQuery:sql];
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
            [arr addObject:news];
        }
        [self performSelectorOnMainThread:@selector(showData:) withObject:arr waitUntilDone:YES];
    });

}
-(void)loadDataWithDatabaseWithFlid:(int)_id
{
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    //清空集合
    [self.news removeAllObjects];
    [self.tableView reloadData];
    //获得数据库对象
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray * arr=[[NSMutableArray alloc]init];
        AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
        FMDatabase * db=app.db;
        NSString * sql=[NSString stringWithFormat:@"select * from news where flid=%d",_id];
        FMResultSet * rs=[db executeQuery:sql];
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
            [arr addObject:news];
        }
        [self performSelectorOnMainThread:@selector(showData:) withObject:arr waitUntilDone:YES];
    });
}
-(void)showData:(NSMutableArray *)_array
{
    self.news=_array;
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
}
-(void)loadDataWithNetworkWithString:(NSString *)_str
{
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    //得到数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        NSURL * url=[NSURL URLWithString:_str];
        NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
        NSError * err;
        NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
        if(data!=nil)
        {
            [self performSelectorOnMainThread:@selector(actionData:) withObject:data waitUntilDone:YES];
        }
        else
        {
            [ZHQUtil alert:@"新闻加载失败，请稍后再试！"];
            [SVProgressHUD dismiss];
        }
    });
}
-(void)loadDataWithNetworkWithFlid:(int)_id
{
    //提示加载
    [SVProgressHUD showWithStatus:@"加载中..." maskType:SVProgressHUDMaskTypeBlack];
    //得到数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    //清除数据库中保存的数据
    NSString * sql=[NSString stringWithFormat:@"delete from news where flid=%d",_id];
    [db executeUpdate:sql];
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
    NSString * strUrl=[NSString stringWithFormat:@"%@getnews.php?id=%d",[ZHQUtil hostname],_id];
    NSURL * url=[NSURL URLWithString:strUrl];
    
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    NSError * err;
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    
    if(data!=nil)
    {
        [self performSelectorOnMainThread:@selector(actionData:) withObject:data waitUntilDone:YES];
    }
    else
    {
        [ZHQUtil alert:@"新闻加载失败，请稍后再试！"];
        [SVProgressHUD dismiss];
    }
    });
}
-(void)actionData:(NSData *)_data
{
    //清空集合
    [self.news removeAllObjects];
    [self.tableView reloadData];
    //得到数据库对象
    AppDelegate * app=(AppDelegate * )[UIApplication sharedApplication].delegate;
    FMDatabase * db=app.db;
    //对数据进行json解析
    NSArray * news=[NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableLeaves error:nil];
    if(news==nil)//返回的数据无效
    {
        [ZHQUtil alert:@"新闻加载失败，请稍后再试！"];
        [SVProgressHUD dismiss];
        return;
    }
    if([news count]>0)//有新闻
    {
        
        for(NSDictionary * dict in news)//遍历每个新闻
        {
            NSArray * keys=[dict allKeys];
            ZHQNews * xinwen=[[ZHQNews alloc]init];
            for(NSString * str in keys)
            {
                //对对象的属性一一賦值kvc
                [xinwen setValue:[dict objectForKey:str] forKey:str];
            }
            //下载图片
            NSString * imgName=[NSString stringWithFormat:@"%@images/%@",[ZHQUtil hostname],xinwen.picture];
            NSURL * url=[NSURL URLWithString:imgName];
            NSURLRequest * request=[NSURLRequest requestWithURL:url];
            NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            xinwen.img=[UIImage imageWithData:data];
            [self.news addObject:xinwen];
            //把数据写入数据库
            BOOL b=[db executeUpdate:@"insert into news(idid,title,subtitle,picture,content,author,flid,time,clicks,pic) values(?,?,?,?,?,?,?,?,?,?)",xinwen.idid,xinwen.title,xinwen.subtitle,xinwen.picture,xinwen.content,xinwen.author,xinwen.flid,xinwen.time,xinwen.clicks,data];
            if(!b)
            {
                [ZHQUtil alert:@"数据本地保存失败！"];
            }
        }
    }
    [self.tableView reloadData];
    [SVProgressHUD dismiss];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
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
}@end

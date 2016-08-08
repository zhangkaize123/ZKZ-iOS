//
//  ThreeViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ThreeViewController.h"
#import "Reachability.h"
#import "ZKZNews.h"
#import "FMDB.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "ContentViewController.h"
@interface ThreeViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *allnews;
@property(nonatomic,strong)Reachability *reach;
@property(nonatomic,strong)NSMutableArray *presentArray;
@end

@implementation ThreeViewController
@synthesize reach;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.allnews=[NSMutableArray array];
    self.presentArray=[NSMutableArray array];
    //判断网络
    self.reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status=self.reach.currentReachabilityStatus;
    [SVProgressHUD showWithStatus:@"正在加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
    if (status==NotReachable) {//没有网络
        [self loadlocationNews];
    }else{//有网路
        [self loadNews];
    }
    [SVProgressHUD dismiss];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.searchView.delegate=self;
    
}
#pragma mark---有网络的时候加载－－－sqlite加载
-(void)loadlocationNews
{
    //清空集合
    [self.allnews removeAllObjects];
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    
    FMResultSet *rs=[db executeQuery:@"select * from newsorder"];
    if ([rs next]) {
        while ([rs next]) {
            ZKZNews *news=[[ZKZNews alloc]init];
            news.title=[rs stringForColumn:@"title"];
            news.subtitle=[rs stringForColumn:@"subtitle"];
            news.idid=[NSNumber numberWithInt:[rs intForColumn:@"idid"]];
            news.picture=[rs stringForColumn:@"picture"];
            news.content=[rs stringForColumn:@"content"];
            news.author=[rs stringForColumn:@"author"];
            news.time=[rs stringForColumn:@"time"];
            news.click=[NSNumber numberWithInt:[rs intForColumn:@"click"]];
            news.flid=[NSNumber numberWithInt:[rs intForColumn:@"flid"]];
            news.img=[UIImage imageWithData:[rs dataForColumn:@"pic"]];
            [self.allnews addObject:news];
        }
        self.presentArray=[_allnews mutableCopy];
        
    }else{
        NSLog(@"没有");
    }
    
}

#pragma mark---有网络的时候加载－－－网络加载
-(void)loadNews
{
    //清空所有数据
    [self.allnews removeAllObjects];
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    //删除数据库所有数据
    BOOL delb=[db executeUpdate:@"delete from newsorder"];
    if (!delb) {
        NSLog(@"删除失败");
    }
    NSURL *url=[NSURL URLWithString:@"http://127.0.0.1/news/getorder.php"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (data!=nil) {
        if (array.count>0) {
            for (NSDictionary *dic in array) {
                //字典转模型
                ZKZNews *news=[[ZKZNews alloc]init];
                [news setValuesForKeysWithDictionary:dic];
                //加载图片
                NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/images/%@",news.picture];
                NSURL *url=[NSURL URLWithString:urlStr];
                NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
                NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
                news.img=[UIImage imageWithData:data];
                //把数据放到数组中去
                [self.allnews addObject:news];
                //把数据放到本地sqlite
                BOOL b=[ db executeUpdate:@"insert into newsorder(idid,title,subtitle,picture,content,author,flid,click,time,pic) values(?,?,?,?,?,?,?,?,?,?)",news.idid,news.title,news.subtitle,news.picture,news.content,news.author,news.flid,news.click,news.time,data];
                if (!b) {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有数据增加失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            self.presentArray=[_allnews mutableCopy];
        }
        if(array==nil){
            //提示
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有数据返回" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    
}
#pragma mark---tableview 代理 和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.presentArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"news";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@""];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    ZKZNews *news=[self.presentArray objectAtIndex:indexPath.row];
    cell.textLabel.text=news.title;
    cell.detailTextLabel.text=news.subtitle;
    cell.imageView.image=news.img;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentViewController *contentVc=[[ContentViewController alloc]init];
    ZKZNews *news=[self.allnews objectAtIndex:indexPath.row];
    NetworkStatus status=[reach currentReachabilityStatus];
    if(status==1||status==2)
    {//如果有网路就在mysql中加载数据
        NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/addclick.php?id=%@",news.idid];
        NSURL *url=[NSURL URLWithString:urlStr];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString*str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    }
    //点击增加点击数
    contentVc.news=news;
    [self.navigationController pushViewController:contentVc animated:YES];
}
#pragma mark--------有网络时搜索加载
-(void)loadSearchNewsWith:(NSString *)str
{
    //清空所有数据
    [self.presentArray removeAllObjects];
    NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/findnews.php?titlename=%@",str];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSString *s=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",s);
    NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (data!=nil) {
        if (array.count>0) {
            for (NSDictionary *dic in array) {
                //字典转模型
                ZKZNews *news=[[ZKZNews alloc]init];
                [news setValuesForKeysWithDictionary:dic];
                //加载图片
                NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/images/%@",news.picture];
                NSURL *url=[NSURL URLWithString:urlStr];
                NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
                NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
                news.img=[UIImage imageWithData:data];
                //把数据放到数组中去
                [self.presentArray addObject:news];
                
            }
        }
        if(array==nil){
            //提示
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有数据返回" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
        
    }
    
}
#pragma mark--------无网络时搜索加载
-(void)loadlocationNewsWith:(NSString *)str
{
    //清空集合
    [self.presentArray removeAllObjects];
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    
    FMResultSet *rs=[db executeQuery:@"select * from newsorder where title like ?",str];
    if ([rs next]) {
        while ([rs next]) {
            ZKZNews *news=[[ZKZNews alloc]init];
            news.title=[rs stringForColumn:@"title"];
            news.subtitle=[rs stringForColumn:@"subtitle"];
            news.idid=[NSNumber numberWithInt:[rs intForColumn:@"idid"]];
            news.picture=[rs stringForColumn:@"picture"];
            news.content=[rs stringForColumn:@"content"];
            news.author=[rs stringForColumn:@"author"];
            news.time=[rs stringForColumn:@"time"];
            news.click=[NSNumber numberWithInt:[rs intForColumn:@"click"]];
            news.flid=[NSNumber numberWithInt:[rs intForColumn:@"flid"]];
            news.img=[UIImage imageWithData:[rs dataForColumn:@"pic"]];
            [self.presentArray addObject:news];
        }
        
    }else{
        NSLog(@"没有");
    }
    
}
#pragma mark------- 搜索栏的代理方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   NSString *str=searchBar.text;
    //去除空格操作
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(str.length>0)//有搜索内容
    {
        NetworkStatus status=self.reach.currentReachabilityStatus;
        [SVProgressHUD showWithStatus:@"正在加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
        if (status==NotReachable) {//没有网络
            [self loadlocationNewsWith:str];
        }else{//有网路
            [self loadSearchNewsWith:str];
        }
        [SVProgressHUD dismiss];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"搜索结果不能为空 " delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    [self.searchView resignFirstResponder];
}

//取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar

{
    //取消
    
       self.searchView.showsCancelButton=NO;
    searchBar.text=@"";
    //点击取消按钮时要呈现所有的数据
    self.presentArray=[_allnews mutableCopy];
    [self.tableView reloadData];
    [self.searchView resignFirstResponder];
    
    
}
//编辑searchbar栏
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchView.showsCancelButton=YES;
}

@end


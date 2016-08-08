//
//  TwoViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "TwoViewController.h"
#import "Reachability.h"
#import "ZKZNews.h"
#import "FMDB.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "ContentViewController.h"
@interface TwoViewController ()
@property(nonatomic,strong)Reachability *reach;
@property(nonatomic,strong)NSMutableArray *allnews;
@end

@implementation TwoViewController
@synthesize reach;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.allnews=[NSMutableArray array];
    self.navigationItem.title=@"排行榜";
    //检测是否有网络
    //创建监测网路对象
    self.reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status=self.reach.currentReachabilityStatus;
    [SVProgressHUD showWithStatus:@"正在加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
    if (status==NotReachable) {//没有网络
        [self loadlocationNews];
    }else{//有网路
        [self loadNews];
    }
    [SVProgressHUD dismiss];
}
#pragma mark---有网络的时候加载－－－sqlite加载
-(void)loadlocationNews
{
    //清空集合
    [self.allnews removeAllObjects];
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    
    FMResultSet *rs=[db executeQuery:@"select * from xinwenpaixu"];
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
    BOOL delb=[db executeUpdate:@"delete from xinwenpaixu"];
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
                BOOL b=[ db executeUpdate:@"insert into xinwenpaixu(idid,title,subtitle,picture,content,author,flid,click,time,pic) values(?,?,?,?,?,?,?,?,?,?)",news.idid,news.title,news.subtitle,news.picture,news.content,news.author,news.flid,news.click,news.time,data];
                if (!b) {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有数据增加失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
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
    return self.allnews.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"news";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@""];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    ZKZNews *news=[self.allnews objectAtIndex:indexPath.row];
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

@end

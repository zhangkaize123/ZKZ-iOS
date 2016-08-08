//
//  OneViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OneViewController.h"
#import "ZKZScrollView.h"
#import "ZKZNews.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "FMDB.h"
#import "Reachability.h"
#import "ContentViewController.h"
@interface OneViewController ()
//保存分类的所有新闻
@property(nonatomic,strong)NSMutableArray *news;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建集合
    self.news=[NSMutableArray array];
    //检测网路
    reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    //加载数据
    [SVProgressHUD showWithStatus:@"正在加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
    //通过网路来判断是在mysql中拿数据还是在sqlite中拿数据
    NetworkStatus status=[reach currentReachabilityStatus];
    //没有网路从本地加载数据
    if (status==NotReachable) {
        [self loadlocalData];
        NSLog(@"没网路");
    }
    else{//如果有网路就在mysql中加载数据
        [self loadNewsWith:1];
        NSLog(@"有网路");
    }
    [SVProgressHUD dismiss];
    //创建滚动条
    ZKZScrollView *scrollView=[[ZKZScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 20, 320, 44);
    NSArray *array=[NSArray arrayWithObjects:@"新闻",@"国内",@"社会",@"公益",@"国际", nil];
    for (int i=0; i<5; i++) {
        UIButton *one=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        one.layer.cornerRadius=22;
        one.tag=i;
        [one addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
        //one.backgroundColor=[UIColor greenColor];
        [one setTitle:array[i] forState:UIControlStateNormal];
        one.frame=CGRectMake(0, 0, 100, 44);
        if (one.tag==0) {
            [one setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [scrollView addBtton:one];
    }
    self.navigationItem.titleView=scrollView;
}
#pragma mark----没有网络时候点击其他按钮显示数据

#pragma mark----没有网络的时候加载数据
-(void)loadlocalData
{
    //清空集合
    [self.news removeAllObjects];
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    
    FMResultSet *rs=[db executeQuery:@"select * from news"];
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
            [self.news addObject:news];
        }

    }else{
        NSLog(@"没有");
    }
    
    
    
    
    
}
#pragma mark----有网络的时候加载数据
-(void)loadNewsWith:(int)flid
{
    //清空集合
    [self.news removeAllObjects];
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    BOOL delb=[db executeUpdate:@"delete from news"];
    if (!delb) {
        NSLog(@"删除失败");
    }
    NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/getnews.php?id=%d",flid];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data!=nil) {
        NSArray *news=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%d",news.count);
        if (news.count>0) {
            for (NSDictionary *dic in news) {
                ZKZNews *news=[[ZKZNews alloc]init];
                [news setValuesForKeysWithDictionary:dic];
                //加载图片
                NSString *imgStr=[NSString stringWithFormat:@"http://127.0.0.1/news/images/%@",news.picture];
                NSURL *url=[NSURL URLWithString:imgStr];
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                news.img=[UIImage imageWithData:data];
                //添加到数据中
                [self.news addObject:news];
                //把数据插入到本地数据库中
               BOOL b=[ db executeUpdate:@"insert into news(idid,title,subtitle,picture,content,author,flid,click,time,pic) values(?,?,?,?,?,?,?,?,?,?)",news.idid,news.title,news.subtitle,news.picture,news.content,news.author,news.flid,news.click,news.time,data];
                if (!b) {
                    NSLog(@"插入出错");
                }
            }
        }
        if (news==nil)
        {
            //没有数据返回
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有数据返回" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
#pragma mark----点击导航栏按钮的实现行为
-(void)oktap:(UIButton *)sender
{
    int flid=(int)(sender.tag+1);
    NSLog(@"%d",flid);
    ZKZScrollView *scrollview=(ZKZScrollView *)self.navigationItem.titleView;
    [scrollview clearColor];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [SVProgressHUD showWithStatus:@"正在加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
    NetworkStatus status=[reach currentReachabilityStatus];
    //没有网路从本地加载数据
    if (status==NotReachable) {
        //点击按钮的得到相应的数据
        
        [self loadlocalData];
        NSLog(@"没网路");
    }
    else{//如果有网路就在mysql中加载数据
        [self loadNewsWith:flid];
        NSLog(@"有网路");
    }
    [SVProgressHUD dismiss];
    [self.tableView reloadData];
    
}

#pragma tableview数据源和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"news";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    ZKZNews *news=[self.news objectAtIndex:indexPath.row];
    //标题
    cell.textLabel.text=news.title;
    //子标题
    cell.detailTextLabel.text=news.subtitle;
    //显示图片
    cell.imageView.image=news.img;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentViewController *contentVc=[[ContentViewController alloc]init];
    ZKZNews *news=[self.news objectAtIndex:indexPath.row];
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

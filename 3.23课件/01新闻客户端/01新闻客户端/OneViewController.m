//
//  OneViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OneViewController.h"
#import "ZKZHeadView.h"
#import "ZKZShowView.h"
#import "ZKZNews.h"
#import "ZKZGroupNews.h"
#import "ZKZTableView.h"
@interface OneViewController ()<ZKZHeadViewdelegate>
{
    ZKZTableView *tableView;
}
@property(nonatomic,strong)NSMutableArray *allArray;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建所用新闻的数组
    self.allArray=[NSMutableArray array];
    //1.检测网路
    self.view.backgroundColor=[UIColor whiteColor];
    //创建标签栏按钮
    ZKZHeadView *headView=[ZKZHeadView loadView];
    //指定headView的代理
    headView.delegate=self;
    self.navigationItem.titleView =headView;
    //创建显示图片的滚动视图
    ZKZShowView *showView=[ZKZShowView loadView];
    //加到view上
    [self.view addSubview:showView];
    //创建表示图
    tableView=[ZKZTableView loadView];
    [self.view addSubview:tableView];
    
    
}
#pragma mark------headView 代理实现方法
-(void)sendButtonName:(NSString *)buttonName andName:(NSArray *)array
{
    int number=(int)([array indexOfObject:buttonName]+1);
    //开辟一条线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //加载数据
            NSString *urlStr=[NSString stringWithFormat:@"http://127.0.0.1/news/getnews.php?id=%d",number];
            NSURL *url=[NSURL URLWithString:urlStr];
            NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
            NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
            //使用json解析
            NSArray *arr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            ZKZGroupNews *groupNews=[[ZKZGroupNews alloc]init];
            groupNews.groups=[NSMutableArray array];
            for (NSDictionary *dic in arr) {
                ZKZNews *news=[[ZKZNews alloc]init];
                [news setValuesForKeysWithDictionary:dic];
                /*news.number=[[dic objectForKey:@"id"]intValue];
                news.title=[dic objectForKey:@"title"];
                news.subtitle=[dic objectForKey:@"subtitle"];
                news.picture=[dic objectForKey:@"picture"];
                news.content=[dic objectForKey:@"content"];
                news.flid=[[dic objectForKey:@"flid"]intValue];
                news.click=[[dic objectForKey:@"click"]intValue];
                news.author=[dic objectForKey:@"author"];
                news.time=[dic objectForKey:@"time"];*/
                [groupNews.groups addObject:news];
            }
            [self.allArray addObject:groupNews];
        //传递模型数据
        tableView.group=groupNews;
        
    });
    
    
}
//


@end

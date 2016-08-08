//
//  FourViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "FourViewController.h"
#import "FMDatabase.h"
#import "AppDelegate.h"
#import "MJRefresh.h"
#import "ZKZNews.h"
@interface FourViewController ()
{
    int count;
    int totalcount;
    int flag;
}
@property(nonatomic,strong)NSMutableArray *allnews;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.backgroundColor=[UIColor orangeColor];
    self.allnews=[NSMutableArray array];
    
    totalcount=0;
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    FMResultSet *rs=[db executeQuery:@"select * from savenews "];
    while ([rs next]) {
        totalcount++;
    }
    NSLog(@"%d",totalcount);
    self.navigationItem.title=@"收藏";
    //
    count=16;
    //上拉
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
    [self.tableView.header setTitle:@"上拉可以更新" forState:MJRefreshHeaderStateIdle];
    [self.tableView.header setTitle:@"重新加载中" forState:MJRefreshHeaderStatePulling];
    [self.tableView.header setTitle:@"加载中 ..." forState:MJRefreshHeaderStateRefreshing];
    
    // 设置字体
    self.tableView.header.font = [UIFont systemFontOfSize:15];
    
    // 设置颜色
    self.tableView.header.textColor = [UIColor blueColor];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];

    //下拉
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置文字
    [self.tableView.footer setTitle:@"下拉可以加载更多" forState:MJRefreshFooterStateIdle];
    [self.tableView.footer setTitle:@"加载中 ..." forState:MJRefreshFooterStateRefreshing];
    
    
    // 设置字体
    self.tableView.footer.font = [UIFont systemFontOfSize:17];
    
    // 设置颜色
    self.tableView.footer.textColor = [UIColor blueColor];
    
}
#pragma mark----上拉加载更多
-(void)loadMoreData
{
    [self loadDataWith:count andWith:2];
    if (count>=totalcount) {
        [self.tableView.footer setTitle:@"" forState:MJRefreshFooterStateIdle];
        [self.tableView.footer endRefreshing];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"没有更多的数据了！！！！！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return ;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.footer endRefreshing];
    });

    count+=2;
    
    
    
}
//下拉
- (void)loadNewData
{
    if (flag==1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 刷新表格
            
        });
        [self.tableView.header setTitle:@"没有更新的数据了 ..." forState:MJRefreshHeaderStateRefreshing];
        [self.tableView.header endRefreshing];
        return ;
    }
    [self loadDataWith:0 andWith:15];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    });
    flag=1;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allnews.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"news";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    ZKZNews *news=[self.allnews objectAtIndex:indexPath.row];
    cell.textLabel.text=news.title;
    cell.detailTextLabel.text=news.subtitle;
    return cell;
}
#pragma mark-----加载数据
-(void)loadDataWith:(int )flag andWith:(int )number
{
    
    
        AppDelegate *app=[UIApplication sharedApplication].delegate;
        FMDatabase *db=app.db;
        NSString * sqlStr = [NSString stringWithFormat:@"select * from savenews limit %d,%d ",flag,number];
        FMResultSet *rs=[db executeQuery:sqlStr];
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
                //NSLog(@"%@",news.title);
                //加到数组中去
                [self.allnews addObject:news];
                
                
            }
    
    
    
}
@end

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
}
@property(nonatomic,strong)NSMutableArray *allnews;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor=[UIColor orangeColor];
    self.allnews=[NSMutableArray array];
    count=0;
    totalcount=0;
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    FMResultSet *rs=[db executeQuery:@"select * from savenews "];
    if ([rs next]) {
        totalcount++;
    }
    NSLog(@"%d",totalcount);
    self.navigationItem.title=@"收藏";
    
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footrefresh)];
    
}
#pragma mark----上拉加载更多
-(void)footrefresh
{
    NSLog(@"*****");
        [self loadData];
    [self.tableView.footer endRefreshing];
    [self.tableView reloadData];
//    if (count>totalcount) {
//        
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"你收藏的新闻已经加载完了！！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
//        [alert show];
//        [self.tableView.footer endRefreshing];
//        return;
//    }

    count+=2;
    
    
    
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
-(void)loadData
{
    
    
        AppDelegate *app=[UIApplication sharedApplication].delegate;
        FMDatabase *db=app.db;
        NSString * sqlStr = [NSString stringWithFormat:@"select * from savenews limit %d,2 ",count];
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
                NSLog(@"%@",news.title);
                //加到数组中去
                [self.allnews addObject:news];
                
                
            }
    
    
    
}
@end

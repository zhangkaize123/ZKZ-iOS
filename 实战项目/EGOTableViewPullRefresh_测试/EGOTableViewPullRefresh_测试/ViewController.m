//
//  ViewController.m
//  EGOTableViewPullRefresh_测试
//
//  Created by 张凯泽 on 15-4-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "EGORefreshTableHeaderView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,EGORefreshTableHeaderDelegate,UIScrollViewDelegate>
{
    EGORefreshTableHeaderView *refreshView;
    BOOL reloading;
    NSTimer*timer;
    UITableView *tableView;
    NSMutableArray *listData;
    int count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    count=0;
   tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height ) style:UITableViewStylePlain];
    //[self.view addSubview:tableView];
    //tableView.delegate=self;
    //tableView.dataSource=self;
    
}
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    [self reloadTableViewDataSource];
}
#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [refreshView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [refreshView egoRefreshScrollViewDidEndDragging:scrollView];
    
}
#pragma mark - EGORefreshTableHeaderView Methods
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date]; // should return date data source was last changed
}

#pragma mark--tableviw
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    cell.textLabel.text=@"hahah";
    return cell;
}
#pragma mark Data Source Loading / Reloading Methods
//下拉动作触发事件调用的函数。在这里发送数据请求
- (void)reloadTableViewDataSource{
    
    //  should be calling your tableviews data source model to reload
    //  put here just for demo
    NSLog(@"dragging!!!");
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doneLoadingTableViewData) userInfo:nil repeats:NO];
    reloading = YES;
    
}
//请求结束函数。在这里要关闭下拉的视图.并更新表视图
- (void)doneLoadingTableViewData{
    
    //  model should call this when its done loading
    NSLog(@"stop loading");
    timer = nil;
    reloading = NO;
    [refreshView egoRefreshScrollViewDataSourceDidFinishedLoading:tableView];
    
    [listData addObject:[[NSString alloc] initWithFormat:@"%d",count]];
    count++;
    
    [tableView reloadData];
}
@end

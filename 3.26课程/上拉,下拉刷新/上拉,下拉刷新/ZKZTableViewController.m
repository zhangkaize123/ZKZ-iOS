//
//  ZKZTableViewController.m
//  上拉,下拉刷新
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTableViewController.h"

@interface ZKZTableViewController ()

@end

@implementation ZKZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //下拉刷新
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(Headrefresh)];
//上拉加载更多
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footrefresh)];
}

#pragma mark----下拉刷新
-(void)Headrefresh
{
    // 下拉结束刷新
    [self.tableView.header endRefreshing];
    NSLog(@"下拉刷新");
}
#pragma mark----上拉加载更多
-(void)footrefresh
{
    //结束上拉加载更多
    [self.tableView.footer endRefreshing];
    
    NSLog(@"加载更多");
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text=@"hello!";
    
    return cell;
}



@end

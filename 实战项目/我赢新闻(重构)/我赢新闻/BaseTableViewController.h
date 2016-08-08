//
//  BaseTableViewController.h
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHQNews.h"
#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "ZHQUtil.h"
#import "NSString+trim.h"
@interface BaseTableViewController : UITableViewController
//新闻
@property (strong,nonatomic) NSMutableArray * news;
-(void)loadDataWithDatabaseWithFlid:(int)_id;//本地加载数据
-(void)loadDataWithDatabase;//本地加载收藏数据
-(void)loadDataWithNetworkWithFlid:(int)_id;//网络加载数据
-(void)loadDataWithNetworkWithString:(NSString *)_str;//网络加载数据
@end

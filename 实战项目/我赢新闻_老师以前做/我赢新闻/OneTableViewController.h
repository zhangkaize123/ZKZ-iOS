//
//  OneTableViewController.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-26.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneTableViewController : UITableViewController
//保存当前分类的所有新闻
@property (strong,nonatomic) NSMutableArray * news;
@end

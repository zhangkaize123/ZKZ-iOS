//
//  ONETableViewController.h
//  我赢新闻
//
//  Created by wyzc on 15-4-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HScrollView.h"
@interface ONETableViewController : UITableViewController
{
    HScrollView * scrollView;
    int flId;
}
@property (strong,nonatomic) NSMutableArray * news;
@end

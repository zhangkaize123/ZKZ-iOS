//
//  MainTableViewController.h
//  导航视图练习
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController
{
    NSIndexPath *p;
    // *cell;
}
@property(strong,nonatomic)NSMutableArray *names;
@property(strong,nonatomic)NSString *updata;
@end

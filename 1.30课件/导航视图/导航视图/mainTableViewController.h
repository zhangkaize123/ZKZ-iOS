//
//  mainTableViewController.h
//  导航视图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainTableViewController : UITableViewController
{
    NSIndexPath * index;
    
}
@property(strong,nonatomic)NSMutableArray *names;
@property(strong,nonatomic)NSString * update;
@end

//
//  MenuViewController.h
//  分割视图
//
//  Created by wyzc on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@interface MenuViewController : UITableViewController
{
    NSMutableArray * names;
}
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) DetailViewController * detail;
@end

//
//  LanguageTableViewController.h
//  分割视图
//
//  Created by wyzc on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
@interface LanguageTableViewController : UITableViewController
{
    NSArray * names;
}
@property (strong,nonatomic) DetailViewController * detail;
@end

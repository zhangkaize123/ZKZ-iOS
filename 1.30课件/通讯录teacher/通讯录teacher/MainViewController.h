//
//  MainViewController.h
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
@interface MainViewController : UIViewController<passvalue,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableDictionary *allnames;
    NSArray *allkeys;
    UITableView *tableview;
    UISearchBar *searchbar;
    NSMutableDictionary *currentnames;
    NSMutableArray *currentkeys;
    NSString *path;
    NSIndexPath *indexp;
}
@end

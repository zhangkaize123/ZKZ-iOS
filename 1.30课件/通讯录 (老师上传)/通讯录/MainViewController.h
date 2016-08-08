//
//  MainViewController.h
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "ServiceDelegate.h"
@interface MainViewController : UIViewController<ServiceDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    //标记是搜索还是正常显示bool
    NSMutableDictionary * allPerson;//所有联系人
    NSArray * allKey;//关键字 拼音的一个大写字母
    NSMutableDictionary * showPerson;//显示联系人
    NSMutableArray * showKey;//显示关键字 拼音的一个大写字母
    NSIndexPath * current;//选中单元
}
@property (strong,nonatomic) UITableView * tableView;//表试图
@end

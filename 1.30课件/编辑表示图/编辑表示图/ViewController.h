//
//  ViewController.h
//  编辑表示图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIActionSheetDelegate,UISearchBarDelegate>
{
    NSInteger delename;
    UITableView *tableview;
    NSInteger sectioname;
    UISearchBar *sb;

}
@property (strong,nonatomic)NSMutableArray *names;
@property (strong,nonatomic)NSMutableArray *currentnames;
@end


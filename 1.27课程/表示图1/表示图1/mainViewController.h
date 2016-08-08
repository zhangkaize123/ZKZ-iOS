//
//  mainViewController.h
//  表示图1
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>;
@property(strong,nonatomic)UITableView*tableview;
@property(strong,nonatomic)NSMutableArray *names;
@end

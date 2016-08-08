//
//  MainTableViewController.m
//  故事版6
//
//  Created by 张凯泽 on 15-2-13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController
/*
 表示图2:静态单元问题总结1.拖拽一个导航栏，导航栏里边有表示图，2.添加主入口箭头
 3.在tableview --属性中contents里边－－－》static cell
 那里边有单元格样式 及分几个区。
 3.如果是使用单元格进入下一个界面使使用（show）
 如果使使用单元格上的按钮则使用（模态present）
 4.由于是静态单元格所以把MainTableViewController.m 里边的关于tableview的区，单元格都删除。
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

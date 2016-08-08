//
//  AppDelegate.h
//  数据库的操作
//
//  Created by 张凯泽 on 15-3-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//数据库的链接-------->让全局都看见；
@property(nonatomic,assign)sqlite3 *db;

@end


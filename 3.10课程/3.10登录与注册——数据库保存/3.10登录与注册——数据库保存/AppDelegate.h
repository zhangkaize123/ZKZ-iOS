//
//  AppDelegate.h
//  3.10登录与注册——数据库保存
//
//  Created by 张凯泽 on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign)sqlite3 *db;

@end


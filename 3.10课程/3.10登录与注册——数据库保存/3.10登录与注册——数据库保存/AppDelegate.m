//
//  AppDelegate.m
//  3.10登录与注册——数据库保存
//
//  Created by 张凯泽 on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize db;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"db.db"];
    NSLog(@"%@",path);
    //打开数据库
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK)
    {
        NSLog(@"打开失败");
    }
    //创建表格数据表
    char *error;
    char *sql="create table if not exists t_user(username text not null,password text not null)";
    if(sqlite3_exec(db, sql, NULL, NULL, &error)!=SQLITE_OK)
    {
        NSLog(@"创建表格失败%s",error);
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

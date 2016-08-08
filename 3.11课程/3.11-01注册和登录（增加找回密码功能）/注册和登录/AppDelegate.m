//
//  AppDelegate.m
//  注册和登录
//
//  Created by wyzc on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
/*
 
 如果想打开第二个数据库，那么应该再创建一个数据库对象。
 
 
 
 */
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize db,answerdb;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //得到已有文件的路径
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"zkzfmdb" ofType:@"sqlite"];
    NSLog(@"path=%@",path);
    //得到answer的路径
    NSString *answerpath=[bundle pathForResource:@"anwerdb" ofType:@"sqlite"];
    NSLog(@"answerpath=%@",answerpath);
    //创建answer的第三方库
    answerdb=[FMDatabase databaseWithPath:answerpath];
    //打开数据库
    if( ![answerdb open])
    {
        NSLog(@"answer库打开失败");
    }
    //创建第三方库
    db=[FMDatabase databaseWithPath:path];
    //打开数据库
    if(![db open])
    {
        NSLog(@"打开失败");
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
    //关闭数据库
    if([db close])
    {
        NSLog(@"关闭正常");
    }
    
    
}

@end

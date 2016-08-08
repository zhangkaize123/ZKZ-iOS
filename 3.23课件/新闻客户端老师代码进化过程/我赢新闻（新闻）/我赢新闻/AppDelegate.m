//
//  AppDelegate.m
//  我赢新闻
//
//  Created by wyzc on 15-4-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "ONETableViewController.h"
#import "TWOTableViewController.h"
#import "THREETableViewController.h"
#import "FOURTableViewController.h"
#import "ZHQAlert.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设定导航栏的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //获得数据库文件的路径
    NSString * path=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"db"];
    NSLog(@"%@",path);
    //数据库
    self.db=[FMDatabase databaseWithPath:path];
    if(![self.db open])
    {
        [ZHQAlert alert:@"由于打开数据库失败，程序到此为止！"];
        return NO;
    }
    //普通
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ONETableViewController * one=[[ONETableViewController alloc]initWithStyle:UITableViewStylePlain];
    one.tabBarItem.title=@"新闻";
    one.tabBarItem.image=[UIImage imageNamed:@"tab_0.png"];
    TWOTableViewController * two=[[TWOTableViewController alloc]initWithStyle:UITableViewStylePlain];
    two.title=@"排行榜";
    two.tabBarItem.title=@"排行榜";
    two.tabBarItem.image=[UIImage imageNamed:@"tab_1.png"];
    THREETableViewController * three=[[THREETableViewController alloc]initWithStyle:UITableViewStylePlain];
    three.title=@"搜索";
    three.tabBarItem.title=@"搜索";
    three.tabBarItem.image=[UIImage imageNamed:@"tab_2.png"];
    FOURTableViewController * four=[[FOURTableViewController alloc]initWithStyle:UITableViewStylePlain];
    four.title=@"收藏";
    four.tabBarItem.title=@"收藏";
    four.tabBarItem.image=[UIImage imageNamed:@"tab_3.png"];
    //导航
    UINavigationController * oneNav=[[UINavigationController alloc]initWithRootViewController:one];
    UINavigationController * twoNav=[[UINavigationController alloc]initWithRootViewController:two];
    UINavigationController * threeNav=[[UINavigationController alloc]initWithRootViewController:three];
    UINavigationController * fourNav=[[UINavigationController alloc]initWithRootViewController:four];
    //标签栏
    UITabBarController * tab=[[UITabBarController alloc]init];
    [tab setViewControllers:[NSArray arrayWithObjects:oneNav,twoNav,threeNav,fourNav, nil]];
    self.window.rootViewController=tab;
    [self.window makeKeyAndVisible];
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

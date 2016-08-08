//
//  AppDelegate.m
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-22.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "AppDelegate.h"
#import "OneTableViewController.h"
#import "TwoTableViewController.h"
#import "ThreeViewController.h"
#import "FourTableViewController.h"

@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //数据库
    NSArray * paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path=paths[0];
    path=[path stringByAppendingPathComponent:@"news.db"];
    NSLog(@"%@",path);
    self.db=[FMDatabase databaseWithPath:path];
    BOOL b=[self.db open];
    if(!b)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"打开数据库失败，应用将终止！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return  NO;
    }
    NSString * sql=@"create table if not exists news(idid integer,title text,subtitle text,picture text,content text,author text,flid integer,time text,clicks integer,pic blob,scid integer)";
    b=[self.db executeUpdate:sql];
    if(!b)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"创建表格失败，应用将终止！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return  NO;
    }
    
    //设置导航栏的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //设定导航栏的前景颜色
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //标签栏控制器
    UITabBarController * tab=[[UITabBarController alloc]init];
    //创建基本视图
    OneTableViewController * one=[[OneTableViewController alloc]initWithStyle:UITableViewStylePlain];
    TwoTableViewController * two=[[TwoTableViewController alloc]init];
    ThreeViewController * three=[[ThreeViewController alloc]init];
    FourTableViewController * four=[[FourTableViewController alloc]initWithStyle:UITableViewStylePlain];
    //创建导航视图
    UINavigationController * oneNav=[[UINavigationController alloc]initWithRootViewController:one];
    oneNav.tabBarItem.title=@"新闻";
    oneNav.tabBarItem.image=[UIImage imageNamed:@"tab_0.png"];
    UINavigationController * twoNav=[[UINavigationController alloc]initWithRootViewController:two];
    twoNav.tabBarItem.title=@"排行榜";
    twoNav.tabBarItem.image=[UIImage imageNamed:@"tab_3.png"];
    UINavigationController * threeNav=[[UINavigationController alloc]initWithRootViewController:three];
    threeNav.tabBarItem.title=@"搜索";
    threeNav.tabBarItem.image=[UIImage imageNamed:@"tab_1.png"];
    UINavigationController * fourNav=[[UINavigationController alloc]initWithRootViewController:four];
    fourNav.tabBarItem.title=@"收藏";
    fourNav.tabBarItem.image=[UIImage imageNamed:@"tab_2.png"];
    tab.viewControllers=[[NSArray alloc]initWithObjects:oneNav,twoNav,threeNav,fourNav, nil];
    //设定标签栏视图为根视图
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

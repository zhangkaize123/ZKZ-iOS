//
//  AppDelegate.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize db;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 打开数据库
    NSString *path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"news.db"];
    NSLog(@"%@",path);
    db=[FMDatabase databaseWithPath:path];
    if (![db open]) {
        NSLog(@"打开数据库失败");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"打开数据库失败 " delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    //创建表格
    BOOL b=[db executeUpdate:@"create table if not exists news(idid integer,title text,subtitle text,picture text,content text,author text,flid integer,time text,click integer,pic blob)"];
    if (!b) {
        NSLog(@"创建表格失败");
    }
    //创建数据库对象
    

    //对数据库进行操作
    //关闭数据库
    
    //创建标签栏控制器
    UITabBarController *tab=[[UITabBarController alloc]init];
    //创建视图控制器
    //OneViewController *one=[[OneViewController alloc]init];
    OneViewController *one=[[OneViewController alloc]initWithStyle:UITableViewStylePlain];
    TwoViewController *two=[[TwoViewController alloc]init];
    ThreeViewController *three=[[ThreeViewController alloc]init];
    FourViewController *four=[[FourViewController alloc]init];
    //导航栏视图
    UINavigationController *oneNav=[[UINavigationController alloc]initWithRootViewController:one];
    oneNav.tabBarItem.title=@"新闻";
    oneNav.tabBarItem.image=[UIImage imageNamed:@"icon_05.png"];
    UINavigationController *twoNav=[[UINavigationController alloc]initWithRootViewController:two];
    twoNav.tabBarItem.title=@"排行榜";
    twoNav.tabBarItem.image=[UIImage imageNamed:@"icon_06.png"];
    UINavigationController *threeNav=[[UINavigationController alloc]initWithRootViewController:three];
    threeNav.tabBarItem.title=@"搜锁";
    threeNav.tabBarItem.image=[UIImage imageNamed:@"icon_07.png"];
    UINavigationController *fourNav=[[UINavigationController alloc]initWithRootViewController:four];
    fourNav.tabBarItem.title=@"收藏";
    fourNav.tabBarItem.image=[UIImage imageNamed:@"icon_08.png"];
    NSArray *array=[NSArray arrayWithObjects:oneNav,twoNav,threeNav,fourNav, nil];
    tab.viewControllers=array;
    //设定导航栏背景颜色
    [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
    //设定导航栏前景颜色
    [[UINavigationBar appearance]setTintColor:[UIColor blackColor]];
    //设定根视图控制器
    self.window.rootViewController=tab;
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
    [db close];
}

@end

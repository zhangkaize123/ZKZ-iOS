//
//  AppDelegate.m
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建视图控制器
    OneViewController *oneView=[[OneViewController alloc]init];
    oneView.tabBarItem.title=@"新闻";
    oneView.tabBarItem.image=[UIImage imageNamed:@"icon_05"];
    TwoViewController *twoView=[[TwoViewController alloc]init];
    twoView.tabBarItem.title=@"排行榜";
    twoView.tabBarItem.image=[UIImage imageNamed:@"icon_06"];
    ThreeViewController *threeView=[[ThreeViewController alloc]init];
    threeView.tabBarItem.title=@"搜索";
    threeView.tabBarItem.image=[UIImage imageNamed:@"icon_07"];
    FourViewController *fourView=[[FourViewController alloc]init];
    fourView.tabBarItem.title=@"收藏";
    fourView.tabBarItem.image=[UIImage imageNamed:@"icon_08"];
    //创建导航栏控制器
    UINavigationController *oneNav=[[UINavigationController alloc]initWithRootViewController:oneView];
    UINavigationController *twoNav=[[UINavigationController alloc]initWithRootViewController:twoView];
    UINavigationController *threeNav=[[UINavigationController alloc]initWithRootViewController:threeView];
    UINavigationController *fourNav=[[UINavigationController alloc]initWithRootViewController:fourView];
    //把导航栏放到数组中去
    NSArray * array=[NSArray arrayWithObjects:oneNav,twoNav,threeNav,fourNav, nil];
    //创建tab标签栏
    UITabBarController *tab=[[UITabBarController alloc]init];
    tab.viewControllers=array;
    //tab.tabBar.barTintColor=[UIColor whiteColor];
    self.window.rootViewController=tab;
    //设定导航栏背景颜色
    [[UINavigationBar appearance]setBarTintColor:[UIColor whiteColor]];
    //设定导航栏前景颜色
    [[UINavigationBar appearance]setTintColor:[UIColor blackColor]];
    [self.window makeKeyAndVisible];
    //设置标签栏的背景颜色
    [[UITabBar appearance]setBarTintColor:[UIColor whiteColor]];
    //设置标签栏的前景颜色
    //[[UITabBar appearance]setTintColor:[UIColor blackColor]];
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

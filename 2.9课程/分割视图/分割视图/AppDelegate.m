//
//  AppDelegate.m
//  分割视图
//
//  Created by wyzc on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "DetailViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    //菜单视图控制器
    MenuViewController * menuVC=[[MenuViewController alloc]initWithStyle:UITableViewStylePlain];
    //详细视图控制器
    DetailViewController * detailVC=[[DetailViewController alloc]init];
    //设置菜单中的详细视图
    menuVC.detail=detailVC;
    //导航菜单视图控制器
    UINavigationController * menuNav=[[UINavigationController alloc]initWithRootViewController:menuVC];
    //导航详细视图控制器
    UINavigationController * detailNav=[[UINavigationController alloc]initWithRootViewController:detailVC];
    //分割视图控制器
    UISplitViewController * splitVC=[[UISplitViewController alloc]init];
    [splitVC setViewControllers:[NSArray arrayWithObjects:menuNav,detailNav, nil]];
    detailVC.navigationItem.leftBarButtonItem=splitVC.displayModeButtonItem;
    self.window.rootViewController=splitVC;
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

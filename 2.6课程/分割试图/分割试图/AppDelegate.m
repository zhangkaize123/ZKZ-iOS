//
//  AppDelegate.m
//  分割试图
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuTableViewController.h"
#import "DetilViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建表示图控制器
    MenuTableViewController *menu=[[MenuTableViewController alloc]initWithStyle:UITableViewStylePlain];
    //创建视图控制器
    DetilViewController *detil=[[DetilViewController alloc]init];
    //创建导航视图控制器
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:menu];
    UINavigationController *detilnav=[[UINavigationController alloc]initWithRootViewController:detil];
        //分割视图控制器
    UISplitViewController *split=[[UISplitViewController alloc]init];
    [split setViewControllers:[NSArray arrayWithObjects:nav,detilnav, nil]];
    self.window.rootViewController=split;
    detil.navigationItem.leftBarButtonItem=split.displayModeButtonItem;
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
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

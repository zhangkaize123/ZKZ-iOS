//
//  AppDelegate.m
//  视图
//
//  Created by 张凯泽 on 15-1-21.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *main=[[MainViewController alloc]init];
    //main.view.backgroundColor=[UIColor blueColor];
    self.window.rootViewController=main;
    //[self.window addSubview:main.view];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    
}

@end

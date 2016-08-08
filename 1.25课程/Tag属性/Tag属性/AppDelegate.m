//
//  AppDelegate.m
//  Tag属性
//
//  Created by 张凯泽 on 15-1-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
    view1.backgroundColor=[UIColor redColor];
    view1.tag=1;
    [self.window addSubview:view1];
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 100, 100)];
    view2.backgroundColor=[UIColor yellowColor];
    view2.tag=2;
    [view1 addSubview:view2];

    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 50, 50)];
    view3.backgroundColor=[UIColor greenColor];
    view3.tag=3;
    [view2 addSubview:view3];

    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(30, 300, 50, 40)];
    button.backgroundColor=[UIColor blueColor];
    
    [button addTarget:self action:@selector(tag1) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    
    // Override point for customization after application launch.
    return YES;
}
-(void)tag1
{
    
    /*
     他们的关系是：
     self.window--->view1--->view2-->view3
     通过Tag属性可以找到响应的视图
     */
    

    UIView *view=[self.window viewWithTag:3];
    NSLog(@"%@",view);
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

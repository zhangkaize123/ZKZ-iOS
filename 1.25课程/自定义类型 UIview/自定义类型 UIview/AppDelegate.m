//
//  AppDelegate.m
//  自定义类型 UIview
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
    Subview *view=[[Subview alloc]initWithFrame:CGRectMake(30, 30, 100, 100)];//1
    view.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    view.tag=101;
    [self.window addSubview:view];//2
    [view release];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(30, 300, 50, 40)];
    button.backgroundColor=[UIColor blueColor];
    
    [button addTarget:self action:@selector(tag1) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    

    // Override point for customization after application launch.
    return YES;
}
-(void)tag1
{
    UIView *v=[self.window viewWithTag:101];
    
    [v removeFromSuperview];//从父视图中把v删除
    
    
    BOOL b=[v respondsToSelector:@selector(say)];
    if (b)
    {
        [v say];
    }
    else
    {
        NSLog(@"没有此方法");
    }
    

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

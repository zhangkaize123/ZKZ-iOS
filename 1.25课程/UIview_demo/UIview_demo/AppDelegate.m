//
//  AppDelegate.m
//  UIview_demo
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
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    //一个视图可以有多个子视图（subview）,
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    view1=[[UIView alloc]initWithFrame:CGRectMake((self.window.frame.size.width-100)/2, 30, 100, 100)];
    view1.backgroundColor=[UIColor redColor];
    [self.window addSubview:view1];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake((self.window.frame.size.width-100)/2, 80, 100, 100)];
    view2.backgroundColor=[UIColor greenColor];
    [self.window addSubview:view2];

    UIView *view3=[[UIView alloc]initWithFrame
                   :CGRectMake((self.window.frame.size.width-100)/2, 130, 100, 50)];
    view3.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:view3];
    //NSLog(@"%@",self.window.subviews);//self.window的子视图有那些

    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((self.window.frame.size.width-100)/2, 300, 100, 40)];
    button.backgroundColor=[UIColor blueColor];
    [self.window addSubview:button];
    [button addTarget:self action:@selector(actiontag) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    // Override point for customization after application launch.
    return YES;
}
-(void)actiontag
{
    [self.window bringSubviewToFront:view1];//把view1放到最上边。
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

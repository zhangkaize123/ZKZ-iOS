//
//  AppDelegate.m
//  标签栏视图
//
//  Created by 张凯泽 on 15-2-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FirstTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建三个视图控制器
    FirstTableViewController *one=[[FirstTableViewController alloc]initWithStyle:UITableViewStylePlain];
    //设定标题
    one.title=@"one";
    //设置图片
    one.tabBarItem.image=[UIImage imageNamed:@"1.png"];
    one.tabBarItem.badgeValue=@"4";
    
    SecondViewController *two=[[SecondViewController alloc]init];
    two.title=@"two";
    two.tabBarItem.image=[UIImage imageNamed:@"2.png"];
    ThirdViewController *three=[[ThirdViewController alloc]init];
    three.title=@"three";
    three.tabBarItem.image=[UIImage imageNamed:@"3.png"];
    //设定右侧的显示数字
    three.tabBarItem.badgeValue=@"3";
    [three.tabBarItem setImageInsets:UIEdgeInsetsMake(-20, 0, 20, 0)];
    UIViewController *four=[[UIViewController alloc]init];
    //four.view.backgroundColor=[UIColor blueColor];
    four.title=@"four";
    four.tabBarItem.image=[UIImage imageNamed:@"4.png"];
    UIViewController *five=[[UIViewController alloc]init];
    five.view.backgroundColor=[UIColor whiteColor];
    five.title=@"five";
    five.tabBarItem.image=[UIImage imageNamed:@"5.png"];
    UIViewController *six=[[UIViewController alloc]init];
    //six.view.backgroundColor=[UIColor brownColor];
    six.title=@"six";
   six.tabBarItem.image=[UIImage imageNamed:@"6.png"];
    //four.tabBarItem.image
    //导航视图控制器
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:one];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:two];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:three];
    //创建标签栏控制器
    UITabBarController *tab=[[UITabBarController alloc]init];
    NSArray *array=[[NSArray alloc]initWithObjects:nav1,nav2,nav3,four, five,six,nil];
    [tab setViewControllers:array];
    //tab.tabBar.tintColor=[UIColor brownColor];//设置选中的颜色(图片及文字)
    //tab.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"4.png"];//选中的指示图片
    //
    [self printViewHierarchy:tab.view];

    self.window.rootViewController=tab;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
    /*
     UITabBarButton:{{2, 1}, {60, 48}}
     UITabBarSelectionIndicatorView:{{0, 0}, {60, 48}}
     UITabBarSwappableImageView:{{0, 0}, {30, 30}}
     
        _UIBadgeView:{{0, 0}, {18, 18}}
        _UIBadgeBackground:{{0, 0}, {18, 18}}
        UILabel:{{0, 0}, {8.5, 16}}
     
     UITabBarButton:{{2, 1}, {60, 48}}
     UITabBarSelectionIndicatorView:{{0, 0}, {60, 48}}
     UITabBarSwappableImageView:{{0, 0}, {30, 30}}
     UITabBarButtonLabel:{{0, 0}, {29, 20.5}}
     
     
        _UIBadgeView:{{0, 0}, {18, 18}}
        _UIBadgeBackground:{{0, 0}, {18, 18}}
        UILabel:{{0, 0}, {8.5, 16}}
     
     
     
     
     */
}
- (void)printViewHierarchy:(UIView *)superView
{
    static uint level = 0;
    for(uint i = 0; i < level; i++){
        printf("\t");
    }
    
    const char *className = NSStringFromClass([superView class]).UTF8String;
    const char *frame = NSStringFromCGRect(superView.frame).UTF8String;
    printf("%s:%s\n", className, frame);
    
    ++level;
    for(UIView *view in superView.subviews){
        [self printViewHierarchy:view];
    }
    --level;
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

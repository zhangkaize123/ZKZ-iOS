//
//  AppDelegate.m
//  sndos
//
//  Created by 张凯泽 on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建流对象
    xmppStream=[[XMPPStream  alloc]init];
    //指定事件的响应者
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //链接服务器
    [self connect];
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
#pragma  mark---链接和断开的函数
- (BOOL)connect
{
    //如果流已经断开
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    NSString *myJID = @"zhq@zhouqing";
    NSString *myPassword =@"zhq";
    if (myJID == nil || myPassword == nil) {
        return NO;
    }
    [xmppStream setMyJID:[XMPPJID jidWithString:myJID]];
    NSString *password = myPassword;
    NSError *error = nil;
    if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示"message:@"连接服务器失败"delegate:nil
            cancelButtonTitle:@"我知道了"otherButtonTitles:nil];
        [alertView show];
        return NO;
    }
    return YES;
}
//断开链接
- (void)disconnect
{
    [self goOffline];
    [xmppStream disconnect];
}
//发离线消息
- (void)goOffline
{
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    
    [xmppStream sendElement:presence];
}
//链接服务器成功事件
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
     //1认证
    NSError *error;
    if (![xmppStream authenticateWithPassword:@"zhq" error:&error])
    {
        NSLog(@"用户要求认证失败");
    }
}
//链接服务器失败的事件
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
     NSLog(@"用户链接服务器失败-%@-",error);
    
    
}

//认证成功的事件
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
     NSLog(@"用户认证成功");
    //发在线的消息
    [self goOnline];
}
//认证失败
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    NSLog(@"用户认证失败（密码错误）");
}
//发在线的消息
- (void)goOnline
{
    XMPPPresence *presence = [XMPPPresence presence];
    [ xmppStream sendElement:presence];
}

@end

//
//  AppDelegate.m
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建流对象
    xmppStream = [[XMPPStream alloc] init];
    //指定事件相应者
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //连接服务器
    [self connect];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
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
#pragma mark 连接和断开、发离线消息函数
- (BOOL)connect
{
    //如果流已经断开
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    //用户名
    NSString *myJID = @"zhq1@zhouqing";
    //密码
    NSString *myPassword = @"zhq1";
    if (myJID == nil || myPassword == nil) {
        return NO;
    }
    //把用户名和密码放到流对象中
    [xmppStream setMyJID:[XMPPJID jidWithString:myJID]];
    //设定xmpp服务器的ip
    xmppStream.hostName=@"192.168.3.5";
    //定义一个出错对象
    NSError *error = nil;
    //连接服务器
    if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示"message:@"连接服务器失败！"
        delegate:nil cancelButtonTitle:@"我知道了"otherButtonTitles:nil];
        [alertView show];
        
        return NO;
    }
    return YES;
}
//断开连接
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
//发在线消息
- (void)goOnline
{
    XMPPPresence *presence = [XMPPPresence presence];
    [xmppStream sendElement:presence];
}

#pragma mark xmpp事件
//连接服务器成功事件
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"看到我就说明你真的连接到openfire的服务器了！！");
    //认证用户
    NSError * error;
    if (![xmppStream authenticateWithPassword:@"zhq1" error:&error])
    {
        NSLog(@"用户要求认证失败！！");
    }
}
//断开与服务器的连接
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"与服务器的连接断开了！！（%@）",error);
}
//认证成功事件
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"看到我就说明用户认证成功了！！");
    //发在线消息
    [self goOnline];
}
//认证失败
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    NSLog(@"看到我就说明用户认证失败了(用户名或密码错误)！！");
}

@end

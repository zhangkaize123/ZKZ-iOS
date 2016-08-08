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
    //[self connect];
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
#pragma mark 自定义函数
//连接服务器
- (BOOL)connectWithUname:(NSString *)uname andWithUpass:(NSString *)upass
{
    //如果流已经断开
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    //用户名
    NSString *myJID = [NSString stringWithFormat:@"%@@zhouqing",uname];//@"zhq@zhouqing";
    //密码
    passWord=upass;
    userName=uname;
    NSString *myPassword = passWord;
    if (myJID == nil || myPassword == nil) {
        return NO;
    }
    //把用户名和密码放到流对象中
    [xmppStream setMyJID:[XMPPJID jidWithString:myJID]];
    //password = myPassword;
    //设定xmpp服务器的ip
    xmppStream.hostName=@"localhost";
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
//发送消息
-(void)sendMessage:(NSString *)__message WithTo:(NSString *)name
{
    //生成<body>文档
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:__message];
    //生成XML消息文档
    NSXMLElement *mes = [NSXMLElement elementWithName:@"message"];
    //消息类型
    [mes addAttributeWithName:@"type" stringValue:@"chat"];
    //发送给谁
    [mes addAttributeWithName:@"to" stringValue:[NSString stringWithFormat:@"%@@zhouqing",name]];
    //由谁发送
    [mes addAttributeWithName:@"from" stringValue:[NSString stringWithFormat:@"%@@zhouqing",userName]];
    //组合
    [mes addChild:body];
    //NSLog(@"%@",mes);
    //发送消息
    [xmppStream sendElement:mes];
}

#pragma mark xmpp事件

//连接服务器成功事件
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"看到我就说明你真的连接到openfire的服务器了！！");
    //认证用户
    NSError * error;
    if (![xmppStream authenticateWithPassword:passWord error:&error])
    {
        NSLog(@"用户要求认证失败！！");
    }
}
//断开与服务器的连接
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"与服务器的连接断开了！！（%@）",error);
    //发连接服务器失败的通知
    //正常的状态不需要通知
    //if (error!=nil) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ERROR" object:nil];
    //}
    
}
//认证成功事件
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"看到我就说明用户认证成功了！！");
    //发在线消息
    [self goOnline];
     [[NSNotificationCenter defaultCenter]postNotificationName:@"SUCCESS" object:nil];
}
//认证失败
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    NSLog(@"看到我就说明用户认证失败了(用户名或密码错误)！！");
    //发认证失败的通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ERROR" object:nil];
    
}
//接收消息事件
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSLog(@"来消息了(%@)!",message);
    //[self sendMessage:@"hello!"];
}

@end

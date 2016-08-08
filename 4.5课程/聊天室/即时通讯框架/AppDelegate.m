//
//  AppDelegate.m
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHQAlert.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize db;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建流对象
    xmppStream = [[XMPPStream alloc] init];
    //指定事件相应者
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //连接服务器
    //[self connect];
    //创建本地数据库地址
    //NSString *path=NSHomeDirectory();
    NSString * paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString * path = [paths stringByAppendingPathComponent:@"xmpp.db"];
    NSLog(@"-%@-",path);
    //创建数据库对象
    db=[FMDatabase databaseWithPath:path];
    //打开数据库, 如果不存在这个文件就创建出来
    if(![db open])
    {
        [ZHQAlert alert:@"打开数据库失败"];
        NSLog(@"打开数据库失败");
    }
    //username , time,message,是否被显示过 0->未被显示 1->显示过
    NSString * sql = @"create table if not exists messages(username text,time text,msg text,flag int)";
    //创建表格executeUpdate
    if(![self.db executeUpdate:sql])
    {
        [ZHQAlert alert:@"创建表格失败!"];
    }

    return YES;
}
#pragma mark 自定义函数
//连接服务器或者是注册
- (BOOL)connectWithUname:(NSString *)_uname andWithUpas:(NSString *)_upass andIsLoginOrIsRegister:(BOOL)flag;
{
    isLogin = flag;
    //如果流已经断开
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    //用户名
    NSString *myJID =[NSString stringWithFormat:@"%@@localhost",_uname] ;
    //密码
    password = _upass;
    username=_uname;
    if (myJID == nil || password == nil) {
        return NO;
    }
    //把用户名和密码放到流对象中
    [xmppStream setMyJID:[XMPPJID jidWithString:myJID]];
    //password = myPassword;
    //设定xmpp服务器的ip
    xmppStream.hostName=@"localhost";
    //定义一个出错对象
    NSError *error = nil;
    
        if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error])
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示"
                                                                message:@"连接服务器失败！"
                                                               delegate:nil
                                                      cancelButtonTitle:@"我知道了"
                                                      otherButtonTitles:nil];
            [alertView show];
            
            return NO;
        }
        
    
    //连接服务器
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
-(void)sendMessage:(NSString *)__message withTo:(NSString *)_to;
{
    //生成<body>文档
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:__message];
    //生成XML消息文档
    NSXMLElement *mes = [NSXMLElement elementWithName:@"message"];
    //消息类型
    [mes addAttributeWithName:@"type" stringValue:@"chat"];
    //发送给谁
    [mes addAttributeWithName:@"to" stringValue:[NSString stringWithFormat:@"%@@localhost",_to]];
    //由谁发送
    [mes addAttributeWithName:@"from" stringValue:[NSString stringWithFormat:@"%@@localhost",username]];
    //组合
    [mes addChild:body];
    NSLog(@"%@",mes);
    //发送消息
    [xmppStream sendElement:mes];
}
//获得离线消息的时间
-(NSDate *)getDelayStampTime:(XMPPMessage *)message
{
    //获得xml中的delay标签
    XMPPElement * delay=(XMPPElement *)[message elementForName:@"delay"];
    if(delay)//如果是离线消息
    {
        //获得时间戳
        NSString * timeString=[[(XMPPElement *)[message elementForName:@"delay"] attributeForName:@"stamp"] stringValue];
        //时间格式化对象
        NSDateFormatter * dateFormatter=[[NSDateFormatter alloc] init];
        //设定时间的具体格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        //拆分到数组
        NSArray * arr=[timeString componentsSeparatedByString:@"T"];
        //日期
        NSString * dateStr=[arr objectAtIndex:0];
        NSString * timeStr=[[[arr objectAtIndex:1] componentsSeparatedByString:@"."] objectAtIndex:0];
        //构建一个日期对象 这个对象里的时区是0
        NSDate * localDate=[dateFormatter dateFromString:[NSString stringWithFormat:@"%@T%@+0000",dateStr,timeStr]];
        return localDate;
    }
    else
    {
        return nil;
    }
}

#pragma mark xmpp事件
//连接服务器成功事件
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"看到我就说明你真的连接到openfire的服务器了！！");
    //认证用户
    
    NSError * error;
    if (isLogin) {//登陆
        if (![xmppStream authenticateWithPassword:password error:&error])
        {
            
            
            NSLog(@"用户要求认证失败！！");
        }
        
    }else{//注册用户
        
        if(![xmppStream registerWithPassword:password error:&error])
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"友情提示"
                                                                message:@"注册失败！"
                                                               delegate:nil
                                                      cancelButtonTitle:@"我知道了"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
    
}
//断开与服务器的连接
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"与服务器的连接断开了！！（%@）",error);
    //发连接服务器失败的通知
    if(error!=nil)//正常断开不需要发通知
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ERROR" object:nil];
    }
}
//认证成功事件
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"看到我就说明用户认证成功了！！");
    //发在线消息
    [self goOnline];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SUCCESS" object:nil];
}
//认证失败
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    NSLog(@"看到我就说明用户认证失败了(用户名或密码错误)！！");
    //发认证失败的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ERROR" object:nil];
}
//接收消息事件
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSLog(@"来消息了(%@)!",message);
    //时间格式化对象
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * strDate;
    NSDate * date=[self getDelayStampTime:message];
    if(date)
    {
        strDate=[dateFormatter stringFromDate:date];
    }
    else
    {
        strDate=[dateFormatter stringFromDate:[NSDate date]];
    }
    XMPPJID * jid=message.from;
    NSString * uname=jid.user;//得到用户名
    NSString * msg=[NSString stringWithFormat:@"%@(%@):%@",uname,strDate,message.body];//生成一个字符串 用户民：消息
    //[self sendMessage:@"hello!"];
        if(message.body)
    {
        if(![db executeUpdate:@"insert into messages values(?,?,?,?)",uname,strDate,message.body,@"0"])
        {
            [ZHQAlert alert:@"增加数据失败"];
        }

        [[NSNotificationCenter defaultCenter] postNotificationName:@"MESSAGE" object:msg];
    }
}
#pragma mark---zkz----注册的代理方法
//注册失败的方法
-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error
{
    NSLog(@"注册失败");
    NSLog(@"%@",error.debugDescription);
    [self disconnect];
}
-(void)xmppStreamDidRegister:(XMPPStream *)sender
{
    NSLog(@"注册成功");
    [self disconnect];
}
@end

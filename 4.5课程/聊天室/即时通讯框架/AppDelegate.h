//
//  AppDelegate.h
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPFramework.h"//1、xmpp需要的头文件
#import "FMDB.h"//本地数据库
@interface AppDelegate : UIResponder <UIApplicationDelegate,XMPPStreamDelegate>
{
    XMPPStream *xmppStream;//2、连接xmpp服务器的流对象
    NSString * password;
    NSString * username;
    BOOL isLogin;
}

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)FMDatabase *db;//存储数据类
- (BOOL)connectWithUname:(NSString *)_uname andWithUpas:(NSString *)_upass andIsLoginOrIsRegister:(BOOL)flag;//连接服务器
- (void)disconnect;//断开连接
- (void)goOffline;//离线
- (void)goOnline;//在线
-(void)sendMessage:(NSString *)__message withTo:(NSString *)_to;//发文本消息

@end


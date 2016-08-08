//
//  AppDelegate.h
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPFramework.h"//1、xmpp需要的头文件
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    XMPPStream *xmppStream;//2、连接xmpp服务器的流对象
}
@property (strong, nonatomic) UIWindow *window;


@end


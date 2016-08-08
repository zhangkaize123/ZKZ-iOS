//
//  ViewController.m
//  网络连接检测
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 1.域名必须是：www.baidu.com不可以带http://
 2.reachability 的对象必须是全局的数据
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //检测网络变化
    //注册通知观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(netChange:) name:kReachabilityChangedNotification object:nil];
    //创建一个检测类的对象
    reachability=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    if(reachability.currentReachabilityStatus==NotReachable)
    {
        NSLog(@"没有网络连接");
    }
    if(reachability.currentReachabilityStatus==ReachableViaWiFi)
    {
        NSLog(@"连接Wi-Fi");
    }
    if(reachability.currentReachabilityStatus==ReachableViaWWAN)
    {
        NSLog(@"连接蜂窝网路");
    }
    //*******开启通知
    [reachability startNotifier];
    
}
#pragma mark-----通知的方法
-(void)netChange:(NSNotification*)obj
{
    Reachability *sender=[obj object];
    //必须使用全局的变量（对象）－－－－reachability
    NSLog(@"网路变化了-%d-",(int)sender.currentReachabilityStatus);
}

@end

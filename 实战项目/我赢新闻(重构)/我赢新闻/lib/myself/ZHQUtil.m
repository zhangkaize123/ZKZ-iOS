//
//  ZHQUtil.m
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZHQUtil.h"
#import "Reachability.h"
#import <UIKit/UIKit.h>
@implementation ZHQUtil
+(NSString *)hostname
{
    return  @"http://127.0.0.1/news/";
    //return @"http://115.159.1.248:56666/xinwen/";
}
+(BOOL)isConnection
{
    Reachability * reach=[Reachability reachabilityWithHostName:@"www.baidu.com"];
    return [reach currentReachabilityStatus]!=0;
}
+(void)alert:(NSString *)message
{
    UIAlertView * av=[[UIAlertView alloc]initWithTitle:@"友情提示" message:message delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil] ;
    [av show];
}
@end

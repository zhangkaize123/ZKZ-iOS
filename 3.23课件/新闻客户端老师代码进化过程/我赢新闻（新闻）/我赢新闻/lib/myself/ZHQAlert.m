//
//  ZHQAlert.m
//  通讯录
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZHQAlert.h"
#import <UIKit/UIKit.h>
@implementation ZHQAlert
+(void)alert:(NSString *)message
{
    UIAlertView * av=[[UIAlertView alloc]initWithTitle:@"友情提示" message:message delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil] ;
    [av show];
}
@end

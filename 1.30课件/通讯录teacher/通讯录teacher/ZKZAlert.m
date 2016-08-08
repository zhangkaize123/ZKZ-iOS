//
//  ZKZAlert.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZAlert.h"

@implementation ZKZAlert
+(void)alert:(NSString *)_alert
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:_alert delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];
}
@end

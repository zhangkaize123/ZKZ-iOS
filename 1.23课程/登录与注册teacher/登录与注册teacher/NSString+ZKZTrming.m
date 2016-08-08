//
//  NSString+ZKZTrming.m
//  登录与注册teacher
//
//  Created by 张凯泽 on 15-1-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "NSString+ZKZTrming.h"

@implementation NSString (ZKZTrming)
-(NSString *)trming
{
    //return self stringByTrimmingCharactersInSet
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
}
@end

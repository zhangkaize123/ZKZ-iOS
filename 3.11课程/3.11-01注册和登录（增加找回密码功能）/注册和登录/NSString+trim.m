//
//  NSString+trim.m
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "NSString+trim.h"

@implementation NSString (trim)
-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end

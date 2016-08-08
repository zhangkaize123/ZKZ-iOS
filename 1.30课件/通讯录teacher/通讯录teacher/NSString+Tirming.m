//
//  NSString+Tirming.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "NSString+Tirming.h"

@implementation NSString (Tirming)
-(NSString *)tirming
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end

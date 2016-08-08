//
//  ZHQUtil.h
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHQUtil : NSObject
+(NSString *)hostname;//连接服务器地址
+(BOOL)isConnection;//判断是否联网
+(void)alert:(NSString *)message;//消息提示框
@end

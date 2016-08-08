//
//  ZKZTool.h
//  班级管理
//
//  Created by 张凯泽 on 15-3-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
static NSString *ip=@"";

@interface ZKZTool : NSObject

+(NSString *)ip;
+(NSString *)trimString:(NSString *)string;

@end

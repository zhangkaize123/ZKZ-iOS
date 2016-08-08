//
//  ZKZTopic.m
//  test
//
//  Created by 张凯泽 on 15-4-17.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTopic.h"
#import "MJExtension.h"
#import "ZKZApplication.h"
@implementation ZKZTopic
-(NSDictionary *)objectClassInArray
{
    return @{@"applications":[ZKZApplication class]};
}
@end

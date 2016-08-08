//
//  ZKZStudent.m
//  XML作业
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZStudent.h"

@implementation ZKZStudent
-(NSString *)description
{
    return [NSString stringWithFormat:@"name=%@,age=%d,sex=%@",self.name,self.age,self.sex];
}
@end

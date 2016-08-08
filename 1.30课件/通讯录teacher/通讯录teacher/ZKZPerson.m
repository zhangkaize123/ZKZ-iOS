//
//  ZKZPerson.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZPerson.h"

@implementation ZKZPerson
@synthesize name,tel;
-(id)copyWithZone:(NSZone *)zone
{
    ZKZPerson *s=[[self class]allocWithZone:zone];
    s.name=[self.name copy];
    s.tel=[self.tel copy];
    
    
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"name=%@,tel=%@",name,tel];
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:@"NAME"];
    [aCoder encodeObject:tel forKey:@"TEL"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    name=[aDecoder decodeObjectForKey:@"NAME"];
    tel=[aDecoder decodeObjectForKey:@"TEL"];
    return self;
}
@end

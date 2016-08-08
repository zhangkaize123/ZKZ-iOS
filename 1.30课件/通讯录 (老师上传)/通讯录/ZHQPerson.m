//
//  ZHQPerson.m
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZHQPerson.h"

@implementation ZHQPerson
-(id)copyWithZone:(NSZone *)zone
{
    ZHQPerson * me=[[[self class]allocWithZone:zone]init];
    if(me)
    {
        me.name=[self.name copy];
        me.tel=[self.tel copy];
        me.pinyin=[self.pinyin copy];
    }
    return me;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"name=%@,tel=%@,py=%@",self.name,self.tel,self.pinyin];
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeObject:self.tel forKey:@"TEL"];
    [aCoder encodeObject:self.pinyin forKey:@"PY"];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if(self)
    {
        self.name=[aDecoder decodeObjectForKey:@"NAME"];
        self.tel=[aDecoder decodeObjectForKey:@"TEL"];
        self.pinyin=[aDecoder decodeObjectForKey:@"PY"];
    }
    return self;
}
@end

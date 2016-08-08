//
//  ZKZNews.m
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZNews.h"
/*
 @property(nonatomic,copy)NSString *title;
 @property(nonatomic,copy)NSString *subtitle;
 @property(nonatomic,copy)NSString *picture;
 @property(nonatomic,copy)NSString *content;
 @property(nonatomic,copy)NSString *author;
 @property(nonatomic,assign)int number;
 @property(nonatomic,strong)NSDate *time;
 @property(nonatomic,assign)int flid;
 */
@implementation ZKZNews
-(NSString*)description
{
    return [NSString stringWithFormat:@"id=%d,title=%@,subtitle=%@,picture=%@,content=%@,author=%@,time=%@,flid=%d,click=%d",self.idid,self.title,self.subtitle,self.picture,self.content,self.author,self.time,self.flid,self.click];
}
@end

//
//  ZKZNews.h
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKZNews : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subtitle;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,assign)int idid;
@property(nonatomic,strong)NSDate *time;
@property(nonatomic,assign)int flid;
@property(nonatomic,assign)int click;
@end

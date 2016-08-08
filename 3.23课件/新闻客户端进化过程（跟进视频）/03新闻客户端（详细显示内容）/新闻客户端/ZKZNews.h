//
//  ZKZNews.h
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-31.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZKZNews : NSObject
@property(nonatomic,strong)NSNumber *click;
@property(nonatomic,strong)NSNumber *flid;
@property(nonatomic,strong)NSNumber *idid;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *subtitle;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,strong)UIImage *img;



@end

//
//  ZHQNews.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-26.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZHQNews : NSObject
@property (strong,nonatomic) NSNumber * clicks;
@property (strong,nonatomic) NSString *  picture;
@property (strong,nonatomic) NSString * content;
@property (strong,nonatomic) NSString * author;
@property (strong,nonatomic) NSNumber *  idid;
@property (strong,nonatomic) NSNumber *  flid;
@property (strong,nonatomic) NSString * time;
@property (strong,nonatomic) NSString * subtitle;
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) UIImage * img;
@end

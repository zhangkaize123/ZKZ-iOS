//
//  ZKZTableView.h
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZGroupNews.h"
@interface ZKZTableView : UIView
@property(nonatomic,strong)ZKZGroupNews *group;
+(instancetype)loadView;
@end

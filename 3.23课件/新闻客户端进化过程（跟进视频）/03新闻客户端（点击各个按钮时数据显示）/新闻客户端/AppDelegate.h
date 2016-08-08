//
//  AppDelegate.h
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)FMDatabase *db;

@end


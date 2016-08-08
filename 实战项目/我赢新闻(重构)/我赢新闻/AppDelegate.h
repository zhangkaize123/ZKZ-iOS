//
//  AppDelegate.h
//  我赢新闻
//
//  Created by wyzc on 15-4-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) FMDatabase * db;//数据库

@end


//
//  AppDelegate.h
//  注册和登录
//
//  Created by wyzc on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)FMDatabase *db;
@property (strong, nonatomic)FMDatabase *answerdb;
@end


//
//  AppDelegate.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-22.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) FMDatabase * db;

@end


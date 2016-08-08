//
//  AppDelegate.h
//  计算器1.24
//
//  Created by 张凯泽 on 15-1-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    float height;
    float width;
    UILabel *lable;
    NSMutableString *showstring;
    NSString *sign;
    float one;
}
@property (strong, nonatomic) UIWindow *window;


@end


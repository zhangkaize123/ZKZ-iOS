//
//  AppDelegate.h
//  计算器
//
//  Created by wyzc on 15-1-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableString * showText;//标签上显示的文本 如果为空时显示0
    UILabel * show;//标签控件
    NSString * signString;
    NSString * preString;
}
@property (strong, nonatomic) UIWindow *window;
@end


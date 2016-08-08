//
//  ViewController.h
//  登录与注册teacher
//
//  Created by 张凯泽 on 15-1-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL isCheck;
    UITextField *accountext;//帐号
    UITextField *passwordtext;//密码
    NSMutableDictionary *usersinfo;
    NSString*filepath;
    NSString *path;
}
@end


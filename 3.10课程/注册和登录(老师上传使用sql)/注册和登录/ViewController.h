//
//  ViewController.h
//  注册和登录
//
//  Created by wyzc on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UITextField * unameText;//账号控件
    UITextField * upassText;//密码控件
    UIButton * remButton;//记住密码控件
    BOOL isRember;//是否记住
}

@end


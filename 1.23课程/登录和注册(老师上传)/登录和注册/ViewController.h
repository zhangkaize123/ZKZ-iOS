//
//  ViewController.h
//  登录和注册
//
//  Created by wyzc on 15-1-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL isCheck;//是否选中记住密码 yes是选中
    UITextField * accountText;//账号
    UITextField * passwordText;//密码
    NSString * filePath;
    NSString * userName;
    NSString * password;
}
@property (strong,nonatomic) NSMutableDictionary * userInfo;
@end


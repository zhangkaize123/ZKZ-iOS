//
//  FindpasswordViewController.h
//  注册和登录
//
//  Created by 张凯泽 on 15-3-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@protocol FindpasswordViewControllerdelegate <NSObject>
@optional
-(void)passwordViewControllersendValue:(NSString *)userinfo;

@end
@interface FindpasswordViewController : UIViewController
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,copy)NSString *sendstr;
@property(nonatomic,weak)id<FindpasswordViewControllerdelegate>delegate;
@end

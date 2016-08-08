//
//  ZKZEditViewController.h
//  班级管理
//
//  Created by 张凯泽 on 15-3-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZKZEditViewControllerdelegate


@end
@interface ZKZEditViewController : UIViewController
@property(nonatomic,copy)NSString *sendclass;//班级
@property(nonatomic,assign)int keyId;//班级里的主键ID
@property(nonatomic,copy)NSString *senduser;//注册用户
@property(nonatomic,copy)NSString *numberStr;//class里的ID
@end

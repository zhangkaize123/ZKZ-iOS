//
//  AddViewController.h
//  班级管理
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKZClassInfo;
@protocol AddViewControllerdelegate
-(void)sendValueWith:(ZKZClassInfo*)classInfo;
@end
@interface AddViewController : UIViewController
@property(nonatomic,copy)NSString *senduser;//注册用户
@property(nonatomic,weak)id<AddViewControllerdelegate>delegate;
@end

//
//  AddViewController.h
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceDelegate.h"
@interface AddViewController : UIViewController
{
    UITextField * nameText;//姓名
    UITextField * telText;//电话
}
@property (strong,nonatomic) id<ServiceDelegate> delegate;
@end

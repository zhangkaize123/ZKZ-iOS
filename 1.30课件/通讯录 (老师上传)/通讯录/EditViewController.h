//
//  EditViewController.h
//  通讯录
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHQPerson.h"
#import "ServiceDelegate.h"
@interface EditViewController : UIViewController<UIActionSheetDelegate>
{
    UITextField * nameText;//姓名
    UITextField * telText;//电话
}
@property (strong,nonatomic) ZHQPerson * person;
@property (strong,nonatomic) id<ServiceDelegate> delegate;
@end

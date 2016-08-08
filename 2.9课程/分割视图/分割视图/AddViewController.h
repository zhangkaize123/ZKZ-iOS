//
//  AddViewController.h
//  分割视图
//
//  Created by wyzc on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
@interface AddViewController : UIViewController
{
    UITextField * nameText;
}
@property (strong,nonatomic) MenuViewController * menuVC;
@end

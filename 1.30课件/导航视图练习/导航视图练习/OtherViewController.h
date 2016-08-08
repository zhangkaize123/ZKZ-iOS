//
//  OtherViewController.h
//  导航视图练习
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface OtherViewController : UIViewController
{
    UIBarButtonItem *button;
    UITextField *text;
}
@property(strong,nonatomic)NSString *sendstring;
@property(strong,nonatomic)MainTableViewController *main;
@end

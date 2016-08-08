//
//  MainViewController.h
//  导航视图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainTableViewController.h"
@interface MainViewController : UIViewController
{
    UITextField *text;
    UIBarButtonItem *rightbutton;
}
@property (strong,nonatomic)mainTableViewController *main;
@property (strong,nonatomic)NSString *sendother;
@end

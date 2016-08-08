//
//  Add_ViewController.h
//  通讯录
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTableViewController;
@interface Add_ViewController : UIViewController
{
    UITextField *editpeson;
    UITextField *editphone;
}
@property(strong,nonatomic)MainTableViewController *main;
@end

//
//  RepairViewController.h
//  通讯录
//
//  Created by 张凯泽 on 15-1-31.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface RepairViewController : UIViewController
{
    UIBarButtonItem *bar;
    UITextField *repairtext;
    UITextField*text;
}
@property(strong,nonatomic)NSString*repairname;
@property(strong,nonatomic)NSString*repairphone;
@property(strong,nonatomic)MainTableViewController *m;
@end

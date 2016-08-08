//
//  DetailViewController.h
//  我的标示图
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableViewController.h"
@interface DetailViewController : UIViewController
{
    UITextField *text;
}
@property(strong,nonatomic)NSString *string;
@property(strong,nonatomic)MainTableViewController *main;
@end

//
//  OtherViewController.h
//  test
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface OtherViewController : UIViewController
{
    UITextField *text;
}
@property(strong,nonatomic)NSString *sendstring;
@property(strong,nonatomic)MainViewController *main;
@end

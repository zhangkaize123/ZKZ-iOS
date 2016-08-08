//
//  OtherViewController.h
//  视图切换
//
//  Created by wyzc on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface OtherViewController : UIViewController
{
    UITextField * text;
}
@property (strong,nonatomic) NSString * sendString;
@property (strong,nonatomic) MainViewController * main;
@end

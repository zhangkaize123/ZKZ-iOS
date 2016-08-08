//
//  oneViewController.m
//  节后复习题（代码版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "oneViewController.h"
/*
 oneViewController继承自FatherViewViewController，如果想在子类里边得到
 父类的控件，方法1:把父类的控件做成全局属性
           方法2:
 UILabel *lable=[self.view.subviews objectAtIndex:0];
 
 
 
 
 
 */
@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
   //self.label.text=self.string;
    UILabel *lable=[self.view.subviews objectAtIndex:0];
    //main---->other
    lable.text=self.string;
}



@end

//
//  ViewController.m
//  滑动
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *wgr=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeTap:)];
    //设置滑动方向
    wgr.direction=UISwipeGestureRecognizerDirectionLeft;//向左
    //wgr.direction=UISwipeGestureRecognizerDirectionUp;//向上
    wgr.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:wgr];
}
-(void)swipeTap:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"this is swipe");
    NSLog(@"recognizer=%@",recognizer);
    
}


@end

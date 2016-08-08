//
//  ViewController.m
//  多线程
//
//  Created by 张凯泽 on 15-3-19.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
    [button setImage:[UIImage imageNamed:@"icon_03"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(okTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(40, 100, 50, 40)];
    [button1 setImage:[UIImage imageNamed:@"movie_jf"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(oktap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}
-(void)okTap
{
    [NSThread sleepForTimeInterval:10];
    NSLog(@"********");
}
-(void)oktap
{
    NSLog(@"-----------");
}

@end

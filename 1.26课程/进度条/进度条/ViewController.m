//
//  ViewController.m
//  进度条
//
//  Created by 张凯泽 on 15-1-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UIProgressView *prog=[[UIProgressView alloc]initWithFrame:CGRectMake(20, 120, 300, 20)];
    //范围是0-1；
    prog.progress=0.5;
    
    [self.view addSubview:prog];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

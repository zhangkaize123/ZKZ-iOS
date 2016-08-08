//
//  ViewController.m
//  进度条应用
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
    flag=YES;
    //进度条
    self.view.backgroundColor=[UIColor whiteColor];
    UIProgressView *prog=[[UIProgressView alloc]initWithFrame:CGRectMake(20, 30, 300, 20)];
    //1.进度条背景颜色
    //prog.trackTintColor=[UIColor redColor];
    //2.设定走过的颜色。
    //prog.progressTintColor=[UIColor orangeColor];
    prog.progress=0.95;
    prog.tag=11;
    [self.view addSubview:prog];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 50, 40)];
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"走步" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actiontag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)actiontag:(UIButton *)sender
{
    
    UIProgressView *p=(UIProgressView *)[self.view viewWithTag:11];
    
    if (flag)
    {
        p.progress+=0.05;
        NSLog(@"%g",p.progress);
        if (p.progress==1)
        {
            flag=NO;
            NSLog(@"sdfhi");
            
        }
    }
    
    else
    {
      p.progress-=0.05;
        if (p.progress==0)
        {
            flag=YES;
        }
        
        
        
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

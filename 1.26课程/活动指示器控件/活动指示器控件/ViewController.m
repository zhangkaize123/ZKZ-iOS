//
//  ViewController.m
//  活动指示器控件
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
    
    UIActivityIndicatorView *aiv=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(20, 30, 100, 100)];
    aiv.backgroundColor=[UIColor blueColor];
    //aiv.hidesWhenStopped=NO;
    aiv.tag=10;
    aiv.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:aiv];
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(20, 150, 50, 50)];
    button1.tag=11;
    button1.backgroundColor=[UIColor orangeColor];
    [button1 addTarget:self action:@selector(actiontag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(100, 150, 50, 50)];
    button2.tag=12;
    [button2 addTarget:self action:@selector(actiontag:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor=[UIColor brownColor];
    [self.view addSubview:button2];

    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)actiontag:(UIButton *)sender
{
    UIActivityIndicatorView *a=(UIActivityIndicatorView *)[self.view viewWithTag:10];
    if (sender.tag==11)
    {
        [a startAnimating];
        
    }
    if (sender.tag==12)
    {
        [a stopAnimating];
        a.hidesWhenStopped=NO;
        
    }
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

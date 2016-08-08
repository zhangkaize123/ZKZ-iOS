//
//  ViewController.m
//  活动指示器
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor brownColor];
    aiv=[[UIActivityIndicatorView alloc]init];
    aiv.frame=CGRectMake(20, 20, 50, 50);
    //aiv.hidesWhenStopped=NO;
    
    aiv.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    aiv.backgroundColor=[UIColor redColor];
    [self.view addSubview:aiv];
    //启动按钮
    start=[[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 40)];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    start.backgroundColor=[UIColor greenColor];
    [start addTarget:self action:@selector(starttag:) forControlEvents:UIControlEventTouchUpInside];
    start.showsTouchWhenHighlighted=YES;
    start.layer.cornerRadius=40/4;
    [self.view addSubview:start];
    //停止按钮
    stop=[[UIButton alloc]initWithFrame:CGRectMake(20, 200, 100, 40)];
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    stop.backgroundColor=[UIColor redColor];
    [stop addTarget:self action:@selector(stoptag:) forControlEvents:UIControlEventTouchUpInside];
    stop.showsTouchWhenHighlighted=YES;
    stop.layer.cornerRadius=40/4;
    stop.enabled=NO;
    [self.view addSubview:stop];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)starttag:(UIButton*)sender
{
    
    [aiv startAnimating];
    sender.enabled=NO;
    stop.enabled=YES;
    
    
}
-(void)stoptag:(UIButton*)sender
{
    //button.enable=NO时不接受事件
    [aiv stopAnimating];
    sender.enabled=NO;
    start.enabled=YES;
    aiv.hidesWhenStopped=NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

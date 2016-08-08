//
//  ViewController.m
//  转屏作业teacher版
//
//  Created by 张凯泽 on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)NSDictionary *views;

@end

@implementation ViewController
-(void)loadviews
{
    UIView *v1=[[UIView alloc]init];
    v1.backgroundColor=[UIColor redColor];
    [self.view addSubview:v1];
    
    UIView *v2=[[UIView alloc]init];
    v2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:v2];
    
    UIView *v3=[[UIView alloc]init];
    v3.backgroundColor=[UIColor blueColor];
    [self.view addSubview:v3];
    
    UIView *v4=[[UIView alloc]init];
    v4.backgroundColor=[UIColor blackColor];
    [self.view addSubview:v4];
    
    UIView *v5=[[UIView alloc]init];
    v5.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:v5];
    
    UIView *v6=[[UIView alloc]init];
    v6.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:v6];
    
    self.views=NSDictionaryOfVariableBindings(v1,v2,v3,v4,v5,v6);
    
}
-(void)vFrame
{
    float width=(self.view.frame.size.width-200)/3;//水平间距
    float height=(self.view.frame.size.height-300)/4;//竖直间距
    
    UIView *v1=[self.views objectForKey:@"v1"];
    v1.frame=CGRectMake(width, height, 100, 100);
    
    UIView *v2=[self.views objectForKey:@"v2"];
    v2.frame=CGRectMake(width, height*2+100, 100, 100);
    
    UIView *v3=[self.views objectForKey:@"v3"];
    v3.frame=CGRectMake(width, height*3+200, 100, 100);
    
    UIView *v4=[self.views objectForKey:@"v4"];
    v4.frame=CGRectMake(width*2+100, height, 100, 100);
    
    UIView *v5=[self.views objectForKey:@"v5"];
    v5.frame=CGRectMake(width*2+100, height*2+100, 100, 100);
    
    UIView *v6=[self.views objectForKey:@"v6"];
    v6.frame=CGRectMake(width*2+100, height*3+200, 100, 100);
}
-(void)hFrame
{
    float width=(self.view.frame.size.width-300)/4;//水平间距
    float height=(self.view.frame.size.height-200)/3;//竖直间距
    
    UIView *v1=[self.views objectForKey:@"v1"];
    v1.frame=CGRectMake(width, height, 100, 100);
    
    UIView *v2=[self.views objectForKey:@"v2"];
    v2.frame=CGRectMake(width*2+100, height, 100, 100);
    
    UIView *v3=[self.views objectForKey:@"v3"];
    v3.frame=CGRectMake(width*3+200, height, 100, 100);
    
    UIView *v4=[self.views objectForKey:@"v4"];
    v4.frame=CGRectMake(width, height*2+100, 100, 100);
    
    UIView *v5=[self.views objectForKey:@"v5"];
    v5.frame=CGRectMake(width*2+100, height*2+100, 100, 100);
    
    UIView *v6=[self.views objectForKey:@"v6"];
    v6.frame=CGRectMake(width*3+200, height*2+100, 100, 100);
}

-(void)change
{
    NSLog(@"*******");
    
    UIDeviceOrientation dict=[UIDevice currentDevice].orientation;
    if (dict==1)//竖相
    {
        [self vFrame];
        
        
    }
    else if (dict==3||dict==4)//横相
    {
        
        [self hFrame];
        
    }
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadviews];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

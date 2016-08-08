//
//  ViewController.m
//  代码适配
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *button1;
    UIButton *button2;
}
@end

@implementation ViewController
-(void)changed
{
    UIDeviceOrientation dict=[[UIDevice currentDevice]orientation];
    if (dict==1)
    {
        
        button1.frame=CGRectMake(50, self.view.frame.size.height-100, 100,50 );
        
        button2.frame=CGRectMake(self.view.frame.size.width-50-100, self.view.frame.size.height-100, 100,50 );
        
    }
    else if (dict==3||dict==4)
    {
       
        button1.frame=CGRectMake(50, self.view.frame.size.height-100, 100,50 );
        
        button2.frame=CGRectMake(self.view.frame.size.width-50-100, self.view.frame.size.height-100, 100,50 );
        
        
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    button1=[[UIButton alloc]init];
    button1.backgroundColor=[UIColor greenColor];
    [self.view addSubview:button1];
    button2=[[UIButton alloc]init];
    button2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:button2];

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changed) name:
     UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

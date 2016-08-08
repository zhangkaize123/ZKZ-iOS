//
//  ViewController.m
//  旋转方法之交换屏幕
//
//  Created by 张凯泽 on 15-2-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    Portraitview *volatileview;
    Landsapeview *h;
    float height;
    float width;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor redColor];
    
    [super viewDidLoad];
    height=[UIScreen mainScreen].bounds.size.height;
    width=[UIScreen mainScreen].bounds.size.width;
    
    
    
    
    NSLog(@"height=%g",height);
    NSLog(@"self.view.frame.size.height=%g",self.view.frame.size.height);
    NSLog(@"width=%g",width);
     NSLog(@"self.view.frame.size.width=%g",self.view.frame.size.width);

    
    
    
    
    
    volatileview=[[Portraitview alloc]init];
    h=[[Landsapeview alloc]init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changedic) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)changedic
{
    if ([UIDevice currentDevice].orientation==UIDeviceOrientationPortrait)
    {
        
        self.view=volatileview;
    }
    else if([UIDevice currentDevice].orientation==UIDeviceOrientationLandscapeLeft)
    {
        NSLog(@"************************");
        self.view=h;
        h.frame=CGRectMake(0, 0, height, width);
        //h.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        NSLog(@"height=%g",height);
        NSLog(@"self.view.frame.size.height=%g",self.view.frame.size.height);
        NSLog(@"width=%g",width);
        NSLog(@"self.view.frame.size.width=%g",self.view.frame.size.width);
        

        
    }
    else if([UIDevice currentDevice].orientation==UIDeviceOrientationLandscapeRight)
    {
        NSLog(@"************************");

        self.view=h;
        h.frame=CGRectMake(0, 0, height, width);
        
        //h.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        NSLog(@"height=%g",height);
        NSLog(@"self.view.frame.size.height=%g",self.view.frame.size.height);
        NSLog(@"width=%g",width);
        NSLog(@"self.view.frame.size.width=%g",self.view.frame.size.width);
        

        
    }

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  滑块与进度条应用
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
    //滑块
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(20, 20, 300, 30)];
    slider.tag=10;
    slider.minimumValue=0;
    slider.maximumValue=10;
    [slider addTarget:self action:@selector(valuchange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    
        //进度条
    UIProgressView *prog=[[UIProgressView alloc]initWithFrame:CGRectMake(20, 100, 300, 20)];
    prog.progress=0;
    
    //prog.backgroundColor=[UIColor grayColor];
    prog.tag=11;
    [self.view addSubview:prog];
    //lable
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 300, 20)];
    lable.textColor=[UIColor blackColor];
    //lable.backgroundColor=[UIColor clearColor];
    lable.textAlignment=NSTextAlignmentCenter;
    
    lable.tag=12;
    lable.text=[NSString stringWithFormat:@"%d%%",(int)prog.progress];
    [self.view addSubview:lable];

    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)valuchange:(UISlider *)sender
{
    //NSLog(@"sdfsf");
    UIProgressView *p=(UIProgressView *)[self.view viewWithTag:11];
    float value=sender.value;
    [p setProgress:value/10.0];
       UILabel *l=(UILabel *)[self.view viewWithTag:12];
    NSString *string=[[NSString alloc]initWithFormat:@"%d%%",(int)(value*10.0)];
    [l setText:string];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

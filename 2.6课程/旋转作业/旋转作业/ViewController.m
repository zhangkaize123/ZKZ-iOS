//
//  ViewController.m
//  旋转作业
//
//  Created by 张凯泽 on 15-2-7.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *lable1;
    UILabel *lable2;
    UILabel *lable3;
    UILabel *lable4;
    UILabel *lable5;
    UILabel *lable6;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dictChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    lable1=[[UILabel alloc]init];
    lable1.backgroundColor=[UIColor greenColor];
    lable1.text=@"1";
    lable1.textAlignment=NSTextAlignmentCenter;
    lable1.textColor=[UIColor redColor];
    [self.view addSubview:lable1];
    
    lable2=[[UILabel alloc]init];
    lable2.backgroundColor=[UIColor grayColor];
    lable2.text=@"2";
        lable2.textAlignment=NSTextAlignmentCenter;
    lable2.textColor=[UIColor redColor];
    [self.view addSubview:lable2];

    lable3=[[UILabel alloc]init];
    lable3.backgroundColor=[UIColor purpleColor];
    lable3.text=@"3";
        lable3.textAlignment=NSTextAlignmentCenter;
    lable3.textColor=[UIColor redColor];
    [self.view addSubview:lable3];
    
    lable4=[[UILabel alloc]init];
    lable4.backgroundColor=[UIColor orangeColor];
    lable4.text=@"4";
        lable4.textAlignment=NSTextAlignmentCenter;
    lable4.textColor=[UIColor redColor];
    [self.view addSubview:lable4];

    lable5=[[UILabel alloc]init];
    lable5.backgroundColor=[UIColor blueColor];
    lable5.text=@"5";
        lable5.textAlignment=NSTextAlignmentCenter;
    lable5.textColor=[UIColor redColor];
    [self.view addSubview:lable5];

    lable6=[[UILabel alloc]init];
    lable6.backgroundColor=[UIColor brownColor];
    lable6.text=@"6";
        lable6.textAlignment=NSTextAlignmentCenter;
    lable6.textColor=[UIColor redColor];
    [self.view addSubview:lable6];

    
   
}
-(void)dictChange
{
    NSLog(@"旋转发生改变");
   UIDeviceOrientation dict=[UIDevice currentDevice].orientation;
    if (dict==UIDeviceOrientationPortrait)
    {
        NSLog(@"竖向%@",NSStringFromCGRect(self.view.frame));
        [lable1 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100, (self.view.frame.size.height-100)/2-100, 100, 100)];
        NSLog(@"%f",(self.view.frame.size.width-100)/2-100);
        [lable2 setFrame:CGRectMake((self.view.frame.size.width-100)/2+100, (self.view.frame.size.height-100)/2-100, 100, 100)];
        NSLog(@"%f",(self.view.frame.size.width-100)/2+100);
        [lable3 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100, (self.view.frame.size.height-100)/2+10, 100, 100)];
        [lable4 setFrame:CGRectMake((self.view.frame.size.width-100)/2+100, (self.view.frame.size.height-100)/2+10, 100, 100)];
        [lable5 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100, (self.view.frame.size.height-100)/2+120, 100, 100)];
        [lable6 setFrame:CGRectMake((self.view.frame.size.width-100)/2+100, (self.view.frame.size.height-100)/2+120, 100, 100)];
        
    }
    
    //left横屏
    else if (dict==UIDeviceOrientationLandscapeLeft)
    {
        
        NSLog(@"左向%@",NSStringFromCGRect(self.view.frame));
        
//横屏时  X－－－－－－>竖屏Y
        [lable2 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100,self.view.frame.size.height-((self.view.frame.size.height-100)/2+200) , 100, 100)];
        [lable1 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        [lable3 setFrame:CGRectMake((self.view.frame.size.width-100)/2+10, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        [lable4 setFrame:CGRectMake((self.view.frame.size.width-100)/2+10,        self.view.frame.size.height-((self.view.frame.size.height-100)/2+200), 100, 100)];
        [lable5 setFrame:CGRectMake((self.view.frame.size.width-100)/2+120, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        [lable6 setFrame:CGRectMake((self.view.frame.size.width-100)/2+120,self.view.frame.size.height-((self.view.frame.size.height-100)/2+200), 100, 100)];
    }
        //right横屏
    else if(dict==UIDeviceOrientationLandscapeRight)
    {
        
        [lable5 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100,self.view.frame.size.height-((self.view.frame.size.height-100)/2+200) , 100, 100)];
        [lable3 setFrame:CGRectMake((self.view.frame.size.width-100)/2+10,        self.view.frame.size.height-((self.view.frame.size.height-100)/2+200), 100, 100)];
        [lable1 setFrame:CGRectMake((self.view.frame.size.width-100)/2+120,self.view.frame.size.height-((self.view.frame.size.height-100)/2+200), 100, 100)];
        [lable6 setFrame:CGRectMake((self.view.frame.size.width-100)/2-100, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        [lable4 setFrame:CGRectMake((self.view.frame.size.width-100)/2+10, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        [lable2 setFrame:CGRectMake((self.view.frame.size.width-100)/2+120, self.view.frame.size.height-((self.view.frame.size.height-100)/2-100+100), 100, 100)];
        
    }
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

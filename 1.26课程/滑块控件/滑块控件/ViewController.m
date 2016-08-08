//
//  ViewController.m
//  滑块控件
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
    //
    slider.minimumValue=0;
    //设定最大值
    slider.maximumValue=10;
    //
    //
    //
    slider.tag=10;
    [slider addTarget:self action:@selector(valuechang:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    //按钮
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 70, 300, 40)];
    button.backgroundColor=[UIColor greenColor];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(oktag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //文本框
    UITextField *text=[[UITextField alloc]initWithFrame:CGRectMake(20, 150, 300, 40)];
    text.backgroundColor=[UIColor grayColor];
    text.placeholder=@"请输入1-10之间的数";
    text.tag=11;
    [self.view addSubview:text];
    //lable
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 200, 300, 40)];
    lable.backgroundColor=[UIColor blueColor];
    lable.tag=15;
    [self.view addSubview:lable];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)oktag:(UIButton *)sender
{
    
 UISlider *s=(UISlider*)[self.view viewWithTag:10];
//    NSLog(@"%f",s.value);
    UITextField *t1=(UITextField*)[self.view viewWithTag:11];
    NSString *str=t1.text;
    a=[str floatValue];
    [s setValue:a];
    
}
-(void)valuechang:(UISlider *)sender
{
    UILabel *s=(UILabel*)[self.view viewWithTag:15];
    NSString *string=[[NSString alloc]initWithFormat:@"%g",sender.value ];
    [s setText:string];
    s.textColor=[UIColor redColor];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

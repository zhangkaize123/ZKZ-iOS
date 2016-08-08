//
//  ViewController.m
//  动画
//
//  Created by 张凯泽 on 15-2-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    UILabel *lable;
}
@end

@implementation ViewController

- (void)viewDidLoad

{
    
    lable=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 60, 200, 40)];
    lable.backgroundColor=[UIColor orangeColor];
    
    [self.view addSubview:lable];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 300, 70, 40)];
    button.backgroundColor=[UIColor grayColor];
    button.showsTouchWhenHighlighted=YES;
    [button addTarget:self action:@selector(movetage) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"移动" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    UIButton *button1=[[UIButton alloc]initWithFrame:CGRectMake(110, 300, 70, 40)];
    button1.backgroundColor=[UIColor grayColor];
    button1.showsTouchWhenHighlighted=YES;
    [button1 addTarget:self action:@selector(scaletage) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"缩放" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(200, 300, 70, 40)];
    button2.showsTouchWhenHighlighted=YES;
    [button2 addTarget:self action:@selector(rocationtage) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor=[UIColor grayColor];
    [button2 setTitle:@"旋转" forState:UIControlStateNormal];
    [self.view addSubview:button2];

    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//
-(void)movetage

{
    lable.transform=CGAffineTransformMakeTranslation(-5, 5);
    //NSLog(@"*****");
}
-(void)scaletage
{
  //宽和高在原来的基础上缩放多少倍
    lable.transform=CGAffineTransformMakeScale(0.5, 0.5);
    
}
-(void)rocationtage
{
    //旋转输入的是弧度
    lable.transform=CGAffineTransformMakeRotation(90*M_PI/180);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

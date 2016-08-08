//
//  ViewController.m
//  多行文本控件
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
    //设定根视图背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
    //创建多行文本控件
    tv=[[UITextView alloc]initWithFrame:CGRectMake(20, 20, 300, 300)];
    tv.backgroundColor=[UIColor brownColor];
    [self.view addSubview:tv];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(325, 120, 50, 40)];
    btn.backgroundColor=[UIColor grayColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)oktap:(id)sender
{
    //如何在换行。
    tv.text=@"123\r\n345";
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

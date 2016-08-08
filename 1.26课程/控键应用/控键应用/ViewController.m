//
//  ViewController.m
//  控键应用
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
    
    //背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
    
    //分段栏
    NSArray *array=[[NSArray alloc]initWithObjects:@"开关",@"文本", nil];
    seg=[[UISegmentedControl alloc]initWithItems:array];
    [seg setFrame:CGRectMake((self.view.frame.size.width-200)/2, 20, 200, 40)];
    [seg addTarget:self action:@selector(valuechange1:) forControlEvents:UIControlEventValueChanged];
    seg.selectedSegmentIndex=0;
    [self.view addSubview:seg];
    //开关按钮
    sw1=[[UISwitch alloc]init];
    [sw1 setFrame:CGRectMake((self.view.frame.size.width-200)/2, 80, 51, 31)];
    sw1.hidden=NO;
    
    [self.view addSubview:sw1];
    [sw1 addTarget:self action:@selector(valuechange2:) forControlEvents:UIControlEventValueChanged];
    //开关按钮
    sw2=[[UISwitch alloc]init];
    [sw2 setFrame:CGRectMake((self.view.frame.size.width-200)/2+150, 80, 51, 31)];
    sw2.hidden=NO;
    [sw2 addTarget:self action:@selector(valuechange3:)
  forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw2];
    
    //姓名标签
    lable=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 150, 40, 40)];
    lable.text=@"姓名";
    lable.textColor=[UIColor blackColor];
    lable.hidden=YES;
    [self.view addSubview:lable];
    
    //文本框
    text=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2+40, 150, 100, 40)];
    text.backgroundColor=[UIColor blueColor];
    text.placeholder=@"请输入姓名";
    text.hidden=YES;
    [self.view addSubview:text];
    //确定按钮
    button=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2+150, 150, 50, 40)];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actiontap:) forControlEvents:UIControlEventTouchUpInside];
    button.showsTouchWhenHighlighted=YES;
    button.hidden=YES;
    button.backgroundColor=[UIColor brownColor];
    [self.view addSubview:button];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//确定按钮
-(void)actiontap:(UIButton *)sender
{

    NSString *str=text.text;
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    text.text=@"";
    
    
}
//提出来的方法。
-(void)seton:(BOOL)_value
{
    lable.hidden=_value;
    button.hidden=_value;
    text.hidden=_value;
    sw1.hidden=!_value;
    sw2.hidden=!_value;
    
}
//分段栏
-(void)valuechange1:(UISegmentedControl*)sender
{
    
    if (sender.selectedSegmentIndex==0)
    {
        //对于相同的代码提出来做成函数。
        [self seton:YES];
//        lable.hidden=YES;
//        button.hidden=YES;
//        text.hidden=YES;
//        sw1.hidden=NO;
//        sw2.hidden=NO;
        
    }
    if (sender.selectedSegmentIndex==1)
    {
        [self seton:NO];
//        lable.hidden=NO;
//        button.hidden=NO;
//        text.hidden=NO;
//        sw1.hidden=YES;
//        sw2.hidden=YES;
        
    }
}

//如果两个switch用响应相同的点击事件是可以做成一个方法来实现。
//如果区分的话就用tag 或者通过他上边的字符。
//开关按钮1
-(void)valuechange2:(UISwitch*)sender
{
    if(sender.on==YES)
    
    {
        sw2.on=YES;
    }
    if (sender.on==NO)
    {
        sw2.on=NO;
    }
    
}
//开关按钮2
-(void)valuechange3:(UISwitch*)sender
{
    
    if(sender.on==YES)
        
    {
        sw1.on=YES;
    }
    if (sender.on==NO)
    {
        sw1.on=NO;
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

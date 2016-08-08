//
//  ViewController.m
//  开关空件
//
//  Created by 张凯泽 on 15-1-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//开关控键
- (void)viewDidLoad
{
    //1.开关控键
    //开关空件的width=51和height=31是固定的不能改变。
    self.view.backgroundColor=[UIColor whiteColor];
    UISwitch *sw=[[UISwitch alloc]initWithFrame:CGRectMake((self.view.frame.size.width-51)/2, 20, 200, 200)];
    sw.on=YES;//改变开关控键的状态。
    sw.tag=10;//定义sw的标签。
    //开关控键触发事件。
    [sw addTarget:self action:@selector(valuechange:) forControlEvents:UIControlEventValueChanged];
    CGRect r=sw.frame;
    NSLog(@"%@",NSStringFromCGRect(r));//----->求r的CGRect
   // NSLog(@"width=%g",sw.frame.size.width);
    //NSLog(@"height=%g",sw.frame.size.height);
    [self.view addSubview:sw];
    
    
    //2.分段控键可以指定高度和宽度   至少分成两端
    NSArray *items=[[NSArray alloc]initWithObjects:@"第一个",@"第二个" ,@"第三个",nil];
    UISegmentedControl *sgm=[[UISegmentedControl alloc]initWithItems:items];
    sgm.frame=CGRectMake(20, 150, 200, 20);
    sgm.tag=11;
    //sgm.selectedSegmentIndex=2;//索引
    [self.view addSubview:sgm];
    [sgm addTarget:self action:@selector(valuechange1:) forControlEvents:UIControlEventValueChanged];

    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 40)];
    button.backgroundColor=[UIColor greenColor];
    [button addTarget:self action:@selector(okTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)valuechange1:(UISegmentedControl *)sender
{
    NSLog(@"%ld",(long)sender.selectedSegmentIndex);
    
}



-(void)valuechange:(UISwitch *)sender
{
    
}
-(void)okTag:(UIButton *)sender
{
    
    
   UISegmentedControl *segm=(UISegmentedControl *) [self.view viewWithTag:11];//强制转换成（UISegmentedControl *）
    NSInteger num=segm.selectedSegmentIndex;
    NSString *string=[segm titleForSegmentAtIndex:num];
    NSLog(@"%@",string);
    
    
    
    
//    UISwitch *s=[self.view viewWithTag:10];
//    if(s.on)//开关空件里的一个属性判定开关控键在什么状态。
//    {
//        NSLog(@"开关空件为打开");
//
//    }
//    else
//    {
//        NSLog(@"开关空件为关闭");
//    }
//    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

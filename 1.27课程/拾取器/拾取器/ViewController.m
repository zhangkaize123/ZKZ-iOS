//
//  ViewController.m
//  拾取器
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
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIDatePicker *dp=[[UIDatePicker alloc]init];
    dp.tag=10;
    //打印拾取器的高和快----->有固定高和宽
    NSLog(@"%@",NSStringFromCGRect(dp.frame));
    //变成中文标示。
    dp.locale=[NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    //显示模式-->x显示日期
    //dp.datePickerMode=UIDatePickerModeDate;
    //显示时间
    dp.datePickerMode=UIDatePickerModeCountDownTimer;
    //事件处理－－－》增加目标
    [dp addTarget:self action:@selector(valuechange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:dp];
    
    //使用按钮得到日期
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 250, 200, 40)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(datevalue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    UILabel *l1=[[UILabel alloc]initWithFrame:CGRectMake(20, 500, 200, 50)];
    l1.backgroundColor=[UIColor grayColor];
    [self.view addSubview:l1];
    UIButton *b=[[UIButton alloc]initWithFrame:CGRectMake(20, 500, 30, 30)];
    b.tag=11;
    b.backgroundColor=[UIColor redColor];
    [self.view addSubview:b];
    
    UIButton *b1=[[UIButton alloc]initWithFrame:CGRectMake(20, 600, 30, 30)];
    
    [b1 addTarget:self action:@selector(www:) forControlEvents:UIControlEventTouchUpInside];
    b1.backgroundColor=[UIColor greenColor];
    [self.view addSubview:b1];
    
    
    
    
    
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)www:(UIButton *)sender
{
    UIButton *bb=(UIButton *)[self.view viewWithTag:11];
    [bb setTitle:@"你" forState:UIControlStateNormal];
    
    
    
}



//实现行为
-(void)valuechange:(UIDatePicker*)sender
{
    //日期格式
    NSDateFormatter *fm=[[NSDateFormatter alloc]init];
    [fm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //把日期－－－》字符串类型。
    NSLog(@"%@",[fm stringFromDate:sender.date]);
}
-(void)datevalue:(UIButton*)sender
{
    UIDatePicker *d=(UIDatePicker *)[self.view viewWithTag:10];
    NSDateFormatter *fm=[[NSDateFormatter alloc]init];
    [fm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //把日期－－－》字符串类型。
    [sender setTitle:[fm stringFromDate:d.date] forState:UIControlStateNormal];//
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

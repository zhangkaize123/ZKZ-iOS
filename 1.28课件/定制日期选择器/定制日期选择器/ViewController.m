//
//  ViewController.m
//  定制日期选择器
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    //创建月
    self.moths=[[NSMutableArray alloc]initWithCapacity:12];
    for (int i=1; i<=12; i++)
    {
        NSString *moth=[[NSString alloc]initWithFormat:@"%d",i];
        [self.moths addObject:moth];
    }
    //创建年
    self.years=[[NSMutableArray alloc]initWithCapacity:100];
    for (int i=2015; i>=1965; i--)
    {
        NSString *year=[[NSString alloc]initWithFormat:@"%d",i];
        [self.years addObject:year];
    }
    //创建天
    self.days=[[NSMutableArray alloc]initWithCapacity:100];
    for (int i=1; i<=31; i++)
    {
        NSString *day=[[NSString alloc]initWithFormat:@"%d",i];
        [self.days addObject:day];
    }
    //创建自定义拾取器
    pv=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
    pv.delegate=self;
    [pv selectRow:10 inComponent:2 animated:YES];
    [pv selectRow:1 inComponent:0 animated:YES];
    [pv selectRow:1 inComponent:1 animated:YES];
    [self.view addSubview:pv];

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)
    {
        return self.moths.count;
    }
    else if(component==1)
    {
        
        return self.years.count;
    }
    else
    {
        
        return self.days.count;
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    if (component==0)
    {
        return self.moths[row];
    }
    else if(component==1)
    {
        
        return self.years[row];
    }
    else
    {
//        if (<#condition#>)
//        {
//            <#statements#>
//        }
        
        return self.days[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    row1=row;
    col1=component;
    NSLog(@"%d",[((NSString*)self.years[row1]) intValue]);
    NSLog(@"%d",[((NSString*)self.moths[row1]) intValue]);
    if ([((NSString*)self.years[row1]) intValue]/4==0&&col1==1)
    {
        
        
        switch ([((NSString*)self.moths[row1]) intValue])
        {
            case 2:
                [self.days removeObjectAtIndex:29];
                [self.days removeObjectAtIndex:30];
                [self.days removeObjectAtIndex:31];
                break;
                
            default:
                break;
        }
    }
    
    
    NSLog(@"row1=%ld",(long)row1);
    NSLog(@"col1=%ld",(long)col1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

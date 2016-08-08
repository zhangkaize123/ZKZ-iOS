//
//  ViewController.m
//  日期
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
    //设定背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
    years=[[NSMutableArray alloc]initWithCapacity:100];
    months=[[NSMutableArray alloc]initWithCapacity:100];
    days=[[NSMutableArray alloc]initWithCapacity:100];
    //拾取器的指定
    pv=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 80, 200, 200)];
    [self.view addSubview:pv];
    NSDate *date=[NSDate date];
    NSDateFormatter *fm=[[NSDateFormatter alloc]init];
    [fm setDateFormat:@"yyyy-MM-dd"];
    NSString *str=[fm stringFromDate:date];
    NSArray *array=[str componentsSeparatedByString:@"-"];
    int year=((NSString *)array[0]).intValue;
    int month=((NSString *)array[1]).intValue;
    int day=((NSString *)array[2]).intValue;
    pv.delegate=self;
    
    //把年加到数组中去
    for (int i=year; i>=year-50; i--)
    {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    //把月加到数组中去
    for (int i=1; i<=12; i++)
    {
        [months addObject:[NSString stringWithFormat:@"%d",i]];
    }
    //把天数加到数组中去
    [self daysWithYear:year andWith:month];
    //设置默认选项。
    [pv selectRow:0 inComponent:0 animated:YES];
    [pv selectRow:0 inComponent:1 animated:YES];
    [pv selectRow:day-1 inComponent:2 animated:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//给天数做一个函数
-(void)daysWithYear:(int)year andWith:(int)month
{
    int d;
    if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)
    {
        d=31;
    }
    else if(month==4 || month==6 || month==9 || month==11 )
    {
        d=30;
    }
    else if(year%4==0)
    {
        d=29;
    }
    else
    {
        d=28;
    }
    [days removeAllObjects];
    for(int i=1;i<=d;i++)
    {
        [days addObject:[NSString stringWithFormat:@"%d",i]];
    }

}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)
    {
        return years.count;
    }
    else if (component==1)
    {
        return months.count;
    }
    else
    {
       return days.count;
    }
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0)
    {
        return years[row];
    }
    else if (component==1)
    {
        return months[row];
    }
    else
    {
        return days[row];
    }

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)
    {
        
        int a=((NSString *)years[row]).intValue;
        int b=[pv selectedRowInComponent:1];
        //int d=[pv selectedRowInComponent:0];
        //NSLog(@"d=====%d====",d);
        //int e=((NSString *)years[d]).intValue;
        //NSLog(@"e=====%d====",e);
       // NSLog(@"a=====%d====",a);

        int c=((NSString *)months[b]).intValue;
        [self daysWithYear:a andWith:c];
        //重新加载
        [pickerView reloadComponent:2];
    }
    else if(component==1)
    {
        int a=((NSString *)months[row]).intValue;
        int b=[pv selectedRowInComponent:0];
        int c=((NSString *)years[b]).intValue;
        [self daysWithYear:c andWith:a];
        [pickerView reloadComponent:2];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

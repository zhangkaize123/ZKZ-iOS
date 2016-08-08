//
//  ViewController.m
//  日历
//
//  Created by wyzc on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    years=[[NSMutableArray alloc]initWithCapacity:100];
    months=[[NSMutableArray alloc]initWithCapacity:100];
    days=[[NSMutableArray alloc]initWithCapacity:100];
    NSDate * now=[NSDate date];
    NSDateFormatter * fm=[[NSDateFormatter alloc]init];
    [fm setDateFormat:@"yyyy"];
    NSString *strYear=[fm stringFromDate:now];
    NSLog(@"%@",strYear);
    int year=[strYear intValue];
    [fm setDateFormat:@"MM"];
    NSString *strMonth=[fm stringFromDate:now];
    int month=[strMonth intValue];
    [fm setDateFormat:@"dd"];
    NSString *strDay=[fm stringFromDate:now];
    int day=[strDay intValue];
    NSLog(@"%@",strDay);
    for(int i=year-50;i<=year;i++)
    {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for(int i=1;i<=12;i++)
    {
        [months addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self daysWithYear:year andWithMonth:month];
    UIPickerView * pv=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, 300, 200)];
    pv.delegate=self;
    [pv selectRow:50 inComponent:0 animated:YES];
    [pv selectRow:month-1 inComponent:1 animated:YES];
    [pv selectRow:day-1 inComponent:2 animated:YES];
    [self.view addSubview:pv];
}
-(void)daysWithYear:(int)year andWithMonth:(int)month
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
    if(component==0)
        return years.count;
    else if(component==1)
        return months.count;
    else
        return days.count;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
        return years[row];
    else if(component==1)
        return months[row];
    else
        return days[row];
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString * strYear,*strMonth;
    if(component==0)//重新选择年
    {
        NSInteger a=[pickerView selectedRowInComponent:0];//得到的是下标不是里边的数值。
        NSLog(@"gfdfgd%ld",(long)a);
        strYear=years[row];
        strMonth=months[[pickerView selectedRowInComponent:1]];
        [self daysWithYear:strYear.intValue andWithMonth:strMonth.intValue];
        [pickerView reloadComponent:2];
    }
    else if(component==1)//重新选择月
    {
        strYear=years[[pickerView selectedRowInComponent:0]];
        strMonth=months[row];
        [self daysWithYear:strYear.intValue andWithMonth:strMonth.intValue];
        [pickerView reloadComponent:2];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

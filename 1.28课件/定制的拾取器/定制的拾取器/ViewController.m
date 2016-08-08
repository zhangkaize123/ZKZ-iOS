//
//  ViewController.m
//  定制的拾取器
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
    self.sexs=[[NSArray alloc]initWithObjects:@"man",@"women", nil];
    self.names=[[NSArray alloc]initWithObjects:@"张三",@"里斯",@"王五",@"赵柳", nil];
    self.view.backgroundColor=[UIColor whiteColor];
    //1.创建一个拾取器对象
    UIPickerView *pv=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
    pv.delegate=self;
    //2.设定默认选项
   // pv selectRow:<#(NSInteger)#> inComponent:<#(NSInteger)#> animated:<#(BOOL)#>
    // 3.重新加载哪一列
    //pv reloadComponent:<#(NSInteger)#>
    //4.选择行对应的列---->得到的是那个下表
    //pv selectedRowInComponent:<#(NSInteger)#>
   //
    //
    [self.view addSubview:pv];
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//UIPickerViewDataSource 里边的行为
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
//UIPickerViewDataSource 里边的行为
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0)
    {
        return self.sexs.count;
    }
    else
    {
        return self.names.count;
    }
}
//UIPickerViewDelegate里边的行为
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0)
    {
        return self.sexs[row];
    }
    else
    {
        return self.names[row];
    }

}
//确定了选择的行和列是多少。
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

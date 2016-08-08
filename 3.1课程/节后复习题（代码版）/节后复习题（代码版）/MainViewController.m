//
//  MainViewController.m
//  节后复习题（代码版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
/*
 创建的3个控制器都是相同所有设置一个父类让三个类都继承这个父类。
 
 */
@interface MainViewController ()<ZKZOneview>
{
    UISegmentedControl*seg;
    UILabel*showLabel;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //分段控件
    seg=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"1",@"2",@"3", nil]];
    seg.frame=CGRectMake((self.view.frame.size.width-100)/2, 20, 100, 40);
    seg.selectedSegmentIndex=0;
    [self.view addSubview:seg];
    //按钮
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 80, 100, 40)];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //显示传值label
    showLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 200, 200, 40)];
    showLabel.backgroundColor=[UIColor yellowColor];
    showLabel.textAlignment=NSTextAlignmentCenter;
    //label.text=self.sendText;
    [self.view addSubview:showLabel];

}

-(void)btnTap:(UIButton *)sender
{
    NSString * str=[seg titleForSegmentAtIndex:[seg selectedSegmentIndex]];
    if([str isEqualToString:@"1"])
    {
        oneViewController * one=[[oneViewController alloc]init];
        one.delegate=self;
        [one setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        //main---->other
        one.string=str;
        [self presentViewController:one animated:YES completion:nil];
    }

    
}
-(void)oneValue:(NSString *)str
{
    //other--->main
    showLabel.text=str;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

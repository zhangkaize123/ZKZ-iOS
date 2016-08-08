//
//  OtherViewController.m
//  视图切换
//
//  Created by wyzc on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"other视图的已经加载！");
    self.view.backgroundColor=[UIColor lightGrayColor];
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    text.backgroundColor=[UIColor grayColor];
    text.placeholder=@"请输入";
    text.text=self.sendString;
    [self.view addSubview:text];
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 40)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)closeTap:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"other视图的将要出现！");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"other视图的已经出现！");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"other视图的将要消失！");
    self.main.sendString=text.text;
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"other视图的已经消失！");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

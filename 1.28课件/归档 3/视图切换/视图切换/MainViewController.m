//
//  MainViewController.m
//  视图切换
//
//  Created by wyzc on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "OtherViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"主视图的加载完成！");
    self.view.backgroundColor=[UIColor whiteColor];
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    text.backgroundColor=[UIColor grayColor];
    text.placeholder=@"请输入";
    [self.view addSubview:text];
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 40)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"主视图的将要出现！");
    //text.text=self.sendString;
}
-(void)setSendString:(NSString *)sendString
{
    text.text=sendString;
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"主视图的已经出现！");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"主视图的将要消失！");
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"主视图的已经消失！");
}
-(void)showTap:(UIButton *)sender
{
    OtherViewController * other=[[OtherViewController alloc]init];
    [other setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    other.sendString=text.text;
    other.main=self;
    [self presentViewController:other animated:YES completion:nil];
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

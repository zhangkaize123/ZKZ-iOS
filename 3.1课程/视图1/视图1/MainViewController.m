//
//  MainViewController.m
//  视图1
//
//  Created by wyzc on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface MainViewController ()

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
}
-(void)btnTap:(id)sender
{
    NSString * str=[seg titleForSegmentAtIndex:[seg selectedSegmentIndex]];
    if([str isEqualToString:@"1"])
    {
        OneViewController * one=[[OneViewController alloc]init];
        [one setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        one.sendText=str;
        [self presentViewController:one animated:YES completion:nil];
    }
    else if([str isEqualToString:@"2"])
    {
        TwoViewController * two=[[TwoViewController alloc]init];
        [two setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        two.sendText=str;
        [self presentViewController:two animated:YES completion:nil];
    }
    else if([str isEqualToString:@"3"])
    {
        ThreeViewController * two=[[ThreeViewController alloc]init];
        [two setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        two.sendText=str;
        [self presentViewController:two animated:YES completion:nil];
    }
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

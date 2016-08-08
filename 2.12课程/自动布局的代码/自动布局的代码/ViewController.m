//
//  ViewController.m
//  自动布局的代码
//
//  Created by 张凯泽 on 15-2-12.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor orangeColor];
    
//    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(200, 200, 100, 40)];
//    lable.backgroundColor=[UIColor greenColor];
//    [self.view addSubview:lable];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 30, 200, 40)];
    btn.backgroundColor=[UIColor grayColor];
    [btn setTitle:@"确定ggggggggggggggg" forState:UIControlStateNormal];
    //必须关闭自动调整到自动布局的转换。
    btn.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btn];
    //设置宽度
    NSLayoutConstraint *c11=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    //设置高度
    NSLayoutConstraint *c12=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    //水平
    NSLayoutConstraint *constraint=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    //距离父控件20个距离
    NSLayoutConstraint *topconstraint=[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    
                         
    [self.view addConstraint:constraint];
    [self.view addConstraint:topconstraint];
    
    [self.view addConstraint:c11];
    [self.view addConstraint:c12];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

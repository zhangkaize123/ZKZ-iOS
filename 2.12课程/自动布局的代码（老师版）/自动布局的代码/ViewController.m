//
//  ViewController.m
//  自动布局的代码
//
//  Created by wyzc on 15-2-12.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左上按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"测试按钮" forState:UIControlStateNormal];
    [button sizeToFit];
    [button setBackgroundColor:[UIColor yellowColor]];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    
    NSLayoutConstraint *constraint;
    
    //上边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeTop
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeTop
                  multiplier:1.0f
                  constant:20.0f];
    [self.view addConstraint:constraint];
    
    //左边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeLeading
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeLeading
                  multiplier:1.0f
                  constant:20.0f];
    [self.view addConstraint:constraint];
    //设定宽度
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:nil
                  attribute:NSLayoutAttributeNotAnAttribute
                  multiplier:1.0f
                  constant:100.0f];
    [self.view addConstraint:constraint];
    
    //设定高度
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationEqual
                  toItem:nil
                  attribute:NSLayoutAttributeNotAnAttribute
                  multiplier:1.0f
                  constant:100.0f];
    [self.view addConstraint:constraint];
    //右上按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"测试按钮2" forState:UIControlStateNormal];
    [button1 sizeToFit];
    [button1 setBackgroundColor:[UIColor blackColor]];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button1];
    //设定高度
    constraint = [NSLayoutConstraint
                  constraintWithItem:button1
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationEqual
                  toItem:button
                  attribute:NSLayoutAttributeHeight
                  multiplier:1.0f
                  constant:0];
    [self.view addConstraint:constraint];
    //设定宽度
    constraint = [NSLayoutConstraint
                  constraintWithItem:button1
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:button
                  attribute:NSLayoutAttributeWidth
                  multiplier:1.0f
                  constant:0];
    [self.view addConstraint:constraint];
    //上边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button1
                  attribute:NSLayoutAttributeTop
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeTop
                  multiplier:1.0f
                  constant:20.0f];
    [self.view addConstraint:constraint];
    
    //右边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button1
                  attribute:NSLayoutAttributeTrailing
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeTrailing
                  multiplier:1.0f
                  constant:-20.0f];
    [self.view addConstraint:constraint];
    /*
    //右边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeTrailing
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeTrailing
                  multiplier:1.0f
                  constant:-100.0f];
    [self.view addConstraint:constraint];
    
    //下边距
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeBottom
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeBottom
                  multiplier:1.0f
                  constant:-350.0f];
    [self.view addConstraint:constraint];
     */
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"测试按钮" forState:UIControlStateNormal];
    [button sizeToFit];
    [button setBackgroundColor:[UIColor yellowColor]];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:button];
    
    NSLayoutConstraint *constraint;
    
    //水平居中
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeCenterX
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterX
                  multiplier:1.0f
                  constant:0.0f];
    [self.view addConstraint:constraint];
    
    //垂直居中
    constraint = [NSLayoutConstraint
                  constraintWithItem:button
                  attribute:NSLayoutAttributeCenterY
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterY
                  multiplier:1.0f
                  constant:0.0f];
    [self.view addConstraint:constraint];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

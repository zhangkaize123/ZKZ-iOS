//
//  ViewController.m
//  自动布局test
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
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *v1=[[UIView alloc]init];
    
    v1.backgroundColor=[UIColor orangeColor];
    
    v1.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:v1];
    //自动布局
    NSLayoutConstraint *cW=[NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [self.view addConstraint:cW];
    NSLayoutConstraint *cH=[NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [self.view addConstraint:cH];
    
    NSLayoutConstraint *cC=[NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.view addConstraint:cC];
    
    
    
    
    
    
    UIView *v2=[[UIView alloc]init];
    
    v2.backgroundColor=[UIColor orangeColor];
    
    v2.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:v2];
    
    NSLayoutConstraint *cWW=[NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [self.view addConstraint:cWW];
    NSLayoutConstraint *cHH=[NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
    [self.view addConstraint:cHH];
//    NSLayoutConstraint *cCC=[NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
//    [self.view addConstraint:cC];

    NSLayoutConstraint *cccc=[NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeTrailing multiplier:1 constant:10];
    [self.view addConstraint:cccc];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  手势识别
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 使用storyboard 链接手势识别时：1拖拽手势到视图2.把代理拖拽到视图上（不是视图控制器）3.把select（方法）进行链接
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //轻击/dʒestʃə(r)/ /rekəgnaɪz/
    /*UITapGestureRecognizer *tgr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    
    [self.view addGestureRecognizer:tgr];
    
    
    UITapGestureRecognizer *tgr1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap1:)];
    //双击
    tgr1.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:tgr1];
    //当双击失败时  再识别单机。
    [tgr requireGestureRecognizerToFail:tgr1];
    */
    
}
-(void)onTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"this is tap单机");
}
-(void)onTap1:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"this is tap1双击");
}


//storyboard链接的方法。
- (IBAction)Tap:(UITapGestureRecognizer *)sender {
    NSLog(@"this is tap单机");
}
@end

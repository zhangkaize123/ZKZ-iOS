//
//  ViewController.m
//  旋转手势
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRotationGestureRecognizer *rgr=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(onRote:)];
    [self.view addGestureRecognizer:rgr];
    
}
-(void)onRote:(UIRotationGestureRecognizer*)recognizer
{
    //recognizer.rotation---->弧度值
    //recognizer.rotation*180/M_PI-----.>角度
    NSLog(@"%g",recognizer.rotation*180/M_PI);
    
}

@end

//
//  ViewController.m
//  图片控件
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //1.使用frame方法来初始化UIImageView
//    UIImageView *im=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
//    
//    [im setImage:[UIImage imageNamed:@"yumi.jpg"]];
    //[self.view addSubview:im];
    //2.通过图片方法来初始化UIImageView
    UIImage *image=[UIImage imageNamed:@"yumi.jpg"];
    //计算图片的width和height
    float width=image.size.width;
    float height=image.size.height;
    NSLog(@"width=%g,height=%g",width,height);
    UIImageView *im1=[[UIImageView alloc]initWithImage:image];
    [im1 setFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:im1];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

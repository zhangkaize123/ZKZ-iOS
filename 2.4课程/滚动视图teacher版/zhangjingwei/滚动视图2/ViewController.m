//
//  ViewController.m
//  滚动视图2
//
//  Created by 咖啡豆 on 15-2-4.
//  Copyright (c) 2015年 zhang Jingwei. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)loadScrollView
{
    UIButton * btn1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*3-100, self.view.frame.size.height/3*2, 80, 50)];
    btn1.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:btn1];
    
    
    scrol=[[UIScrollView alloc]initWithFrame:self.view.frame];
    scrol.backgroundColor=[UIColor grayColor];
    [self.view addSubview:scrol];
    
    UIImage * image1=[UIImage imageNamed:@"1.png"];
    UIImageView * imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView1.image=image1;
    [scrol addSubview:imageView1];
    
    UIImage * image2=[UIImage imageNamed:@"2.png"];
    UIImageView * imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView2.image=image2;
    [scrol addSubview:imageView2];
    
    UIImage * image3=[UIImage imageNamed:@"3.png"];
    UIImageView * imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width,self.view.frame.size.height)];
    imageView3.image=image3;
    [scrol addSubview:imageView3];
    
    UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*3-100, self.view.frame.size.height/3*2, 80, 50)];
    btn.backgroundColor=[UIColor orangeColor];
    [btn setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    [btn setTitle:@"开始体验" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(chickTap:) forControlEvents:UIControlEventTouchUpInside];
    [scrol addSubview:btn];
    
    //滚动范围
    scrol.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    
    //滚动条
    scrol.showsHorizontalScrollIndicator=NO;
    scrol.showsVerticalScrollIndicator=NO;
    scrol.bounces=NO;
    
    //以页滚动
    scrol.pagingEnabled=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //读文件
    NSString * path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"first.txt"];
    NSString * strFlag=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //判断是否是第一次启动
    if(strFlag==nil)
    {
        [self loadScrollView];
        strFlag=@"hello";
        [strFlag writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
}
-(void)chickTap:(UIButton *)sender
{
    [scrol removeFromSuperview];//从父视图移除
}
@end

//
//  ViewController.m
//  用户体验（保存数据）
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scrollView;
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSString *path=NSHomeDirectory();
    NSLog(@"%@",path);
    NSString *string=[[NSUserDefaults standardUserDefaults]objectForKey:@"one"];
    if (![string isEqualToString:@"YES"]) {
        scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:scrollView];
        UIImageView *i1=[[UIImageView alloc]initWithFrame:self.view.frame];
        i1.image=[UIImage imageNamed:@"1"];
        [scrollView addSubview:i1];
        
        UIImageView *i2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height)];
        i2.image=[UIImage imageNamed:@"2"];
        [scrollView addSubview:i2];
        scrollView.contentSize=CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height);
        //创建button
        //在创建按钮时注意他创建的位置＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.5-100+self.view.frame.size.width, 500, 200, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn addTarget:self action:@selector(okTap:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"用户体验" forState:UIControlStateNormal];
        [scrollView addSubview:btn];

    }
    
    
    
}
-(void)okTap:(UIButton *)sender
{
    [scrollView removeFromSuperview];
    [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"one"];
    NSLog(@"****");
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end

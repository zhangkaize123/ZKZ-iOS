//
//  ViewController.m
//  方向旋转
//
//  Created by 张凯泽 on 15-2-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#define HEIGHT self.view.frame.size.height
#define WIDTH self.view.frame.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor orangeColor];
    //方法1通过代码来调节
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dicTage) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    UITextField *text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, WIDTH-40, 40)];
    text.backgroundColor=[UIColor lightGrayColor];
    //2.使用自动适配方法
    text.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:text];
    
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT-20-40, WIDTH-40, 40)];
    button.backgroundColor=[UIColor brownColor];
    //2.使用自动适配方法
    button.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:button];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


/*
 ＊
 ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
 ＊
 ＊
 ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
 */
//-(void)dicTage
//{
//    NSString *str=@"2345";//=[obj object];
//    NSLog(@"方向发生改变%@",str);
//    UIDeviceOrientation dict=[UIDevice currentDevice].orientation;
//    if (dict==UIDeviceOrientationPortrait)
//    {
//        CGRect rect=self.view.frame;
//        // 把CGRect转化成字符串
//        NSString *string=NSStringFromCGRect(rect);
//        NSLog(@"%@",string);
//        
//        
//    }
//    else if (dict==UIDeviceOrientationLandscapeLeft)
//    {
//        CGRect rect=self.view.frame;
//        // 把CGRect转化成字符串
//        NSString *string=NSStringFromCGRect(rect);
//        NSLog(@"%@",string);
//
//    }
//    else if (dict==UIDeviceOrientationLandscapeRight)
//    {
//        CGRect rect=self.view.frame;
//        // 把CGRect转化成字符串
//        NSString *string=NSStringFromCGRect(rect);
//        NSLog(@"%@",string);
//
//    }
//    else if(dict==UIDeviceOrientationPortraitUpsideDown)
//    {
//        CGRect rect=self.view.frame;
//        // 把CGRect转化成字符串
//        NSString *string=NSStringFromCGRect(rect);
//        NSLog(@"%@",string);
//
//    }
//}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

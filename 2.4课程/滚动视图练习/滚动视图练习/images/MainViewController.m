//
//  MainViewController.m
//  滚动视图练习
//
//  Created by 张凯泽 on 15-2-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property(strong,nonatomic)NSString *string;
@property(strong,nonatomic)NSString *path;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    /*
     对于视图1.如果不要了可以删除removeview
            2.可以不加载这个视图。
            3.切换视图。
     
     */
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
   self.path=[NSHomeDirectory() stringByAppendingPathComponent:@"zkz.txt"];
    NSLog(@"%@",self.path);
    self.string =[[NSString alloc]initWithContentsOfFile:self.path encoding:NSUTF8StringEncoding error:nil];
    
   scrollview=[[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scrollview];
    if (![self.string isEqualToString:@"YES"])
    {
        
    
    v1=[[UIView alloc]initWithFrame:self.view.frame];
    v1.backgroundColor=[UIColor greenColor];
    [scrollview addSubview:v1];
    v2=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    v2.backgroundColor=[UIColor redColor];
    [scrollview addSubview:v2];
    v3=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height*2, self.view.frame.size.width, self.view.frame.size.height)];
    v3.backgroundColor=[UIColor blueColor];
    
    [scrollview addSubview:v3];
    
    //滚动视图设置滚动范围
    scrollview.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    scrollview.pagingEnabled=YES;
        //把按钮加在滚动视图上边
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, self.view.frame.size.height*3-200, 100, 40)];
    button.backgroundColor=[UIColor blueColor];
    [button setTitle:@"立即体验" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(oktage) forControlEvents:UIControlEventTouchUpInside];
    button.showsTouchWhenHighlighted=YES;
    [scrollview addSubview:button];
    }
    
}

-(void)oktage
{
    [scrollview removeFromSuperview];//把滚动视图从主视图中删除。
    //scrollview.hidden=YES;
    self.string=@"YES";
    [self.string writeToFile:self.path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
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

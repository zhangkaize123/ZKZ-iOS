//
//  MianViewController.m
//  滚动－页视图练习
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MianViewController.h"

@interface MianViewController ()

@end

@implementation MianViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    scrollview=[[UIScrollView alloc]initWithFrame:self.view.frame];
    UIImageView *i1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [i1 setImage:[UIImage imageNamed:@"icons.bundle/1.png"]];
    [scrollview addSubview:i1];
    UIImageView *i2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [i2 setImage:[UIImage imageNamed:@"icons.bundle/2.png"]];
    [scrollview addSubview:i2];
    UIImageView *i3=[[UIImageView alloc]initWithFrame:
                     CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [i3 setImage:[UIImage imageNamed:@"icons.bundle/3.png"]];
    [scrollview addSubview:i3];
    UILongPressGestureRecognizer *longpressgr =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longe:)];
    longpressgr.minimumPressDuration =1.2;
    [scrollview addGestureRecognizer:longpressgr];

    scrollview.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    
    scrollview.pagingEnabled=YES;
    //关闭水平方向的现实栏
    scrollview.showsHorizontalScrollIndicator=NO;
    //设置初始页____注意Y轴数值。
   // scrollview.contentOffset=CGPointMake(self.view.frame.size.width, 0);
    [self.view addSubview:scrollview];
    scrollview.delegate=self;
    //页视图
    
    pagecontrol=[[UIPageControl alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, self.view.frame.size.height-100, 100, 37)];
    pagecontrol.backgroundColor=[UIColor greenColor];
    pagecontrol.numberOfPages=3;
    //NSLog(@"________________________%@",NSStringFromCGRect(pagecontrol.frame));
    pagecontrol.pageIndicatorTintColor=[UIColor redColor];
    pagecontrol.currentPageIndicatorTintColor=[UIColor blueColor];
    [pagecontrol addTarget:self action:@selector(oktage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pagecontrol];
    //创建定时器
    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timetage:) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)longe:(UILongPressGestureRecognizer*)ges
{
    //NSLog(@"%@",ges);
}
//滚动视图的代理行为
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"&&&&&&&&&&&%@",NSStringFromCGPoint(scrollView.contentOffset));
    int indexpage=scrollView.contentOffset.x/self.view.frame.size.width;
    pagecontrol.currentPage=indexpage;
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 暂停下载
    NSLog(@"scrollViewWillBeginDragging");
    
}

/**
 *  当用户停止拖拽表格时调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 恢复下载
    NSLog(@"scrollViewDidEndDragging");
}

//点击页视图行为
-(void)oktage:(UIPageControl *)sender
{
    scrollview.contentOffset=CGPointMake(self.view.frame.size.width*sender.currentPage, 0);
    
}
//定时器的行为
-(void)timetage:(NSTimer*)sender
{
    //NSLog(@"wowowoowowowo");
    //关闭定时器
    //[sender invalidate];
    //启动定时器。
    // [sender fire];
}
//关闭状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end

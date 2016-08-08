//
//  ViewController.m
//  02多线程
//
//  Created by 张凯泽 on 15-3-19.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 多个线程运行一段代码，数据会产生不同步，所以要给这段代码加锁，或者同步代码。
 
 
 */
@interface ViewController ()
{
    int ticket;
    NSLock *lock;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//多线程方法1
- (IBAction)oneTap:(UIButton *)sender {
    ticket=100;
    /*
     1.多个线程可以做相同的事情，来减少程序的运行时间。
     
     
     */
    /*
     1.方法1:
     NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(runing:) object:nil];
    [thread start];
     */
    /*
    //方法2:
    [NSThread detachNewThreadSelector:@selector(runing:) toTarget:self withObject:@"123"];*/
    //方法3:
    [self performSelectorInBackground:@selector(runingg:) withObject:@"123"];
    
    NSThread *t=[[NSThread alloc]initWithTarget:self selector:@selector(runing:) object:nil];
    [t start];
    t.name=@"1号窗口";
    NSThread *tt=[[NSThread alloc]initWithTarget:self selector:@selector(runing:) object:nil];
    [tt start];
    tt.name=@"2号窗口";
    NSThread *ttt=[[NSThread alloc]initWithTarget:self selector:@selector(runing:) object:nil];
    [ttt start];
    ttt.name=@"3号窗口";
    NSThread *tttt=[[NSThread alloc]initWithTarget:self selector:@selector(runing:) object:nil];
    [tttt start];
    tttt.name=@"4号窗口";
    
}
-(void)runingg :(id)obj//进行传值＊＊＊＊
{
    NSLog(@"_______%@",obj);
}
-(void)runing:(id)obj
{
    while (1)
    {
        @synchronized(self)//括号里放的是全局变量，同步代码
        {
            //[lock lock];//加锁
            if (ticket>0)
            {
                [NSThread sleepForTimeInterval:0.1];
                NSLog(@"%@卖出%d号车票",[NSThread currentThread].name,ticket--);
            }
            //[lock unlock];//解锁
        }
        
    }
    
}
//多线程方法2
- (IBAction)twoTap:(UIButton *)sender {
    NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(runing2:) object:nil];
    [operation start];
}
-(void)runing2:(id)_obj
{
    //GCD -----中央调度的缩写；
   
    NSInvocationOperation *io=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(rrrr:) object:nil];
    //使用队列的方式
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [queue addOperation:io];
    
    
    
    
}
-(void)rrrr:(id)obj
{
    NSLog(@"tttttt");
}


@end

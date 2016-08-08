//
//  ViewController.m
//  使用GCD 卖火车票
//
//  Created by 张凯泽 on 15-3-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSLock *l;
}
- (IBAction)ticketTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    l=[[NSLock alloc]init];
    
}
- (IBAction)ticketTap {
    //GCD
    __block int ticket=100;
    void (^sale)(void)=^{
        while (1)
        {
            //@synchronized(self)//同步代码
            //[l lock];//加锁
            //{
            if (ticket>0)
            {
                [NSThread sleepForTimeInterval:1.1];
                NSLog(@"%d,%@",ticket--,[NSThread currentThread]);
            }
                //[l unlock];
            //}
        }
    };
//    dispatch_async(dispatch_get_global_queue(0, 0), sale);
//    dispatch_async(dispatch_get_global_queue(0, 0), sale);
//    dispatch_async(dispatch_get_global_queue(0, 0), sale);
//    dispatch_async(dispatch_get_global_queue(0, 0), sale);
    //以下方法是通过创建串行或者并行队列来进行的
    //通过创建队列－－－串行 异步形式－不需要枷锁
//    dispatch_queue_t q=dispatch_queue_create("zkz", DISPATCH_QUEUE_SERIAL);
//    //1号窗口
//    dispatch_async(q, sale);
//    //2号窗口
//    dispatch_async(q, sale);
//    //3号窗口
//    dispatch_async(q, sale);
//    //4号窗口
//    dispatch_async(q, sale);
    
    //通过创建队列－－－并行 异步形式必须进行加锁处理
    dispatch_queue_t q=dispatch_queue_create("zkz", DISPATCH_QUEUE_CONCURRENT);
    //1号窗口
    dispatch_async(q, sale);
    //2号窗口
    dispatch_async(q, sale);
    //3号窗口
    dispatch_async(q, sale);
    //4号窗口
    dispatch_async(q, sale);
    //5号窗口
    dispatch_async(q, sale);
    }
@end

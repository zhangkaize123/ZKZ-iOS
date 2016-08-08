//
//  ViewController.m
//  01——块
//
//  Created by 张凯泽 on 15-3-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)okTap:(UIButton *)sender;
- (IBAction)okTap2;
@property (weak, nonatomic) IBOutlet UILabel *lablesend;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)okTap2 {
    //不是通过GCD 来改变其他线程里的数据
    [self performSelectorInBackground:@selector(aaa:) withObject:nil];
    
}

-(void)aaa:(id)obj
{
    self.lablesend.text=@"567";
}





- (IBAction)okTap:(UIButton *)sender {
    /*
     线程组是 dispatch_group_notify会等待前边的任务完成之后在执行这个dispatch_group_notify
     
     */
//    dispatch_group_t group = dispatch_group_create();//线程组
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        
//        
//        [NSThread sleepForTimeInterval:8];
//        NSLog(@" first %@",[NSThread currentThread]);
//    });//往线程组里边放入一个线程
//    
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
//        
//        [NSThread sleepForTimeInterval:5];
//        NSLog(@" secend %@",[NSThread currentThread]);
//    });//往线程组再里边放入一个线程
//    
//    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
//        NSLog(@" end %@",[NSThread currentThread]);
//    });//等待线程 等待线程组里边其他线程完成它在执行

    
    
    
    /*
     2016-07-25 10:20:37.301 01——块[74356:2008329] async = <NSThread: 0x78e57440>{number = 2, name = (null)}
     2016-07-25 10:20:45.303 01——块[74356:2008113]  first <NSThread: 0x78e374b0>{number = 1, name = main}
     2016-07-25 10:20:50.304 01——块[74356:2008113]  secend <NSThread: 0x78e374b0>{number = 1, name = main}
     2016-07-25 10:20:50.305 01——块[74356:2008113]  end <NSThread: 0x78e374b0>{number = 1, name = main}

     */
    /*
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"async = %@",[NSThread currentThread]);
        dispatch_group_t group = dispatch_group_create();//线程组
        
        dispatch_group_async(group, dispatch_get_main_queue(), ^{
            
            
            [NSThread sleepForTimeInterval:8];
            NSLog(@" first %@",[NSThread currentThread]);
        });//往线程组里边放入一个线程
        
        dispatch_group_async(group, dispatch_get_main_queue(), ^{
            
            [NSThread sleepForTimeInterval:5];
            NSLog(@" secend %@",[NSThread currentThread]);
        });//往线程组再里边放入一个线程
        
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            NSLog(@" end %@",[NSThread currentThread]);
        });//等待线程 等待线程组里边其他线程完成它在执行
        
        
    });
    */
/*
 2016-07-25 10:26:20.491 01——块[74684:2012783] async = <NSThread: 0x7ba5b210>{number = 2, name = (null)}
 2016-07-25 10:26:25.494 01——块[74684:2012751]  secend <NSThread: 0x7b868200>{number = 3, name = (null)}
 2016-07-25 10:26:28.492 01——块[74684:2012783]  first <NSThread: 0x7ba5b210>{number = 2, name = (null)}
 2016-07-25 10:26:28.493 01——块[74684:2012783]  end <NSThread: 0x7ba5b210>{number = 2, name = (null)}
 */
    //使用GCD创建线程————————————————
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:10.0];
        NSLog(@"async = %@",[NSThread currentThread]);
        dispatch_group_t group = dispatch_group_create();//线程组
        
        dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
            
            
            [NSThread sleepForTimeInterval:8];
            NSLog(@" first %@",[NSThread currentThread]);
        });//往线程组里边放入一个线程
        
        dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:5];
            NSLog(@" secend %@",[NSThread currentThread]);
        });//往线程组再里边放入一个线程
        
        dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
            NSLog(@" end %@",[NSThread currentThread]);
        });//等待线程 等待线程组里边其他线程完成它在执行
        
        
    });
    
    
}



-(void)run
{
    self.lablesend.text=@"1234";
    
}
@end

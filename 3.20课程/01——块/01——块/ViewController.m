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
@property (weak, nonatomic) IBOutlet UILabel *lablesend;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"main");
    //[self performSelectorInBackground:@selector(aaa:) withObject:nil];
}

-(void)aaa:(id)obj
{
    
}

- (IBAction)okTap:(UIButton *)sender {
    //使用GCD创建线程————————————————
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //NSLog(@"this is thread");
        //方法1:通过块 来改变主线程里的值
        
        dispatch_async(dispatch_get_main_queue(), ^{
        //self.lablesend.text=@"1234";
            
        });
        
        //方法2:
        //[self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES];
    });
    
    
}


-(void)run
{
    self.lablesend.text=@"1234";
}
@end

//
//  ViewController.m
//  录音机练习
//
//  Created by 张凯泽 on 15-4-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filepath=NSTemporaryDirectory();
    filepath = [filepath stringByAppendingPathComponent:@"rco.caf"];
    NSLog(@"%@",filepath);
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    
}



@end

//
//  ViewController.m
//  动画原理
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainView *mainview=[[MainView alloc]init];
    self.view=mainview;

    self.view.backgroundColor=[UIColor whiteColor];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timetap) userInfo:nil repeats:YES];
}
-(void)timetap
{
    [self.view setNeedsDisplay];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end

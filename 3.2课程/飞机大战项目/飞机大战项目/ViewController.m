//
//  ViewController.m
//  飞机大战项目
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainView *mainview=[[MainView alloc]init];
    self.view=mainview;
    self.view.backgroundColor=[UIColor whiteColor];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTap) userInfo:nil repeats:YES];
}

/**定时器方法实现
 */
-(void)timerTap
{
    [self.view setNeedsDisplay];
    
}


//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
@end

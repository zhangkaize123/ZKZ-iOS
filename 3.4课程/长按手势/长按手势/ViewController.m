//
//  ViewController.m
//  长按手势
//
//  Created by 张凯泽 on 15-3-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   UILongPressGestureRecognizer *lpgr=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongpress:)];
        lpgr.minimumPressDuration=1;
    [self.view addGestureRecognizer:lpgr];
}

-(void)onLongpress:(UILongPressGestureRecognizer *)recognizer
{
    if (recognizer.state==UIGestureRecognizerStateBegan) {
        NSLog(@"this is begin");
    }
    if (recognizer.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"UIGestureRecognizerStateCancelled");
    }
    if (recognizer.state==UIGestureRecognizerStateEnded) {
        NSLog(@"this is ended");
    }
}
@end

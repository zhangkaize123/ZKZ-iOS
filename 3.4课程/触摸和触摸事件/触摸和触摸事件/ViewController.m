//
//  ViewController.m
//  触摸和触摸事件
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
    
}
//触摸开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //1.NSSet *)touches-----> 代表有几个手指
    //NSLog(@"%d",(int)touches.count);
    //2.要注意设置storyboard 上的勾选multiple touch这一项。
//    NSLog(@"this is began");
//    //3.获得此时的触摸点坐标.
   CGPoint point=[[touches anyObject]locationInView:self.view];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
//    //4.轻击了几次
//    UITouch *touch=[touches anyObject];
//    int tap=touch.tapCount;
    
    
}
//触摸取消－－－－例如来短信，电话
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"this is cancell");
}
//触摸移动 －－－－在移动
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"this is move");
}
//触摸结束－－－－手指离开
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"this is end");
}
@end

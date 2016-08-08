//
//  MainView.m
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"

@implementation MainView
/*
 线
 方框
 实心方框
 椭圆
 实心椭圆
 文字
 图片
 */


//绘制事件
- (void)drawRect:(CGRect)rect {
    //获得设备上下文  得到一个画布  画刷   画笔
    CGContextRef context=UIGraphicsGetCurrentContext();
    //画一条线
    //画笔的颜色
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor]CGColor]);
    //移动画笔到起点
//    CGContextMoveToPoint(context, 20, 20);
//    //到终点画一条线
//    CGContextAddLineToPoint(context, 100, 20);
    //绘制一个圆
    
    CGContextStrokeEllipseInRect(context, CGRectMake(100, 100, 100, 100));
    //绘制一个实心圆
    CGContextFillEllipseInRect(context, CGRectMake(200, 200, 50, 50));
    //绘制一个矩形
    CGContextStrokeRect(context, CGRectMake(100, 100, 100, 100));
    //绘制一个实心矩形
    CGContextFillRect(context, CGRectMake(150, 100, 30, 30));
    //绘制文字
    NSString *str=@"你好";
    [str drawAtPoint:CGPointMake(20, 20) withAttributes:nil];
    //绘制图片
    UIImage *image=[UIImage imageNamed:@"2"];
    [image drawInRect:CGRectMake(50, 250, 50, 50)];
    //着色
    CGContextStrokePath(context);
    //
    
    
    
}


@end

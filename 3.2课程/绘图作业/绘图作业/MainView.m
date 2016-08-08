//
//  MainView.m
//  绘图作业
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"

@implementation MainView



- (void)drawRect:(CGRect)rect {
    //获得上下文
    CGContextRef  context=UIGraphicsGetCurrentContext();
    //CGContextSetRGBStrokeColor(context, <#CGFloat red#>, <#CGFloat green#>, <#CGFloat blue#>, <#CGFloat alpha#>)
    //画笔的颜色
    CGContextSetRGBStrokeColor(context, arc4random()%255/254, arc4random()%255/254, arc4random()%255/254, 1);
   
    
    CGFloat h=self.frame.size.width/6;
    CGFloat v=self.frame.size.height/11;
    
    //水平方向
    for (int i=0; i<5; i++)
    {
        //画笔的起点
        CGContextMoveToPoint(context, h+i*h, 0);
        //画笔的终点
        CGContextAddLineToPoint(context, h+i*h, self.frame.size.height);
    }
    //垂直方向
    for (int i=0; i<10; i++)
    {
        //画笔的起点
        CGContextMoveToPoint(context, 0, v+i*v);
        //画笔的终点
        CGContextAddLineToPoint(context, self.frame.size.width, v+i*v);
        
    }

    
    
    CGContextStrokePath(context);
}


@end

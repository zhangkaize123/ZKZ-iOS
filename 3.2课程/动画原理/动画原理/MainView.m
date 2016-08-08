//
//  MainView.m
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"

@implementation MainView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        point.x=50;
        point.y=50;
    }
    return self;
}
//绘制事件
- (void)drawRect:(CGRect)rect {
    
    point.x+=5;
    point.y+=5;
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextFillEllipseInRect(context, CGRectMake(point.x, point.y, 50 , 50));
    
}


@end

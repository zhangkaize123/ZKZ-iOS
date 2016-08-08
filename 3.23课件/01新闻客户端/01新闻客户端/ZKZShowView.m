//
//  ZKZShowView.m
//  01新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZShowView.h"
#define W [UIScreen mainScreen].bounds.size.width
@implementation ZKZShowView
//初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height)];
        
        
    }
    return self;
}

+(instancetype)loadView
{
    
    
    //得道屏幕的高度
    //CGFloat height=[UIScreen mainScreen].bounds.size.height;
    ZKZShowView*showView=[[ZKZShowView alloc]initWithFrame:CGRectMake(0, 64, W, 130)];
    showView.backgroundColor=[UIColor greenColor];
    return showView;
}


@end

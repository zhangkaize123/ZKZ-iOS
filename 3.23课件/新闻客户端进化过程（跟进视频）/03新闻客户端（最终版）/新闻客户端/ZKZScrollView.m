//
//  ZKZScrollView.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZScrollView.h"

@implementation ZKZScrollView
-(ZKZScrollView *)init
{
    self=[super init];
    if (self) {
        buttons=[NSMutableArray array];
        self.backgroundColor=[UIColor whiteColor];
        self.scrollEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        
    }
    return self;
}
//往滚动视图上放按钮
-(void)addBtton:(UIButton *)button
{
    //滚动宽度
    NSInteger width=10;
    //得到最后按钮的
    UIButton *lastButton=[buttons lastObject];
    //计算宽度
    if (lastButton) {
        width+=lastButton.frame.origin.x+lastButton.frame.size.width;
    }else{
        width=0;
    }
    
    CGRect frame=button.frame;
    //设定x
    frame.origin.x=width;
    frame.origin.y=2;
    button.frame=frame;
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:button];
    [buttons addObject:button];
    //调节滚动范围
    if (width>self.frame.size.width) {
        self.contentSize=CGSizeMake(width+button.frame.size.width+5, 44);
    }
    
}
-(void)clearColor;
{
    for (UIButton *btn in buttons) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor clearColor];
    }
}
@end

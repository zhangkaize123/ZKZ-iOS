//
//  HScrollView.m
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-22.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import "HScrollView.h"

@implementation HScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(HScrollView *)init
{
    self = [super init];
    if (self) {
        //实例化集合
        buttons=[[NSMutableArray alloc]initWithCapacity:10];
        //背景颜色
        self.backgroundColor=[UIColor whiteColor];
        //允许滚动
        self.scrollEnabled=YES;
        //取消滚动指示器
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
    }
    return self;
}
//往滚动视图上放按钮
-(void)addButton:(UIButton *)button
{
    //滚动宽度
    NSInteger width=20;//5指的是按钮之间的距离
    //得到最后那个按钮
    UIButton * lastButton=[buttons lastObject];
    //计算宽度
    if(lastButton)
    {
        width+=lastButton.frame.origin.x+lastButton.frame.size.width;
    }
    else
    {
        width=0;
    }
    //得到要放到滚动试图上按钮的frame
    CGRect frame=button.frame;
    //设定按钮离滚动视图左边距离
    frame.origin.x=width;
    //设定按钮离滚动视图上边距离
    frame.origin.y=2;
    button.frame=frame;
    button.titleLabel.font=[UIFont systemFontOfSize:20];
    //把按钮放到滚动试图上
    [self addSubview:button];
    //在集合中保存这个按钮
    [buttons addObject:button];
    //NSLog(@"%@",NSStringFromCGRect(self.frame));
    //NSLog(@"%d",width);
    //调节滚动范围
    if(width>self.frame.size.width)
    {
        self.contentSize=CGSizeMake(width+button.frame.size.width+5, 44);
        //NSLog(@"%@",NSStringFromCGSize(self.contentSize));
    }
}
-(void)clearColor
{
    for(UIButton * btn in buttons)
    {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //btn.backgroundColor=[UIColor clearColor];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  ZKZTextFiled.m
//  文本框
//
//  Created by 张凯泽 on 15-6-15.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTextFiled.h"

@implementation ZKZTextFiled

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        UILongPressGestureRecognizer *lpgr=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongpress:)];
//        //[self addGestureRecognizer:lpgr];
//        [self removeGestureRecognizer:lpgr];
    }
    //[self canPerformAction:nil withSender:nil];
    //长按手势
    
    return self;
}
-(void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@",gestureRecognizer);
       if ([gestureRecognizer isMemberOfClass:[UILongPressGestureRecognizer class]]) {
        //gestureRecognizer.enabled=NO;
        NSLog(@"zkzz");
          // NSLog(@"%@",gestureRecognizer);
    }
    if ([gestureRecognizer isMemberOfClass:[UITapGestureRecognizer class]]) {
        //gestureRecognizer.enabled=YES;
    }
   
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender

{
    
    if ([UIMenuController sharedMenuController]) {
        
        [UIMenuController sharedMenuController].menuVisible = NO;
        
    }
    
    return NO;
    
}
@end

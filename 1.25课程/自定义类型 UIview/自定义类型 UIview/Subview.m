//
//  Subview.m
//  自定义类型 UIview
//
//  Created by 张凯泽 on 15-1-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "Subview.h"

@implementation Subview
@synthesize otherview;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    //可以增加data,
        otherview=[[UIView alloc]initWithFrame:CGRectMake(30, 30, 30, 30)];
        otherview.backgroundColor=[UIColor greenColor];
        [self addSubview:otherview];
        
        
    }
    return self;
}
-(void)say
{
    NSLog(@"afanivhneri");
}

- (void)dealloc
{
    otherview=nil;//在这里释放内存；
    NSLog(@"Subview is dealloc");
    [super dealloc];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

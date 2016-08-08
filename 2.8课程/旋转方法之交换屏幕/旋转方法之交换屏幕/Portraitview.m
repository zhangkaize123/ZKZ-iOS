//
//  Portraitview.m
//  旋转方法之交换屏幕
//
//  Created by 张凯泽 on 15-2-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "Portraitview.h"

@implementation Portraitview
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.frame=[UIScreen mainScreen].bounds;
        self.backgroundColor=[UIColor greenColor];
    }
    return self;
}
@end

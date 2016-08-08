//
//  ZHQSprite.m
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZHQSprite.h"

@implementation ZHQSprite
-(void)moveWithDirection:(BOOL)_direction
{
    int y;
    if(_direction)//向下
    {
        y=self.position.y+5;
    }
    else//向上
    {
        y=self.position.y-5;
    }
    self.position=CGPointMake(self.position.x,y);
}
-(BOOL)invalidWithDirection:(BOOL)_direction andWithValue:(int)_value
{
    if(_direction)//向下
    {
        if(self.position.y>_value)//精灵已经超出范围
        {
            return YES;//无效
        }
    }
    else//向上
    {
        if(self.position.y<-30)//精灵已经超出范围
        {
            return YES;//无效
        }
    }
    return NO;//有效
}
@end

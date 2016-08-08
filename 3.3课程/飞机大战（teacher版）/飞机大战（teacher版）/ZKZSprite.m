//
//  ZKZSprite.m
//  飞机大战（teacher版）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZSprite.h"

@implementation ZKZSprite
-(void)moveWithDirection:(BOOL)direction
{
    CGPoint point=self.spritePoint;
    if (direction) {//向下
        point.y+=5;
    }
    else{//向上
        point.y-=5;
    }
    self.spritePoint=point;
}
-(BOOL)invalidWithDirction:(BOOL)direction andWithValue:(int)value
{
    if (direction) {//向下
        if (self.spritePoint.y>value) {
            return YES;
        }
    }
    else{//向上
        if (self.spritePoint.y<value) {
            return YES;
        }
    }
    return NO;

}
@end

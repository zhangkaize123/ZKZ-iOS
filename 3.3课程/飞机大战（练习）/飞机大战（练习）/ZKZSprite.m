//
//  ZKZSprite.m
//  飞机大战（练习）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZSprite.h"

@implementation ZKZSprite
-(void)moveWithDirection:(BOOL)dic
{
    CGPoint move=self.spritePoint;
    if (dic==YES) {//向下
        
        move.y+=5;
        
    }else{//向下
        move.y-=5;
    }
    self.spritePoint=move;
}
@end

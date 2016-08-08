//
//  MainView.m
//  飞机大战（练习）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"
#import "ZKZSprite.h"
@implementation MainView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.enemys=[NSMutableArray arrayWithCapacity:30];//初始化敌人数组
        //初始化敌人画面
        enemyImage=[UIImage imageNamed:@"dr"];
        //初始化英雄画面
        //初始化子弹画面
        //初始化爆炸画面
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    //绘画敌人
    for (ZKZSprite *enemy  in self.enemys) {
        //绘画敌人飞机
        [enemyImage drawAtPoint:enemy.spritePoint];
        [enemy moveWithDirection:YES];
        if (enemy.spritePoint.y>self.frame.size.height) {
            enemy.isUsed=YES;
        }
    }
    
    //NSLog(@"%d",self.enemys.count);

    
    
    
    }


@end

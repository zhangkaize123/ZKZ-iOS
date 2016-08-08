//
//  MainView.m
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"

@implementation MainView
//进行初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self) {
        self.enemys=[NSMutableArray array];//初始化敌人数组
        self.bullets=[NSMutableArray array];//初始化敌人数组
        //初始化敌人图片
        enemyImage=[UIImage imageNamed:@"dr"];
        //初始化英雄图片
        heroImage=[UIImage imageNamed:@"nc"];
        //初始化子弹图片
        bulletImage=[UIImage imageNamed:@"zd"];
        //初始化爆炸图片
        blowImage=[UIImage imageNamed:@"bz"];
        //初始化英雄对象
        self.herosprite=[[ZKZSprite alloc]init];
        CGFloat heroX=[UIScreen mainScreen].bounds.size.width*0.5-31;
        CGFloat heroY=[UIScreen mainScreen].bounds.size.height-74;
        self.herosprite.heroPoint=CGPointMake(heroX, heroY);
        //
        
    }
    return self;
}
/**绘画*/
/*
 循环使用书组里边值
 */
- (void)drawRect:(CGRect)rect {
    NSMutableArray *temp=[NSMutableArray array];
        //绘制敌人
    for (ZKZSprite *sprite in self.enemys) {
        
        if (sprite.isUsed) {
            //显示
            [enemyImage drawAtPoint:sprite.spritePoint];
        }
        //移动方向
        [sprite moveWithDirection:YES];
        if ([sprite invalidWithDirction:YES andWithValue:self.frame.size.height]||sprite.isUsed==NO) {
            [temp addObject:sprite];
        }
    }
    [self.enemys removeObjectsInArray:temp];
    [temp removeAllObjects];
    //绘制子弹
    for (ZKZSprite *bullet in self.bullets) {
        if (bullet.isUsed) {
            //显示
            [bulletImage drawAtPoint:bullet.spritePoint];
        }
        //移动
        [bullet moveWithDirection:NO];
        if ([bullet invalidWithDirction:NO andWithValue:0]||bullet.isUsed==NO) {
            [temp addObject:bullet];
        }
        
    }
    [self.bullets removeObjectsInArray:temp];
   // NSLog(@"%d",self.bullets.count);

    //绘制英雄飞机
    [heroImage drawAtPoint:_herosprite.heroPoint];
   //绘制爆炸－－－－－》碰撞交互
    for (ZKZSprite *enemy in self.enemys) {
        for (ZKZSprite *bullet in self.bullets) {
           
            //判断两个图形有没有交互
            //CGRectIntersectsRect(<#CGRect rect1#>, <#CGRect rect2#>)
            CGRect enemyrect=CGRectMake(enemy.spritePoint.x, enemy.spritePoint.y, 39, 34);
            CGRect bulletrect=CGRectMake(bullet.spritePoint.x, bullet.spritePoint.y, 16, 16);
            if (CGRectIntersectsRect(enemyrect, bulletrect)) {
                [blowImage drawAtPoint:enemy.spritePoint];
                bullet.isUsed=NO;
                enemy.isUsed=NO;
            }
        }
    }
    
    
    
}


@end

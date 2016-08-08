//
//  MainView.m
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"

@implementation MainView
{
    int number;
    int bulletnum;
    CGPoint bulletpoint;
        CGPoint enemypoint;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    number=10;
    bulletnum=10;
    self=[super initWithFrame:frame];
    if (self) {
        self.array=[NSMutableArray array];
        for (int i=0; i<number; i++) {
            ZKZinfo *info=[[ZKZinfo alloc]init];
            info.X=arc4random()%320;
            info.Y=arc4random()%200;
            [self.array addObject:info];
        }
        //英雄飞机
        heroinfo=[[ZKZHeroinfo alloc]init];
        heroinfo.X=(320-62)/2;
        heroinfo.Y=480-80;
        //子弹
        self.bulletarray=[NSMutableArray array];
        for (int i=0; i<bulletnum; i++) {
            ZKZbulletinfo *bulletinfo=[[ZKZbulletinfo alloc]init];
            
            bulletinfo.X=heroinfo.X+25;
            bulletinfo.Y=heroinfo.Y-i*50-10;
            [self.bulletarray addObject:bulletinfo];
        }
    }
    return self;
}
/**触摸事件*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint temp=[touch locationInView:self];
    NSLog(@"X=%g,Y=%g",temp.x,temp.y);
    //英雄飞机
    heroinfo.X=temp.x;
    heroinfo.Y=temp.y;
    //子弹
    for (int i=0;i<self.bulletarray.count;i++) {
        ZKZbulletinfo *bulletinfo=[self.bulletarray objectAtIndex:i];
        bulletinfo.X=heroinfo.X+25;
        bulletinfo.Y=heroinfo.Y-50*i-10;
    }
    
}

- (void)drawRect:(CGRect)rect {
    
    
    //敌人飞机
    UIImage *enemyimage=[UIImage imageNamed:@"dr"];
    
        for (int i=0; i<number; i++) {
        ZKZinfo *info=[self.array objectAtIndex:i];
        CGPoint p=CGPointMake(info.X, info.Y);
        [enemyimage drawAtPoint:p];
    }
    for (ZKZinfo *info in self.array ) {
        
        info.Y+=5;
        enemypoint=CGPointMake(info.X, info.Y);

        if (info.Y>=self.frame.size.height) {
            info.X=arc4random()%320;
            info.Y=arc4random()%400;
        }
    }
    //创建英雄飞机
    UIImage *heroimage=[UIImage imageNamed:@"nc"];
    [heroimage drawAtPoint:CGPointMake(heroinfo.X, heroinfo.Y)];
    //创建子弹
    UIImage *bulletimage=[UIImage imageNamed:@"zd"];
    for (ZKZbulletinfo *bulletinfo in self.bulletarray) {
        [bulletimage drawAtPoint:CGPointMake(bulletinfo.X, bulletinfo.Y)];
    }
    for (ZKZbulletinfo *bulletinfo in self.bulletarray) {
        bulletinfo.Y-=5;
        if (bulletinfo.X<=enemypoint.x+50&&bulletinfo.X>=enemypoint.x) {
            UIImage *blowimage=[UIImage imageNamed:@"bz"];
            [blowimage drawAtPoint:enemypoint];
        }
    }
        
}


@end

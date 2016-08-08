//
//  MainView.m
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainView.h"
#import "ZHQSprite.h"
@implementation MainView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    //初始化敌人数组
    self.direns=[[NSMutableArray alloc]init];
    //初始化子弹数组
    self.zidans=[[NSMutableArray alloc]init];
    //敌人的图片
    drImg=[UIImage imageNamed:@"dr.png"];
    //英雄的图片
    ncImg=[UIImage imageNamed:@"nc.png"];
    //子弹的图片
    zdImg=[UIImage imageNamed:@"zd.png"];
    //爆炸的图片
    bzImg=[UIImage imageNamed:@"bz.png"];
    CGRect rect=[UIScreen mainScreen].bounds;
    self.ncPosition=CGPointMake(rect.size.width/2-31
                                  , rect.size.height-74);
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //要删除的敌人
    NSMutableArray * deletes=[[NSMutableArray alloc]init];
    //绘制敌人
    for(ZHQSprite * s in self.direns)
    {
        //显示出来
        if(s.isUsed)
        {
            [drImg drawAtPoint:s.position];
        }
        //移动
        [s moveWithDirection:YES];
        if([s invalidWithDirection:YES andWithValue:self.frame.size.height] || s.isUsed==NO)
        {
            [deletes addObject:s];
        }
    }
    [self.direns removeObjectsInArray:deletes];
    [deletes removeAllObjects];
    //绘制子弹
    for(ZHQSprite * s in self.zidans)
    {
        //显示出来
        if(s.isUsed)
        {
            [zdImg drawAtPoint:s.position];
        }
        //移动
        [s moveWithDirection:NO];
        if(s.isUsed==NO || [s invalidWithDirection:NO andWithValue:0])
        {
            [deletes addObject:s];
        }
    }
    //删除无用子弹
    [self.zidans removeObjectsInArray:deletes];
    //绘制英雄
    [ncImg drawAtPoint:self.ncPosition];
    //碰撞检测
    for(ZHQSprite * dr in self.direns)
    {
        for(ZHQSprite * zd in self.zidans)
        {
            CGRect drRect=CGRectMake(dr.position.x, dr.position.y, 39, 34);
            CGRect zdRect=CGRectMake(zd.position.x, zd.position.y, 16, 16);
            if(CGRectIntersectsRect(drRect, zdRect))
            {
                [bzImg drawAtPoint:dr.position];
                dr.isUsed=NO;
                zd.isUsed=NO;
            }
        }
    }
    NSLog(@"direns=%d,zidans=%d",(int)self.direns.count,(int)self.zidans.count);
}

@end

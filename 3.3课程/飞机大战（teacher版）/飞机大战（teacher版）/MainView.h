//
//  MainView.h
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZSprite.h"
@interface MainView : UIView
{
    UIImage *enemyImage;//敌人图片
    UIImage *bulletImage;//子弹图片
    UIImage *heroImage;//英雄图片
    UIImage *blowImage;//英雄图片
    
}
@property(nonatomic ,strong)NSMutableArray *enemys;//敌人数组
@property(nonatomic ,strong)NSMutableArray *bullets;//子弹数组
@property(nonatomic ,strong)ZKZSprite *herosprite;//英雄精灵
@end

//
//  MainView.h
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView
{
    UIImage * drImg;//敌人
    UIImage * ncImg;//英雄
    UIImage * zdImg;//子弹
    UIImage * bzImg;//爆炸
}
@property (strong,nonatomic) NSMutableArray * direns;//敌人
@property (strong,nonatomic) NSMutableArray * zidans;//子弹
@property (assign,nonatomic) CGPoint ncPosition;
@end

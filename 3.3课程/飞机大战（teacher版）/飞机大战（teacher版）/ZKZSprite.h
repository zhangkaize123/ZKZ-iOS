//
//  ZKZSprite.h
//  飞机大战（teacher版）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZKZSprite : NSObject
@property(nonatomic,assign)CGPoint spritePoint;//精灵坐标
@property(nonatomic,assign)CGPoint heroPoint;//英雄飞机

@property(nonatomic,assign)BOOL isUsed;//精灵是否有效
//精灵的移动yes---->向下运动   no____向上
-(void)moveWithDirection:(BOOL)direction;
//判断精灵是否消失
-(BOOL)invalidWithDirction:(BOOL)direction andWithValue:(int)value;
@end

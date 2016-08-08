//
//  ZHQSprite.h
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//精灵类
@interface ZHQSprite : NSObject
@property (assign,nonatomic) CGPoint position;//精灵的位置
@property (assign,nonatomic) BOOL isUsed;//精灵是否有效
-(void)moveWithDirection:(BOOL)_direction;//精灵的移动（有方向的）yes 向下 no 向上
-(BOOL)invalidWithDirection:(BOOL)_direction andWithValue:(int)_value;//消失
@end

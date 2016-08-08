//
//  ZKZSprite.h
//  飞机大战（练习）
//
//  Created by 张凯泽 on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZKZSprite : NSObject
//精灵的位置。
@property(nonatomic,assign)CGPoint spritePoint;
@property(nonatomic,assign)BOOL isUsed;//是否以过期
//精灵移动方法
-(void)moveWithDirection:(BOOL)dic;
@end

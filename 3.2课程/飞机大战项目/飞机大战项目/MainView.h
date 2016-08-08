//
//  MainView.h
//  绘图
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZinfo.h"
#import "ZKZHeroinfo.h"
#import "ZKZbulletinfo.h"
@interface MainView : UIView
{
    ZKZHeroinfo *heroinfo;
    
}
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *bulletarray;
//@property(nonatomic,strong)
@end

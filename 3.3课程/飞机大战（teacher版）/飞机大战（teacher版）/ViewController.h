//
//  ViewController.h
//  飞机大战项目
//
//  Created by 张凯泽 on 15-3-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "ZKZSprite.h"
@interface ViewController : UIViewController
{
    MainView *mainView;
    BOOL isCover;
    CGPoint prePoint;
}

@end


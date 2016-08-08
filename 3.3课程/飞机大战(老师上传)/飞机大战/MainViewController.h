//
//  MainViewController.h
//  飞机大战
//
//  Created by wyzc on 15-3-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
@interface MainViewController : UIViewController
{
    MainView * mainView;
    BOOL isOver;
    CGPoint prePoint;
}
@end

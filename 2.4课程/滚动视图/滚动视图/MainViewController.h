//
//  MainViewController.h
//  滚动视图
//
//  Created by 张凯泽 on 15-2-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    UIPageControl *page;
    UIScrollView *scorllview;
    int count;
    NSTimer*timer1;
}
@end

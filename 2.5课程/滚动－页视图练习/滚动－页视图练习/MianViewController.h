//
//  MianViewController.h
//  滚动－页视图练习
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MianViewController : UIViewController<UIScrollViewDelegate>
{
    UIPageControl *pagecontrol;
    UIScrollView *scrollview;
}
@end

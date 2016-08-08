//
//  HScrollView.h
//  我赢新闻
//
//  Created by 我赢职场 on 14-9-22.
//  Copyright (c) 2014年 我赢职场. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HScrollView : UIScrollView
{
    //按钮集合
    NSMutableArray * buttons;
}
-(HScrollView *)init;
-(void)addButton:(UIButton *)button;
-(void)clearColor;//清除背景色
@end

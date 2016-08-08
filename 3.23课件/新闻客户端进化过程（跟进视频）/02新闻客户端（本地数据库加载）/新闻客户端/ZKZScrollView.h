//
//  ZKZScrollView.h
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKZScrollView : UIScrollView
{
    NSMutableArray *buttons;
}
-(ZKZScrollView *)init;
-(void)addBtton:(UIButton *)button;
-(void)clearColor;
@end

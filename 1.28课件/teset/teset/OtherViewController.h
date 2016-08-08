//
//  OtherViewController.h
//  teset
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MainViewController.h"

//使用代理的方式进行传值。
@protocol passValue

-(void)setString:(NSString *)string;

@end




@interface OtherViewController : UIViewController
{
    UITextField *text;
}
@property(strong,nonatomic)NSString *str;
@property(strong,nonatomic)id<passValue>delegate;
//@property(strong,nonatomic)MainViewController *main;
@end

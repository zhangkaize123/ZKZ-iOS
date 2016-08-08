//
//  FatherViewViewController.h
//  节后复习题（代码版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZKZOneview <NSObject>
-(void)oneValue:(NSString *)str;
@end
@interface FatherViewViewController : UIViewController
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UITextField *text;
@property(nonatomic,strong)id<ZKZOneview>delegate;
@end

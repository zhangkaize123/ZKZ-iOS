//
//  FirstViewController.h
//  节后复习题（storyboard版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZKZFirstviewdelegate <NSObject>
-(void)firstValue:(NSString *)sendrstr;
@end
@interface FirstViewController : UIViewController
@property(nonatomic,copy)NSString *str;
@property(nonatomic,strong)id<ZKZFirstviewdelegate>delegate;
@end

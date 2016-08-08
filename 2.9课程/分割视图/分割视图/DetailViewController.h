//
//  DetailViewController.h
//  分割视图
//
//  Created by wyzc on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    UILabel * nameLabel;
}
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * language;
@property (strong,nonatomic) UIPopoverController * popVC;
@end

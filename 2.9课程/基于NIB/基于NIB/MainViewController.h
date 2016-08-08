//
//  MainViewController.h
//  基于NIB
//
//  Created by 张凯泽 on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
//类中的属性。
@property (weak, nonatomic) IBOutlet UILabel *messagelable;
//action代表是一个事件
- (IBAction)okTage:(id)sender;
- (IBAction)valueChange:(id)sender;


@end

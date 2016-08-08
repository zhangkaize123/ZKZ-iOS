//
//  MainViewController.h
//  NIB控件2
//
//  Created by 张凯泽 on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *numbertap;
- (IBAction)okTap:(UIButton *)sender;
- (IBAction)valuechageTap:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *valuechangShow;
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
@property (weak, nonatomic) IBOutlet UISwitch *sw2;
- (IBAction)stateChange:(UISwitch *)sender;
//启动与停止
- (IBAction)startTap:(UIButton *)sender;
- (IBAction)stopTap:(UIButton *)sender;
//属性
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *stop;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actionShow;
@property (weak, nonatomic) IBOutlet UIProgressView *progressShow;

@end

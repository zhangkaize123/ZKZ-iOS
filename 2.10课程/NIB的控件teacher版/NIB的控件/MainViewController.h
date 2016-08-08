//
//  MainViewController.h
//  NIB的控件
//
//  Created by wyzc on 15-2-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    BOOL isRunning;
}
- (IBAction)okTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
- (IBAction)fontSlider:(UISlider *)sender;
- (IBAction)onChanged:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
@property (weak, nonatomic) IBOutlet UISwitch *sw2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *runCtrl;
@property (weak, nonatomic) IBOutlet UIProgressView *walkCtrl;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)startTap:(UIButton *)sender;
- (IBAction)stopTap:(UIButton *)sender;

@end

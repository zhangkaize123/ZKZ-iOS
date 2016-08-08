//
//  ViewController.h
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *unameText;
@property (weak, nonatomic) IBOutlet UITextField *upassText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)login:(UIButton *)sender;

@end


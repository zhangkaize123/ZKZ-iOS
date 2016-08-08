//
//  MainViewController.h
//  即时通讯框架
//
//  Created by wyzc on 15-4-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextView *msgText;
@property (weak, nonatomic) IBOutlet UITextField *unameText;
@property (weak, nonatomic) IBOutlet UITextField *messageText;
- (IBAction)send:(UIButton *)sender;
- (IBAction)close:(UIButton *)sender;
@property(nonatomic,copy)NSString *bageNumber;

@end

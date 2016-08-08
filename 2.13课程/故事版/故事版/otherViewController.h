//
//  otherViewController.h
//  故事版
//
//  Created by 张凯泽 on 15-2-13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface otherViewController : UIViewController
- (IBAction)close:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *showtextfiled;

@property(strong,nonatomic)NSString *senderstring;
@property(strong,nonatomic)ViewController *v;
@end

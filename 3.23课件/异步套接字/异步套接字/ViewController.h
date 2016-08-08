//
//  ViewController.h
//  异步套接字
//
//  Created by wyzc on 15-3-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
@interface ViewController : UIViewController<AsyncSocketDelegate>

- (IBAction)connBtn:(UIButton *)sender;
- (IBAction)sendBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *sendText;
@property (weak, nonatomic) IBOutlet UITextView *revText;
- (IBAction)closeBtn:(UIButton *)sender;
@property (strong, nonatomic) AsyncSocket * socket;
@property (weak, nonatomic) IBOutlet UIButton *conn;
@property (weak, nonatomic) IBOutlet UIButton *close;

@end


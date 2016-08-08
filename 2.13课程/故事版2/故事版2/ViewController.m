//
//  ViewController.m
//  故事版2
//
//  Created by 张凯泽 on 15-2-13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)logbutton:(id)sender
{
    NSString *string=self.inputtext.text;
    /*
     ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
     1.通过主进口上的视图控制器来对每个视图连线
     而不是通过按钮连线。
     2.对每条线都要建立标识
     
     */
    //这是跳转到哪个窗口的行为
        [self performSegueWithIdentifier:string sender:nil];
   
    
    
}
@end

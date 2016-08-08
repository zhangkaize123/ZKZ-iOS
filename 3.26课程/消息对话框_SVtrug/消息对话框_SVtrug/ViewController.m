//
//  ViewController.m
//  消息对话框_SVtrug
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)showTap:(UIButton *)sender;
- (IBAction)closeTap:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)showTap:(UIButton *)sender {
    
    //[SVProgressHUD show];
    //对按钮点击不处理
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    //有渐变效果，对按钮点击不处理
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    //显示文字
   // [SVProgressHUD showWithStatus:@"数据加载中。。。" maskType:SVProgressHUDMaskTypeGradient];
    
}

- (IBAction)closeTap:(UIButton *)sender {
    [SVProgressHUD dismiss];
}
@end

//
//  MainViewController.m
//  双视图适配
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
-(void)dictchange
{/*
  双视图能适应手机转屏但是不能适应手机屏幕大小,
  */
    UIDeviceOrientation  dict=[UIDevice currentDevice].orientation;
    if (dict==1)
    {
        self.view=self.portraitdict;
    }
    else
    {
        self.view=self.landscapedict;
    }
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dictchange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

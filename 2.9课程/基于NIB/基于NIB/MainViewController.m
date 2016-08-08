//
//  MainViewController.m
//  基于NIB
//
//  Created by 张凯泽 on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
/*
 nib里边的图形是在执行loadview时加载到内存中的。－－－－－－－》可以从无限互联视频里的控制器的生命周期里。。。。。理解。。。。。》自己手机里有生命周期照片。
 
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)okTage:(id)sender
{
    
    
    
    
}

- (IBAction)valueChange:(id)sender
{
    
   }

@end

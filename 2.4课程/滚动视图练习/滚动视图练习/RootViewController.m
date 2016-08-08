//
//  RootViewController.m
//  滚动视图练习
//
//  Created by 张凯泽 on 15-2-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 100, 200, 40)];
    lable.backgroundColor=[UIColor brownColor];
    [self.view addSubview:lable];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//
//  MainViewController.m
//  UI044-模仿APP第一次启动界面
//
//  Created by Angle1ove on 2/4/15.
//  Copyright (c) 2015 Angle1ove. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width / 2 - 100, height / 2 - 40, 200, 80)];
    [label setText:@"你好，世界!"];
    [label setFont:[UIFont boldSystemFontOfSize:30]];
    [self.view addSubview:label];
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

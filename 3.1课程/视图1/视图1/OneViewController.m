//
//  OneViewController.m
//  视图1
//
//  Created by wyzc on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    //标签
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 60, 200, 40)];
    label.backgroundColor=[UIColor yellowColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=self.sendText;
    [self.view addSubview:label];
    //返回
    UIButton * backButton=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 120, 200, 40)];
    backButton.backgroundColor=[UIColor blackColor];
    [backButton setTitle:@"关闭" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}
-(void)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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

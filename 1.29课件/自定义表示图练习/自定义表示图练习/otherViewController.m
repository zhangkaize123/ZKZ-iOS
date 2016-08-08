//
//  otherViewController.m
//  自定义表示图练习
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "otherViewController.h"

@interface otherViewController ()

@end

@implementation otherViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor orangeColor];
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, 100, 40)];
    lable.backgroundColor=[UIColor blueColor];
    lable.text=self.string;
    [self.view addSubview:lable];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 100, 100, 40)];
    button.backgroundColor=[UIColor grayColor];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)dismiss:(UIButton *)sender
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

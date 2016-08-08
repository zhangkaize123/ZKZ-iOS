//
//  DetailViewController.m
//  我的标示图
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad

{
    
    self.view.backgroundColor=[UIColor orangeColor];
    
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 40, 100, 40)];
    text.backgroundColor=[UIColor blueColor];
    //main--->other
    text.text=self.string;

    [self.view addSubview:text];
    
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
    
    self.main.string=text.text;
    NSLog(@"self.main.string=%@",self.main.string);
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

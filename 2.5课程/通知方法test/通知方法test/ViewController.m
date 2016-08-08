//
//  ViewController.m
//  通知方法test
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *b=[[UIButton alloc]initWithFrame:CGRectMake(40, 40, 50, 50)];
    b.backgroundColor=[UIColor orangeColor];
    [b addTarget:self action:@selector(testtage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:b];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)testtage:(UIButton *)sender
{
    
    NSString *s1=[NSString stringWithFormat:@"%d",123];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:s1];
    TestViewController *test=[[TestViewController alloc]init];
    
    [self presentViewController:test animated:YES completion:nil];
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

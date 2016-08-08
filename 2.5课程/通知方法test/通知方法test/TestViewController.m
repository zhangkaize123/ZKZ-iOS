//
//  TestViewController.m
//  通知方法test
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:@"TEST" object:nil];
    self.view.backgroundColor=[UIColor redColor];
    UILabel *l=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 40)];
    l.backgroundColor=[UIColor orangeColor];
    
    [self.view addSubview:l];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(test:) name:@"TEST" object:nil];
//}
-(void)test:(id)obj
{
    NSString *str=(NSString *)[obj object];
    NSLog(@"str=%@",str);
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

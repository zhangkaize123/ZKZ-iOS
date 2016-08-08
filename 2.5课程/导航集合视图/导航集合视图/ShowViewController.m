//
//  ShowViewController.m
//  导航集合视图
//
//  Created by 张凯泽 on 15-2-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController
//-(void)showtage:(id)obj
//{
//    NSString *string=[obj object];
//    NSLog(@"%@",string);
//    lable.text=string;
//}
- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];

    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showtage:) name:@"SHOW" object:nil];
    lable=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 40)];
    lable.backgroundColor=[UIColor brownColor];
    //main--->other
    lable.text=self.sendstr;
    [self.view addSubview:lable];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 200, 100, 40)];
    lable1.backgroundColor=[UIColor brownColor];
    
    
    [self.view addSubview:lable1];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    //self.m.p=self.p2;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

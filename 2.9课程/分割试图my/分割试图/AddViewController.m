//
//  AddViewController.m
//  分割试图
//
//  Created by 张凯泽 on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
@interface AddViewController ()
{
    UITextField *text;
}

@end

@implementation AddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 74, 100, 40)];
    text.placeholder=@"输入姓名";
    [self.view addSubview:text];
    // Do any additional setup after loading the view.
}


-(void)viewWillDisappear:(BOOL)animated
{
    NSString *name=text.text;
    name=[name trim];
    
    if (name.length<1)
    {
        [ZHQAlert alert:@"请输入有效的姓名"];
    }
    else
    {
    //other------>main
    self.m.name=name;
    
    }
}
- (void)didReceiveMemoryWarning
{
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

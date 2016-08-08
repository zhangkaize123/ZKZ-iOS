//
//  AddViewController.m
//  分割视图
//
//  Created by wyzc on 15-2-9.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    nameText=[[UITextField alloc]initWithFrame:CGRectMake(20, 74, 100, 40)];
    nameText.placeholder=@"在这输入姓名";
    [self.view addSubview:nameText];
}
//视图将要消失
-(void)viewWillDisappear:(BOOL)animated
{
    NSString * name=nameText.text;
    name=[name trim];
    if([name isEqualToString:@""])
    {
        [ZHQAlert alert:@"由于你没有输入一个有效的姓名，所以不能保存!"];
    }
    else
    {
        self.menuVC.name=name;
    }
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

//
//  FatherViewViewController.m
//  节后复习题（代码版）
//
//  Created by 张凯泽 on 15-3-1.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "FatherViewViewController.h"

@interface FatherViewViewController ()<UITextFieldDelegate>
//{
//    UILabel * label;
//}
//@property(nonatomic,strong)UILabel * label;
@end

@implementation FatherViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //标签
      self.label=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 60, 200, 40)];
    self.label.backgroundColor=[UIColor yellowColor];
    self.label.textAlignment=NSTextAlignmentCenter;
    //label.text=self.sendText;
    [self.view addSubview:self.label];
    //返回
    UIButton * backButton=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 120, 200, 40)];
    backButton.backgroundColor=[UIColor blackColor];
    [backButton setTitle:@"关闭" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    //文本框
    self.text=[[UITextField alloc]initWithFrame:CGRectMake(110, 200, 200, 40)];
    self.text.delegate=self;
    self.text.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:self.text];
    
}

-(void)close:(UIButton *)sender
{
    [self.delegate oneValue:self.text.text];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return NO;
}
//当点击文本框后边的空白区域时调用的行为
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

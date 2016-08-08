//
//  AddViewController.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "NSString+Tirming.h"
#import "ZKZAlert.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad
{
    //设置背景颜色
    self.view.backgroundColor=[UIColor whiteColor];
    //设置姓名UITextField
    nametext=[[UITextField alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 40)];
    nametext.placeholder=@"请输入姓名";
    nametext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    nametext.autocorrectionType=UITextAutocorrectionTypeNo;
    nametext.backgroundColor=[UIColor lightGrayColor];
    [nametext addTarget:self action:@selector(clicktag:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:nametext];
    nametext.delegate=self;
    //设置线。
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(10, 130, self.view.frame.size.width-20, 1)];
    line.backgroundColor=[UIColor brownColor];
    [self.view addSubview:line];
    //设置电话UITextField
   teltext=[[UITextField alloc]initWithFrame:CGRectMake(10, 141, self.view.frame.size.width-20, 40)];
    teltext.placeholder=@"请输入电话";
    teltext.keyboardType=UIKeyboardTypeNumberPad;
    teltext.backgroundColor=[UIColor lightGrayColor];
    [teltext addTarget:self action:@selector(clicktag:) forControlEvents:UIControlEventEditingChanged];
    teltext.delegate=self;
    [self.view addSubview:teltext];
    //设置右侧按钮
    right=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(donetag:)];
    
    right.enabled=NO;
    self.navigationItem.rightBarButtonItem=right;
    //设置左侧按钮
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancletag:)];
    self.navigationItem.leftBarButtonItem=left;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)donetag:(UIBarButtonItem *)sender
{
    NSString *name=nametext.text;
    NSString *tel=teltext.text;
    name=[name tirming];
    tel=[tel tirming];
    if (name.length<1)
    {
        [ZKZAlert alert:@"姓名不能为空"];
    }
    else
    {
        [self.delegate PassvalueName:name andWith:tel];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)cancletag:(UIBarButtonItem *)sender
{
    //NSLog(@"this is leftbutton");
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//点击文本框意外区域时
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"touchesBegan");
    [nametext resignFirstResponder];
    [teltext resignFirstResponder];
    
}
//对完成按钮的enable的控制。
-(void)clicktag:(UITextField *)sender
{
    self.navigationItem.rightBarButtonItem.enabled=YES;
    if ([nametext.text isEqualToString:@""]&&[teltext.text isEqualToString:@""])
    {
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
    
    //NSLog(@"这是changebutton");
    //[self touchesBegan:nil withEvent:nil];
    
}
//当编辑文本框时点击ruturn键时的事件
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self touchesBegan:nil withEvent:nil];
    return YES;
}

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
////    if ([name isEqualToString:@""]&&[tel isEqualToString:@""])
////    {
////        right.enabled=NO;
////    }
////    right.enabled=YES;
//    
//    return YES;
//}
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

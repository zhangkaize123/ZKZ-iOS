//
//  AddViewController.m
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "NSString+trim.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"添加联系人";
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    //NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    //创建文本框
    inputText=[[UITextField alloc]initWithFrame:CGRectMake(40, 200, 200, 60)];
    inputText.placeholder=@"输入姓名";
    inputText.backgroundColor=[UIColor greenColor];
    inputText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:inputText];
    inputText.delegate=self;
    //创建完成按钮
    okright=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(okTage:)];
    okright.enabled=NO;
    self.navigationItem.rightBarButtonItem=okright;
    
    
}
#pragma mark -UITextField
//textfiled的代理行为
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self touchesBegan:nil withEvent:nil];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [inputText resignFirstResponder];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *name=textField.text;
    name=[name trim];
    if ([name isEqualToString:@""])
    {
        okright.enabled=NO;
    }
    else
    {
        okright.enabled=YES;
    }
    
}
#pragma mark -UIBarButtonItem
-(void)okTage:(UIBarButtonItem *)sender
{
    //NSLog(@"this is oktage");
    NSString *str=inputText.text;
    str=[str trim];
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ADD" object:str userInfo:nil];
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

//
//  EditViewController.m
//  分割视图2
//
//  Created by 张凯泽 on 15-2-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "EditViewController.h"
#import "NSString+trim.h"
@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor grayColor];
    editText=[[UITextField alloc]initWithFrame:CGRectMake(40, 200, 200, 60)];
    editText.placeholder=@"输入修改姓名";
    editText.text=self.onename;
    editText.backgroundColor=[UIColor greenColor];
    editText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:editText];
    editText.delegate=self;
    UIBarButtonItem *okright=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishTage:)];
    self.navigationItem.rightBarButtonItem=okright;
    self.navigationItem.rightBarButtonItem.enabled=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)finishTage:(UIBarButtonItem *)sender
{
    NSString *str=editText.text;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"EDIT" object:str];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
#pragma mark -EditViewController
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [editText resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self touchesBegan:nil withEvent:nil];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //NSLog(@"****");
    NSString *s=textField.text;
    s=[s trim];
    if (s.length>0)
    {
        self.navigationItem.rightBarButtonItem.enabled=YES;
    }
    else
    {
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
    
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

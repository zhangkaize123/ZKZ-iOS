//
//  AddViewController.m
//  通讯录
//
//  Created by wyzc on 15-2-2.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
@interface AddViewController ()

@end

@implementation AddViewController
#pragma mark - view
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //标题
    self.title=@"新联系人";
    //导航栏左边取消按钮
    UIBarButtonItem * left=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelTap:)];
    self.navigationItem.leftBarButtonItem=left;
    //导航栏右边完成按钮
    UIBarButtonItem * right=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneTap:)];
    right.enabled=NO;
    self.navigationItem.rightBarButtonItem=right;
    //姓名
    UILabel * nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 74, 100, 40)];
    nameLabel.text=@"姓名：";
    nameLabel.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:nameLabel];
    
    nameText=[[UITextField alloc]initWithFrame:CGRectMake(110, 74, self.view.frame.size.width-120, 40)];
    nameText.placeholder=@"在这输入姓名";
    //nameText.delegate=self;
    nameText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    nameText.autocorrectionType=UITextAutocorrectionTypeNo;
    [nameText addTarget:self action:@selector(closeKeybord:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [nameText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:nameText];
    //线
    UIView * line=[[UIView alloc]initWithFrame:CGRectMake(10, 124, self.view.frame.size.width-20, 1)];
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
    //电话
    UILabel * telLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 135, 100, 40)];
    telLabel.text=@"手机：";
    telLabel.font=[UIFont systemFontOfSize:22];
    [self.view addSubview:telLabel];
    
    telText=[[UITextField alloc]initWithFrame:CGRectMake(110, 135, self.view.frame.size.width-120, 40)];
    telText.placeholder=@"在这输入手机号";
    //telText.delegate=self;
    telText.keyboardType=UIKeyboardTypeNumberPad;
    telText.autocorrectionType=UITextAutocorrectionTypeNo;
    [telText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:telText];
    //线
    UIView * line1=[[UIView alloc]initWithFrame:CGRectMake(10, 185, self.view.frame.size.width-20, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line1];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameText resignFirstResponder];
    [telText resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextField
-(void)closeKeybord:(UITextField *)sender
{
    [self touchesBegan:nil withEvent:nil];
}
-(void)textChange:(UITextField *)sender
{
    //NSLog(@"text=%@",sender.text);
    //完成按钮有效
    self.navigationItem.rightBarButtonItem.enabled=YES;
    NSString * name=nameText.text;
    NSString * tel=telText.text;
    //完成按钮无效
    if(name.length==0 && tel.length==0)
    {
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
}

#pragma mark - UIBarButtonItem
-(void)doneTap:(UIBarButtonItem *)sender//完成
{
    //NSLog(@"this is done!");
    //获得姓名和电话
    NSString * name=nameText.text;
    NSString * tel=telText.text;
    name=[name trim];
    tel=[tel trim];
    if([name isEqualToString:@""])
    {
        [ZHQAlert alert:@"由于这个联系人没有姓名，所以不能保存这个联系人！"];
    }
    else
    {
        [self.delegate passValueWithName:name andWithTel:tel];
    }
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)cancelTap:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
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

//
//  EditViewController.m
//  通讯录张三 李四 王五 赵柳 韩晓琪
//
//  Created by wyzc on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "EditViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //左边取消
    UIBarButtonItem * left=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelTap:)];
    self.navigationItem.leftBarButtonItem=left;
    //右边完成
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
    nameText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    nameText.autocorrectionType=UITextAutocorrectionTypeNo;
    [nameText addTarget:self action:@selector(closeKeybord:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [nameText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    nameText.text=self.person.name;
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
    telText.keyboardType=UIKeyboardTypeNumberPad;
    telText.autocorrectionType=UITextAutocorrectionTypeNo;
    [telText addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    telText.text=self.person.tel;
    [self.view addSubview:telText];
    //线
    UIView * line1=[[UIView alloc]initWithFrame:CGRectMake(10, 185, self.view.frame.size.width-20, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line1];
    //删除
    UIButton * delButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 196, self.view.frame.size.width-20, 40)];
    delButton.backgroundColor=[UIColor greenColor];
    [delButton setTitle:@"删除联系人" forState:UIControlStateNormal];
    [delButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [delButton addTarget:self action:@selector(delTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delButton];
    //线
    UIView * line2=[[UIView alloc]initWithFrame:CGRectMake(10, 246, self.view.frame.size.width-20, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line2];
}
-(void)delTap:(UIButton *)sender
{
    UIActionSheet * as=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定删除" otherButtonTitles:nil, nil];
    [as showInView:self.view];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameText resignFirstResponder];
    [telText resignFirstResponder];
}
//单击操作表按钮
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        //回到主界面（所有联系人）
        [self.navigationController popToRootViewControllerAnimated:YES];
        //发通知
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DELETE" object:nil];
    }
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
    //获得姓名和电话
    NSString * name=nameText.text;
    NSString * tel=telText.text;
    //打开完成按钮
    if(![name isEqualToString:self.person.name] || ![tel isEqualToString:self.person.tel])
    {
        self.navigationItem.rightBarButtonItem.enabled=YES;
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
        [ZHQAlert alert:@"由于这个联系人没有姓名，所以不能修改这个联系人！"];
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

@end

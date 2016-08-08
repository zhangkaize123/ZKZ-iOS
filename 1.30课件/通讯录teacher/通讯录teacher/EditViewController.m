//
//  EditViewController.m
//  通讯录teacher
//
//  Created by 张凯泽 on 15-2-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "EditViewController.h"
#import "ZKZAlert.h"
#import "NSString+Tirming.h"
@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad
{
    
    self.view.backgroundColor=[UIColor whiteColor];
    nametext=[[UITextField alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 40)];
    nametext.placeholder=@"请输入姓名";
    //main--->other
    nametext.text=self.p2.name;
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
    //main---->other
    teltext.text=self.p2.tel;
    teltext.keyboardType=UIKeyboardTypeNumberPad;
    teltext.backgroundColor=[UIColor lightGrayColor];
    [teltext addTarget:self action:@selector(clicktag:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:teltext];
    teltext.delegate=self;
    //删除按钮
    UIButton *delebutton=[[UIButton alloc]initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-20, 40)];
    delebutton.backgroundColor=[UIColor redColor];
    //[UIControlStateNormal]
    [delebutton setTitle:@"删除联系人" forState:UIControlStateNormal];
    [delebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [delebutton addTarget:self action:@selector(deletag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delebutton];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishtage:)];
    self.navigationItem.rightBarButtonItem=right;
    right.enabled=NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//删除按钮行为
-(void)deletag:(UIButton *)sender
{
    UIActionSheet *deleaction=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"delete" otherButtonTitles:nil, nil];
    [deleaction showInView:self.view];
}
//删除操作表行为
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"这是删除按钮%ld",(long)buttonIndex);
    if (buttonIndex==0)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DELE" object:nil];
    }
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}
//点击textfild出现的事件
-(void)clicktag:(UITextField *)sender
{
    //NSLog(@"这是textfild");
    self.navigationItem.rightBarButtonItem.enabled=YES;
    if (nametext.text.length<1&&teltext.text.length<1)
    {
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
    
}
//点击完成时出现的事件
-(void)finishtage:(UIBarButtonItem *)sender
{
    self.navigationItem.rightBarButtonItem.enabled=NO;
    NSString *name=nametext.text;
    NSString*tel=teltext.text;
    name=[name tirming];
    tel=[tel tirming];
    //NSLog(@"这是barbutton");
    if (name.length<1)
    {
        [ZKZAlert alert:@"姓名不能为空"];
        [nametext becomeFirstResponder];
    }
    else
    {
        ZKZPerson *p4=[[ZKZPerson alloc]init];
        p4.name=nametext.text;
        p4.tel=teltext.text;
        [self.delegate1 passvalue:p4];
        NSLog(@"p4====%@",p4);
        [self.navigationController popViewControllerAnimated:NO];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nametext resignFirstResponder];
    [teltext resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self touchesBegan:nil withEvent:nil];
    return YES;
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

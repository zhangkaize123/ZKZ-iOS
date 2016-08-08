//
//  Add_ViewController.m
//  通讯录
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "Add_ViewController.h"
#import "MainTableViewController.h"
@interface Add_ViewController ()

@end

@implementation Add_ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"新建联系人";
   // UILabel *namelable=[UILabel alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    //编辑联系人UItextfield
    editpeson=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 100, 200, 40)];
    editpeson.placeholder=@"请输入姓名";
    editpeson.backgroundColor=[UIColor grayColor];
    editpeson.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:editpeson];
    //编辑电话UItextfield
    editphone=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 180, 200, 40)];
    editphone.placeholder=@"请输入电话";
    //editphone.keyboardType=UIKeyboardTypeNumberPad;
    editphone.backgroundColor=[UIColor grayColor];
    editphone.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:editphone];
    //编辑完成button
    UIBarButtonItem *finish=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishtag:)];
    //finish.enabled=NO;
    self.navigationItem.rightBarButtonItem=finish;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)finishtag:(UIBarButtonItem *)sender
{
    NSString *name=editpeson.text;
    NSString *phone=editphone.text;
    //NSMutableString *name=(NSMutableString *)editpeson.text;
    //NSMutableString *phone=(NSMutableString *)editphone.text;
//    if (CFStringTransform((__bridge CFMutableStringRef)name, 0, kCFStringTransformMandarinLatin, NO))
//    {
//        //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
//    }
//    if (CFStringTransform((__bridge CFMutableStringRef)name, 0, kCFStringTransformStripDiacritics, NO)) {
//        //NSLog(@"Pingying: %@", ms); // wo shi zhong guo ren
//    }
//    if (CFStringTransform((__bridge CFMutableStringRef)phone, 0, kCFStringTransformMandarinLatin, NO)) {
//        //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
//    }
//    if (CFStringTransform((__bridge CFMutableStringRef)phone, 0, kCFStringTransformStripDiacritics, NO)) {
//        //NSLog(@"Pingying: %@", ms); // wo shi zhong guo ren
//    }


    //剔除空格
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    phone=[phone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""])
    {
        UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的姓名不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alart show];
        editpeson.text=@"";
        [editpeson becomeFirstResponder];
        return;
    }
    else if ([phone isEqualToString:@""])
    {
        UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的电话不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alart show];
        editphone.text=@"";
        [editphone becomeFirstResponder];
        return;
    }

    else if (name.length>14)
    {
        UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的姓名太长" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alart show];
        [editpeson becomeFirstResponder];
        return;
    }
    //判断是数字。－－－－－－－－－－－－－》
    else if (phone.length>14)
    {
        UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的电话超出位数" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alart show];
        [editphone becomeFirstResponder];
        return;
    }
   else
    {
        //传给主main
//        self.main.addname=name;
//        self.main.addphone=phone;
        
        name=[NSString stringWithFormat:@"%@-%@",name,phone];
//        if (CFStringTransform((__bridge CFMutableStringRef)name, 0, kCFStringTransformMandarinLatin, NO))
//        {
//            //NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén
//        }
//        if (CFStringTransform((__bridge CFMutableStringRef)name, 0, kCFStringTransformStripDiacritics, NO)) {
//            //NSLog(@"Pingying: %@", ms); // wo shi zhong guo ren
//        }
//        [name appendFormat:@"%@",phone];
        self.main.addname=name;
        //NSLog(@"main中addname=%@",self.main.addname);
        
       [self.navigationController popToRootViewControllerAnimated:YES];
   }
//    NSLog(@"编辑完成");
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

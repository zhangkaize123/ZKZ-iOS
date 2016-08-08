//
//  RepairViewController.m
//  通讯录
//
//  Created by 张凯泽 on 15-1-31.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "RepairViewController.h"

@interface RepairViewController ()

@end

@implementation RepairViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    repairtext=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 100, 200, 40)];
    repairtext.placeholder=@"请输入要修改姓名";
    //main----->other
    repairtext.text=self.repairname;
    repairtext.enabled=NO;
    repairtext.backgroundColor=[UIColor grayColor];
    repairtext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:repairtext];
    //编辑电话UItextfield
    text=[[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 180, 200, 40)];
    text.placeholder=@"请输入要修改电话";
    //main----->other
    text.text=self.repairphone;
    text.enabled=NO;
    //editphone.keyboardType=UIKeyboardTypeNumberPad;
    text.backgroundColor=[UIColor grayColor];
    text.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:text];
    bar=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editok:)];
    //bar.enabled=NO;
    self.navigationItem.rightBarButtonItem=bar;
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)editok:(UIBarButtonItem *)sender
{
    NSString *str=sender.title;
    if ([str isEqualToString:@"编辑"])
    {
        repairtext.enabled=YES;
        text.enabled=YES;
        bar.enabled=YES;
        bar.title=@"完成";
        
    }
    else
    {
                    NSString *name=repairtext.text;
            NSString *phone=text.text;
            //剔除空格
            name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            phone=[phone stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([name isEqualToString:@""])
        {
            UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的姓名不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alart show];
            repairtext.text=@"";
            [repairtext becomeFirstResponder];
            return;
        }
        else if ([phone isEqualToString:@""])
        {
            UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的电话不能为空" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alart show];
            text.text=@"";
            [text becomeFirstResponder];
            return;
        }
        else if (name.length>14)
        {
            UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的姓名太长" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alart show];
            [repairtext becomeFirstResponder];
            return;
        }
        //判断是数字。－－－－－－－－－－－－－》
        else if (phone.length>14)
        {
            UIAlertView *alart=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的电话超出位数" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
            [alart show];
            [text becomeFirstResponder];
            return;
        }
        else
        {
            //other---->main
            self.m.repairn=[NSString stringWithFormat:@"%@-%@",name,phone];
        
            //NSLog(@"main中addname=%@",self.main.addname);

            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
    
    
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    
//    
//    
//    
//    
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

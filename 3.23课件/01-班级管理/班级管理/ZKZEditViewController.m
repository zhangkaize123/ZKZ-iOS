//
//  ZKZEditViewController.m
//  班级管理
//
//  Created by 张凯泽 on 15-3-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZEditViewController.h"

@interface ZKZEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *showText;
- (IBAction)editTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
- (IBAction)delTap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@end

@implementation ZKZEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=[NSString stringWithFormat:@"欢迎%@修改班级",_senduser];
    self.userText.text=str;
    self.showText.text=_sendclass;
}

#pragma mark-----重写set方法
-(void)setKeyId:(int)keyId
{
    _keyId=keyId;
}
-(void)setSendclass:(NSString *)sendclass
{
    _sendclass=sendclass;
    
}
-(void)setSenduser:(NSString *)senduser
{
    _senduser=senduser;
}
-(void)setNumberStr:(NSString *)numberStr
{
    _numberStr=numberStr;
}
#pragma mark----推出键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)editTap:(UIButton *)sender {
    
    NSString *name=self.showText.text;
    NSString *urlstr=[NSString stringWithFormat:@"http://127.0.0.1/zkz/edit_ios.php?id=%d&name=%@",_keyId,name];
    NSURL *url=[NSURL URLWithString:urlstr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([str containsString:@"success"]) {
        //删除成功
        NSLog(@"修改成功");
        NSString *string=[NSString stringWithFormat:@"%d,%@",_keyId,name];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"UPDATE" object:string];
       [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        //删除失败
        NSLog(@"修改失败");
    }

    
}
- (IBAction)delTap:(UIButton *)sender {
    [self deleteClass];
    
    
}
#pragma mark---删除方法
-(void)deleteClass
{
    NSString *urlstr=[NSString stringWithFormat:@"http://127.0.0.1/zkz/del_ios.php?id=%d",self.keyId];
    NSURL *url=[NSURL URLWithString:urlstr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
   NSData *data= [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if ([str containsString:@"success"]) {
        //删除成功
        NSLog(@"删除成功");
        NSString *string=self.sendclass;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DELETE" object:string];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        //删除失败
        NSLog(@"删除失败");
    }
}
@end

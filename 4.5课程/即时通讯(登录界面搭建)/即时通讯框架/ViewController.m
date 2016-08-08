//
//  ViewController.m
//  即时通讯框架
//
//  Created by wyzc on 15-4-3.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+trim.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "ZHQAlert.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *unameText;
@property (weak, nonatomic) IBOutlet UITextField *upassText;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginTap;

@end

@implementation ViewController
//登录失败时
-(void)onError:(id)obj
{
    self.loginBtn.enabled=YES;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    //提示出错信息
    [ZHQAlert alert:@"登录失败，请检查你的用户名或密码"];
    //断开链接
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    [app disconnect];
    
}
//登录成功时
-(void)onSuccess:(id)obj
{
    self.loginBtn.enabled=YES;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    //进入聊天的主界面
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //登录失败
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onError:) name:@"ERROR" object:nil];
    //登录成功
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onSuccess:) name:@"SUCCESS" object:nil];
    
}
//关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.unameText resignFirstResponder];
    [self.upassText resignFirstResponder];
}

- (IBAction)loginTap {
    
    NSString *uname=self.unameText.text;
    NSString *upass=self.upassText.text;
    uname=[uname trim];
    upass=[upass trim];
    if ([uname isEqualToString:@""]) {
        [SVProgressHUD setBackgroundColor:[UIColor grayColor]];
        [SVProgressHUD showErrorWithStatus:@"账号不能为空"];
        self.unameText.text=@"";
        [self.unameText becomeFirstResponder];
        return ;
    }
       if ([upass isEqualToString:@""]) {
           [SVProgressHUD setBackgroundColor:[UIColor grayColor]];
           [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
           self.upassText.text=@"";
           [self.upassText becomeFirstResponder];
           return ;
       }
    //按钮锁定
    [self.loginBtn setTitle:@"正在登录。。。" forState:UIControlStateNormal];
    self.loginBtn.enabled=NO;
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    if(![app connectWithUname:uname andWithUpass:upass])
    {
        [SVProgressHUD showErrorWithStatus:@"登录失败，请稍后在登录"];
    }

}

@end

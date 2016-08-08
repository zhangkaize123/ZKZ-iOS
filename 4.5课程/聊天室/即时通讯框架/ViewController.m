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
#import "MainViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

@end

@implementation ViewController
//登录成功时
-(void)onSuccess:(id)obj
{
    //解开登录按钮
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.loginButton.enabled=YES;
    //进入主界面
    [self performSegueWithIdentifier:@"mainView" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController * tcn = segue.destinationViewController;
    if ([tcn isKindOfClass:[MainViewController class]]) {
        AppDelegate * app=[UIApplication sharedApplication].delegate;
        NSString * sql=nil;
        sql = @"select count(*) from messages where flag = 0";
        FMResultSet * rs = [app.db executeQuery:sql];
        [rs next];
        NSString *num = [rs stringForColumnIndex:0];
        
        NSLog(@"%@",num);
        ((MainViewController*)tcn).bageNumber = num;
        //关闭 记录
        [rs close];
        //对本地数据库根据username进行分组
        //select username , count(*) from messages where flag = 0 group by username
        sql = @"select username , count(*) from messages where flag = 0 group by username";
        rs = [app.db executeQuery:sql];
        while ([rs next]) {
            
        }
        //select * from messages where username = 'zhangkz1' order by time desc limit 0,1
    }
}

//登录失败时
-(void)onError:(id)obj
{
    //解开登录按钮
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    self.loginButton.enabled=YES;
    //提示出错信息
    [ZHQAlert alert:@"登录失败，请检查你的用户名或密码！"];
    //断开与服务器的连接
     AppDelegate * app=[UIApplication sharedApplication].delegate;
    [app disconnect];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onError:) name:@"ERROR" object:nil];//登录失败
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onSuccess:) name:@"SUCCESS" object:nil];//登录失败
}


//关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.unameText resignFirstResponder];
    [self.upassText resignFirstResponder];
}
- (IBAction)login:(UIButton *)sender
{
    //数据验证
    NSString * uname=self.unameText.text;
    NSString * upass=self.upassText.text;
    uname=[uname trim];
    upass=[upass trim];
    if([uname isEqualToString:@""])
    {
        [SVProgressHUD setBackgroundColor:[UIColor grayColor]];
        [SVProgressHUD showErrorWithStatus:@"账号不能为空！"];
        self.unameText.text=@"";
        [self.unameText becomeFirstResponder];
        return;
    }
    if([upass isEqualToString:@""])
    {
        [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
        [SVProgressHUD showErrorWithStatus:@"密码不能为空！"];
        self.upassText.text=@"";
        [self.upassText becomeFirstResponder];
        return;
    }
    //封锁按钮
    [sender setTitle:@"正在登录..." forState:UIControlStateNormal];
    sender.enabled=NO;
    AppDelegate * app=[[UIApplication sharedApplication]delegate];
    if(![app connectWithUname:uname andWithUpas:upass andIsLoginOrIsRegister:YES])
    {
        [SVProgressHUD showErrorWithStatus:@"登录失败，请稍后在试！"];
    }
}
@end

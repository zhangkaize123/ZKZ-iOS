//
//  ViewController.m
//  班级管理
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
#import "SVProgressHUD.h"
#import "ZKZTool.h"
#import "NSString+trim.h"
#import "Reachability.h"
@interface ViewController ()
{
    NSString *username;
    Reachability *reach;
}
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *passText;
- (IBAction)loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *okBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.okBtn.enabled=YES;
#pragma mark----提示框的通知
      [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(netChange:) name:kReachabilityChangedNotification object:nil];
    //创建一个检测类的对象
    reach=[Reachability reachabilityWithHostName:[ZKZTool ip]];
    //*******开启通知
    [reach startNotifier];
}
#pragma mark----网络检测的通知
-(void)netChange:(id)obj
{
    Reachability *sender=[obj object];
    if (sender.currentReachabilityStatus==NotReachable) {
        self.okBtn.enabled=NO;
        [SVProgressHUD showWithStatus:@"没有网络,连接"];
        [self performSelector:@selector(dissmiss) withObject:self afterDelay:2.0];
        return;
    }
   if(sender.currentReachabilityStatus==ReachableViaWiFi)
        {
            [SVProgressHUD showSuccessWithStatus:@"成功连接wifi"];
            self.okBtn.enabled=YES;
            NSLog(@"连接Wi-Fi");
        }
   if(sender.currentReachabilityStatus==ReachableViaWWAN)
        {
            [SVProgressHUD showSuccessWithStatus:@"你连接的是3G或者4G网络，请注意流量"];
            self.okBtn.enabled=YES;
            NSLog(@"连接蜂窝网路");
        }
    
}
#pragma mark------无网络连接的方法
-(void)dissmiss
{
    [SVProgressHUD dismiss];
    
}
#pragma mark----登录按钮的方法
- (IBAction)loginBtn {
    //对输入进行验证
    //去除空格
    username=[self.userText.text trim];
    NSString *password=[self.passText.text trim];
    if([username isEqualToString:@""]||[password isEqualToString:@""])
    {
        NSLog(@"****");
        self.userText.text=@"";
        self.passText.text=@"";
        [self.userText becomeFirstResponder];
        //提示框显示登录失败
        [SVProgressHUD showErrorWithStatus:@"账号或者密码不能为空"];
        return;
    }
    [SVProgressHUD showWithStatus:@"正在验证中"];
    //使用多线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
           NSURL *url=[NSURL URLWithString:@"http://127.0.0.1/zkz/login_ios_post.php"];
        NSMutableURLRequest *resquest=[NSMutableURLRequest requestWithURL:url];
        [resquest setHTTPMethod:@"post"];
        NSString *str=[NSString stringWithFormat:@"uname=%@&upass=%@",username,password];
        NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
        [resquest setHTTPBody:data];
        data=nil;
        data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",dic);
        if (dic!=nil) {
            //NSLog(@"登录成功");
            dispatch_async(dispatch_get_main_queue(), ^{
                //提示框显示登录成功
                [SVProgressHUD dismiss];
                ShowViewController *showView=[[ShowViewController alloc]init];
                showView.sendname=username;
                [self.navigationController pushViewController:showView animated:YES];
            //
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //提示框显示登录失败
                self.userText.text=@"";
                self.passText.text=@"";
                [self.userText becomeFirstResponder];
                [SVProgressHUD showErrorWithStatus:@"账号或者密码错误"];
                
            });
        }
    });
}

#pragma mark----推出键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

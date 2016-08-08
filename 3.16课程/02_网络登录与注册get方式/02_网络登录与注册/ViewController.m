//
//  ViewController.m
//  02_网络登录与注册
//
//  Created by 张凯泽 on 15-3-16.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uname;
@property (weak, nonatomic) IBOutlet UITextField *upass;
- (IBAction)loginTap:(UIButton *)sender;
- (IBAction)registTap:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   }



- (IBAction)loginTap:(UIButton *)sender {
    NSString *uname=self.uname.text;
    NSString *upass=self.upass.text;
    NSString *urlstring=[NSString stringWithFormat:@"http://localhost/web/action_ios_get.php?uname=%@&upass=%@&submit=%@",uname,upass,@"dl"];
    NSLog(@"%@",urlstring);
    NSURL *url=[NSURL URLWithString:urlstring];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    if ([str containsString:@"dlsuccess"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
        else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }

   }

- (IBAction)registTap:(UIButton *)sender {
    NSString *uname=self.uname.text;
    NSString *upass=self.upass.text;
    NSString *urlstring=[NSString stringWithFormat:@"http://localhost/web/action_ios.php?uname=%@&upass=%@&submit=%@",uname,upass,@"zc"];
    NSLog(@"%@",urlstring);
    NSURL *url=[NSURL URLWithString:urlstring];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    if ([str containsString:@"zcexists"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册已经存在" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([str containsString:@"zcsuccess"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册成功!" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
/*
 NSString * uname=self.uname.text;
 NSString * upass=self.upass.text;
 //数据的验证
 NSString * urlString=[NSString stringWithFormat:@"http://localhost/web/action_ios.php?uname=%@&upass=%@&submit=%@",uname,upass,@"zc"];
 NSLog(@"%@",urlString);
 NSURL * url=[NSURL URLWithString:urlString];
 NSURLRequest * request=[NSURLRequest requestWithURL:url];
 NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 if(data)
 {
 NSString * str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
 NSLog(@"%@",str);
 if([str isEqualToString:@"zcexists"])
 {
 UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"你要注册的账号已经存在！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
 [alert show];
 }
 else if([str isEqualToString:@"zcsuccess"])
 {
 UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册账号成功！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
 [alert show];
 }
 else
 {
 UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册账号失败！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
 [alert show];
 }
 }
 else
 {
 UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册账号失败！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
 [alert show];
 }
 
*/
}
@end

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
    NSString *urlstring=[NSString stringWithFormat:@"http://localhost/web/action_ios_post.php?uname=%@&upass=%@&submit=%@",uname,upass,@"dl"];
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
    //创建URL http://194.119.11.121:4003/backend/getimage?id=2504
    NSString *urlstring=[NSString stringWithFormat:@"http://localhost/web/action_ios_post.php"];
    
    NSLog(@"%@",urlstring);
    NSURL *url=[NSURL URLWithString:urlstring];
    //创建请求
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //设置请求方式
    [request setHTTPMethod:@"POST"];
    //NSString *s = @"type=focus-c";//设置参数
    NSString *str1=[NSString stringWithFormat:@"uname=%@&upass=%@&submit=%@",uname,upass,@"注册"];
    NSData *d = [str1 dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:d];
    //创建链接
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    if ([str containsString:@"存在"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册已经存在" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([str containsString:@"成功"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册成功!" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }

}
@end

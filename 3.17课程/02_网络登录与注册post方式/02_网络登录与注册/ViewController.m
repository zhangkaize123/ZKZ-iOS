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
    NSString *urlstr=[NSString stringWithFormat:@"%@",@"http://localhost/web/action_ios_post.php"];
    NSURL *url=[NSURL URLWithString:urlstr];
    NSMutableURLRequest *resquest=[[NSMutableURLRequest alloc]initWithURL:url];
    [resquest setHTTPMethod:@"post"];
    NSString *paramiry=[NSString stringWithFormat:@"uname=%@&upass=%@&submit=%@",uname,upass,@"登录"];
    NSData *data=[paramiry dataUsingEncoding:NSUTF8StringEncoding];
    [resquest setHTTPBody:data];
    data=nil;
    data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    if ([str containsString:@"成功"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([str containsString:@"失败"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }

    
   }

- (IBAction)registTap:(UIButton *)sender {
    NSString *uname=self.uname.text;
    NSString *upass=self.upass.text;
    NSString *urlstr=[NSString stringWithFormat:@"%@",@"http://localhost/web/action_ios_post.php"];
    //创建URL
    NSURL *url=[NSURL URLWithString:urlstr];
    //创建请求
    NSMutableURLRequest *resquest=[[NSMutableURLRequest alloc]initWithURL:url];
    //设定请求方式
    [resquest setHTTPMethod:@"post"];
    
    NSString *paramiry=[NSString stringWithFormat:@"uname=%@&upass=%@&submit=%@",uname,upass,@"注册"];
    NSData *data=[paramiry dataUsingEncoding:NSUTF8StringEncoding];
    //设定参数
    [resquest setHTTPBody:data];
    data=nil;
    //发送请求
    data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
    if ([str containsString:@"成功"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([str containsString:@"存在"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"用户存在" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([str containsString:@"失败"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

    


@end

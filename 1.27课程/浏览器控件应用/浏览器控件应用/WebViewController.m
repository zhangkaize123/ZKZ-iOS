//
//  WebViewController.m
//  浏览器控件应用
//
//  Created by 张凯泽 on 16/3/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //浏览器控件
    UIWebView *wb=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-0)];
    wb.tag=10;
    [self.view addSubview:wb];
    wb.delegate=self;

    //建立一个view控件
    v=[[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-80)/2, (self.view.frame.size.height-80)/2+50, 80, 80)];
    v.layer.cornerRadius=80/4;
    v.backgroundColor=[UIColor blackColor];
    v.hidden=YES;
    [self.view addSubview:v];
    //建立活动指示器控件
    UIActivityIndicatorView *aiv=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(15, 0, 50, 50)];
    //aiv.hidesWhenStopped=NO;
    [aiv startAnimating];
    [v addSubview:aiv];
    //建立lable控件
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, 80, 20)];
    lable.text=@"正在加载";
    lable.textAlignment=NSTextAlignmentCenter;
    lable.textColor=[UIColor whiteColor];
    [v addSubview:lable];
    NSURL *url=[[NSURL alloc]initWithString:self.urlStr];
    //得到访问请求
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    //加载访问请求
    [wb loadRequest:request];

}

-(void)webViewDidStartLoad:(UIWebView *)webView//开始加载
{
    NSLog(@"StartLoad");
    v.hidden=NO;
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView//加载完成
{
    NSLog(@"FinishLoad");
    v.hidden=YES;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error//加载出现错误的时候
{
    v.hidden=YES;
    NSLog(@"LoadWithError");
    UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"加载失败" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    //[a show];
}

@end

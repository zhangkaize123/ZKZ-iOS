//
//  ViewController.m
//  浏览器控件应用
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor whiteColor];
    //文本框
    UITextField *urltext=[[UITextField alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    urltext.backgroundColor=[UIColor brownColor];
    urltext.keyboardType=UIKeyboardTypeURL;
    urltext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    urltext.returnKeyType=UIReturnKeyGo;
    [urltext addTarget:self action:@selector(returntap:) forControlEvents:UIControlEventEditingDidEndOnExit];
    urltext.placeholder = @"请输入IP";
    [self.view addSubview:urltext];
    //浏览器控件
    UIWebView *wb=[[UIWebView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60)];
    wb.tag=10;
    [self.view addSubview:wb];
    //wb.delegate=self;
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
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)returntap:(UITextField *)sender
{
    //
    UIWebView *w=(UIWebView *)[self.view viewWithTag:10];
    NSString *str=sender.text;
    str=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([str isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"网址不能为空" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        sender.text=@"";
        return;
    }
    if (![str hasPrefix:@"http://"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"网址无效" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        sender.text=@"";
        return;
        
    }
    WebViewController * webViewcontroler = [[WebViewController alloc]init];
    webViewcontroler.urlStr = str;
    [self presentViewController:webViewcontroler animated:YES completion:nil];
    if (![sender isExclusiveTouch]) {
        [sender resignFirstResponder];
    }
    //得到url
    NSURL *url=[[NSURL alloc]initWithString:sender.text];
    //得到访问请求
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    //加载访问请求
    [w loadRequest:request];
    
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
    [a show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

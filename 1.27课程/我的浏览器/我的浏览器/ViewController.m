//
//  ViewController.m
//  我的浏览器
//
//  Created by 张凯泽 on 15-1-27.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //模仿的地址栏
    float screenWidth=self.view.frame.size.width;
    float screenHeight=self.view.frame.size.height;
    UITextField *urltext=[[UITextField alloc]initWithFrame:CGRectMake(0, 20, screenWidth, 40)];
    urltext.backgroundColor=[UIColor lightGrayColor];
    urltext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    urltext.keyboardType=UIKeyboardTypeURL;
    urltext .text=@"http://www.google.com.hk/m?gl=CN&hl=zh_CN&source=ihp";
    urltext.returnKeyType=UIReturnKeyGo;
    //响应return事件
    [urltext addTarget:self action:@selector(returntap:) forControlEvents:UIControlEventEditingDidEndOnExit];
                         //编辑完成离开的时候。
    [self.view addSubview:urltext];
    //web  的控件
    UIWebView *iv=[[UIWebView alloc]initWithFrame:CGRectMake(0, 60, screenWidth, screenHeight-60)];
    iv.backgroundColor=[UIColor grayColor];
    iv.tag=12;
    [self.view addSubview:iv];
    iv.delegate=self;
    //活动指示器
    
//    UIActivityIndicatorView *active=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 200, 300, 100)];
//    active.tag=11;
//    active.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
//    active.backgroundColor=[UIColor brownColor];
   // active.hidesWhenStopped=NO;
    //[iv addSubview:active];
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)returntap:(UITextField*)sender
{
    
    
   NSString *str=[[NSString alloc]initWithFormat:@"%@%@",@"http://",sender.text];
    NSLog(@"%@",str);
    UIWebView *w=(UIWebView *)[self.view viewWithTag:12];
    NSURL *url=[NSURL URLWithString:sender.text];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [w loadRequest:request];
    
    
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView//加载开始
{
    //NSLog(@"sdfdf");
    UIActivityIndicatorView *a=(UIActivityIndicatorView *)[self.view viewWithTag:11];
    //[a startAnimating];
    
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView//加载完成

{
     NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSLog(@"currentURL = %@",currentURL);
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"title = %@",title);
    
     NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='侯文富专栏';"];
    
    NSString *js_result2 = [webView stringByEvaluatingJavaScriptFromString:@"document.forms[0].submit(); "];
    
//    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
//    "script.type = 'text/javascript';"
//      "script.text = \"function myFunction() { "
//      "var field = document.getElementsByName('q')[0];"
//      "field.value='朱祁林';"
//      "document.forms[0].submit();"
//      "}\";"
//      "document.getElementsByTagName('head')[0].appendChild(script);"];
//    
//     [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error//加载完成
{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"加载失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
    [alert show];

    
}
-(void)myFunction{
    NSLog(@"000000000");
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

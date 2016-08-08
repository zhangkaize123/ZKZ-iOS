//
//  ViewController.m
//  02_网络登录与注册
//
//  Created by 张凯泽 on 15-3-16.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
{
    NSMutableData *receiveData;
}
@property (weak, nonatomic) IBOutlet UITextField *uname;
@property (weak, nonatomic) IBOutlet UITextField *upass;
- (IBAction)loginTap:(UIButton *)sender;
- (IBAction)registTap:(UIButton *)sender;
- (IBAction)respondTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //json
    /*NSURL *url=[NSURL URLWithString:@"http://api.36wu.com/IdCard/GetIdCardInfo?idcard=21030319630118474X"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@",dic);
    NSLog(@"*****************************");
    NSArray *array=[dic allKeys];
    for (NSString *str in array) {
        NSLog(@"%@",[dic objectForKey:str]);
    }*/
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"json" ofType:@"geojson"];
    NSData *data=[NSData dataWithContentsOfFile:path];
    NSLog(@"%@",path);
    NSLog(@"data=%@",data);
    NSError *error;
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"%@",dic);
    NSLog(@"%@",error);
    
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
    NSURL *url=[NSURL URLWithString:@"http://localhost/web/f.php"];
    NSMutableURLRequest *resquest=[[NSMutableURLRequest alloc]initWithURL:url];
    [resquest setHTTPMethod:@"post"];
    NSString *str=[NSString stringWithFormat:@"uname=%@&upass=%@&submit=%@",uname,upass,@"注册"];
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    [resquest setHTTPBody:data];
    data=nil;
    data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSString *s=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",s);
    if ([s containsString:@"存在"]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"用户已存在" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([s containsString:@"成功"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"错误" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
- (IBAction)respondTap {
    NSURL *url=[NSURL URLWithString:@"https://www.baidu.com/img/bdlogo.png"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSURLConnection *conn=[[NSURLConnection alloc]initWithRequest:resquest delegate:self];
}
//开始响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    receiveData=[[NSMutableData alloc]init];
}
//下载
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receiveData appendData:data];
    
    
}
//完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImageView *iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 300)];
    iv.image=[[UIImage alloc]initWithData:receiveData];
    [self.view addSubview:iv];
    
    
}
//发生错误
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}




@end

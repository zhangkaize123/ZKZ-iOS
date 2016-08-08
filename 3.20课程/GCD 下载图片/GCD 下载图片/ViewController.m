//
//  ViewController.m
//  GCD 下载图片
//
//  Created by 张凯泽 on 15-3-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 ASIHttpRequest  处理请求
 */
@interface ViewController ()
- (IBAction)okTap;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (IBAction)okTap {
    [self.okBtn setTitle:@"正在下载。。。" forState:UIControlStateNormal];
    self.okBtn.enabled=NO;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURL *url=[NSURL URLWithString:@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=图片美女&step_word=&pn=8&spn=0&di=0&pi=20833073689&rn=1&tn=baiduimagedetail&is=&istype=2&ie=utf-8&oe=utf-8&in=24401&cl=2&lm=-1&st=-1&cs=826155658%2C1316142024&os=&adpicid=0&ln=1998&fr=ala&fmq=1402900904181_R&ic=0&s=&se=1&sme=&tab=&width=&height=&face=0&ist=&jit=&cg=girl&bdtype=-1&objurl=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F80cb39dbb6fd5266c96cb6fdaf18972bd5073697.jpg&fromurl=http%3A%2F%2F&gsm="];
        NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
        NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
        NSLog(@"****************%@",[NSThread currentThread]);
        if (data) {
           // NSLog(@"________________data=%@",data);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.okBtn setTitle:@"下载" forState:UIControlStateNormal];
                UIImage *image=[UIImage imageWithData:data];
                if (image) {
                    self.okBtn.enabled=YES;
                    self.imageview.image=image;
                }else{
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"下载未成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
                    [alert show];
                }
            });
        }
        else{
            [self.okBtn setTitle:@"下载" forState:UIControlStateNormal];
            self.okBtn.enabled=YES;
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"下载失败" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
    });
    
    
    
    
}
@end

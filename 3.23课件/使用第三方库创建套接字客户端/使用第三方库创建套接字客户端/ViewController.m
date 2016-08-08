//
//  ViewController.m
//  使用第三方库创建套接字客户端
//
//  Created by 张凯泽 on 15-3-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AsyncSocket.h"
@interface ViewController ()<AsyncSocketDelegate>
@property (weak, nonatomic) IBOutlet UIButton *connBtn;
- (IBAction)conTap;
@property (weak, nonatomic) IBOutlet UITextField *sendText;
- (IBAction)sendTap;
@property (weak, nonatomic) IBOutlet UITextView *receiveText;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
- (IBAction)closeTap;
@property(nonatomic,strong)AsyncSocket *socket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//连接按钮
- (IBAction)conTap {
    //创建套接字对象
    self.socket=[[AsyncSocket alloc]initWithDelegate:self];
    NSError *error;
    if(![self.socket connectToHost:@"127.0.0.1" onPort:9000 error:&error])
    {
        NSLog(@"连接失败-%@",[error description]);
    }
}
//发送按钮
- (IBAction)sendTap {
    NSString *str=self.sendText.text;
    str=[str stringByAppendingString:@"/r/n"];
    [self.socket writeData:[str dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    
}
//断开按钮
- (IBAction)closeTap {
    [self.socket disconnect];
    self.connBtn.enabled=YES;
    self.closeBtn.enabled=NO;
}
#pragma mark-----socket代理方法
//连接服务器成功
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    self.connBtn.enabled=NO;
    self.closeBtn.enabled=YES;
    //准备接受准备继续接收或发送数据
    [self.socket readDataWithTimeout:-1 tag:0];
    
}
//断开服务器
-(void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    self.connBtn.enabled=YES;
    self.closeBtn.enabled=NO;
}
//连接失败
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    self.connBtn.enabled=YES;
    self.closeBtn.enabled=NO;
}
//接受数据
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    self.receiveText.text=[NSString stringWithFormat:@"%@%@",self.receiveText.text,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]];
    //准备继续接收或发送数据
    [self.socket readDataWithTimeout:-1 tag:0];
    
    
}
@end

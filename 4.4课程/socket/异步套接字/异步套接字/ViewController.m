//
//  ViewController.m
//  异步套接字
//
//  Created by wyzc on 15-3-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSError *error;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connBtn:(UIButton *)sender {
    self.socket=[[AsyncSocket alloc]initWithDelegate:self];
    NSError * err;
    if([self.socket connectToHost:@"127.0.0.1" onPort:90000 error:&err]==NO)
    {
        NSLog(@"%@",[err description]);
    }
}

- (IBAction)sendBtn:(UIButton *)sender {
    NSString * str=self.sendText.text;
    str=[str stringByAppendingString:@"\r\n"];
    [self.socket writeData:[str dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
}

- (IBAction)closeBtn:(UIButton *)sender {
    [self.socket disconnect];
    sender.enabled=NO;
    self.conn.enabled=YES;
}
//连接服务器成功
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"connection success!");
    self.conn.enabled=NO;
    self.close.enabled=YES;
    //准备接收或写数据
    [self.socket readDataWithTimeout:-1 tag:0];
}
//断开连接成功
-(void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    if (error) {
        NSLog(@"连接服务没有成功");
    }else{
        NSLog(@"服务器断开");
    }
    NSLog(@"disconnection!");
    self.conn.enabled=YES;
    self.close.enabled=NO;
}
//错误断开连接
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"error disconnection!");
    self.conn.enabled=YES;
    self.close.enabled=NO;
    error = err;
}


//接收数据
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    self.revText.text=[NSString stringWithFormat:@"%@%@",self.revText.text,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]];
    //准备继续接收或发送数据
    [self.socket readDataWithTimeout:-1 tag:0];
}
@end

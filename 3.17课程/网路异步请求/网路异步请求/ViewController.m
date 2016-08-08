//
//  ViewController.m
//  网路异步请求
//
//  Created by 张凯泽 on 15-3-17.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
{
    sqlite3 *db;
}
- (IBAction)responsTap:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //sqlite3 *db;
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path=[bundle pathForResource:@"mydb" ofType:@"sqlite"];
    sqlite3_open([path UTF8String], &db);
    NSLog(@"___%@",path);


}


- (IBAction)responsTap:(UIButton *)sender {
    NSURL *url=[NSURL URLWithString:@"http://wenwen.soso.com/p/20111230/20111230015250-2073096029.jpg"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSURLConnection *conn=[NSURLConnection connectionWithRequest:resquest delegate:self];
    [conn start];
}
#pragma mark----链接代理方法
//开始响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"有东西返回来了");
    receiveData =[[NSMutableData alloc]init];
    
}
//接受数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receiveData appendData:data];
    NSLog(@"接受到数据");
}
//下载完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"____%@",[NSThread currentThread]);
    NSLog(@"接受完成");
    char *sql="insert into t_images (image) values (?)";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if (sqlite3_bind_blob(stmt, 1, receiveData.bytes,(int) receiveData.length, NULL)==SQLITE_OK)
        {
            if (sqlite3_step(stmt)==SQLITE_DONE)
            {
                NSLog(@"成功");
            }
            else
            {
                NSLog(@"失败");
            }
            
            
        }
    }
    UIImageView * iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 120, 320, 300)];
    iv.image=[UIImage imageWithData:receiveData];
    
    [self.view addSubview:iv];
    
    
}
//下载出错
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"出错了");
}







@end

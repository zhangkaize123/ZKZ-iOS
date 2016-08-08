//
//  ViewController.m
//  网络登录注册
//
//  Created by 张凯泽 on 15-3-16.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
/*
 1.把网络的资源下载到磁盘
 
 
 
 */
#import "sqlite3.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString*path=[[NSBundle mainBundle]pathForResource:@"mydb" ofType:@"sqlite"];
    NSLog(@"%@",path);
    sqlite3 *db;
    if(sqlite3_open([path UTF8String], &db)!=SQLITE_OK)
    {
        NSLog(@"打开失败");
    }
    
    //创建URL
//    NSURL *url=[NSURL URLWithString:@"https://www.baidu.com/img/bdlogo.png"];
//    //创建一个请求
//    NSURLRequest *request=[NSURLRequest requestWithURL:url];
//    //发同步请求
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    //写到数据库
//    char *sql="insert into t_images (image) values (?)";
//    sqlite3_stmt*stmt;
//    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
//    {
//        if (sqlite3_bind_blob(stmt, 1, [data bytes], (int)data.length, NULL)==SQLITE_OK) {
//            if (sqlite3_step(stmt)==SQLITE_DONE) {
//                NSLog(@"写入图片成功");
//            }
//            else{
//                NSLog(@"写入图片失败");
//            }
//        }
//    }
    
    char *sql="select image from t_images where id=1";//选择image这一列
    sqlite3_stmt*stmt;
    if(sqlite3_prepare_v2(db , sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_step(stmt)==SQLITE_ROW)
        {
            int bytes=sqlite3_column_bytes(stmt,0 );
            Byte *arr=(Byte *)sqlite3_column_blob(stmt, 0);
            NSData *data=[NSData dataWithBytes:arr length:bytes];
            UIImageView *vi=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
            vi.image=[UIImage imageWithData:data];
            [self.view addSubview:vi];
        }
    }
    
    
   /*
    sqlite3_stmt*stmt;
    char *sql="select * from t_images where id=1";
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            int bytes=sqlite3_column_bytes(stmt, 1);
            NSLog(@"%d",bytes);
            const void *value=sqlite3_column_blob(stmt, 1);
            if (value!=NULL&&bytes!=0) {
                NSData *data=[NSData dataWithBytes:value length:bytes];
                UIImageView *iv=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
                iv.image=[UIImage imageWithData:data];
                [self.view addSubview:iv];
            }
        }
    }
    sqlite3_finalize(stmt);
    */
    
}



@end

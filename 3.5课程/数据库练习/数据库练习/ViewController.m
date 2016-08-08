//
//  ViewController.m
//  数据库练习
//
//  Created by 张凯泽 on 15-3-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //得到沙河路径
    NSString *path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"my.db"];
    NSLog(@"%@",path);
    //打开数据库
    sqlite3 * db;
    sqlite3_open([path UTF8String], &db);
    //对数据库进行操作
    //创建表格
    char *error;
    if(sqlite3_exec(db, "create table if not exists t_mydb (username text NOT NULL,password  NOT NULL,PRIMARY KEY(username)); ", NULL, NULL, &error)!=SQLITE_OK)
    {
        NSLog(@"%s",error);
    }
    //NSString *username=@"888";
    //增加数据
//    if(sqlite3_exec(db, "insert into t_mydb (username,password) values ('123','234')", NULL, NULL, &error)!=SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }
//    if(sqlite3_exec(db, "insert into t_mydb (username,password) values ('345','234')", NULL, NULL, &error)!=SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }
    //修改数据
    if(sqlite3_exec(db, "update t_mydb set username='张三' where username='123'", NULL, NULL, &error)!=SQLITE_OK)
    {
        NSLog(@"%s",error);
    }
    //删除
//    if(sqlite3_exec(db, "delete from t_mydb where username='345'", NULL, NULL, &error)==SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }
    //查询数据
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, "select * from t_mydb", -1, &stmt, NULL)==SQLITE_OK)
    {
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            char *name=(char*)sqlite3_column_text(stmt, 0);
            char * pass=(char *)sqlite3_column_text(stmt, 1);
            NSLog(@"name=%@,pass=%@",[NSString stringWithUTF8String:name],[NSString stringWithUTF8String:pass]);
        }
    }
    //释放
    sqlite3_finalize (stmt);
    //关闭数据库
    sqlite3_close(db);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

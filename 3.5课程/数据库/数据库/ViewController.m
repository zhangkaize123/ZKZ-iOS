//
//  ViewController.m
//  数据库
//
//  Created by 张凯泽 on 15-3-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
@interface ViewController ()

@end

@implementation ViewController
/*
 数据库的表格中一行：代表一个记录；
            一列：代表一个字段；
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加libsqlite3.dylib
    //#import"sqlite3.h"
    //获得数据库文件的路径和文件名
    NSString *path=NSHomeDirectory();
    path=[path stringByAppendingPathComponent:@"my.db"];
    NSLog(@"%@",path);
    //1打开数据库
    sqlite3 *db;
    sqlite3_open([path UTF8String], &db);
    //2.对数据库进行操作
    //sqlite3_exec/|ɪkˈzek/(<#sqlite3 *#>, <#const char *sql#>, <#int (*callback)(void *, int, char **, char **)#>, <#void *#>, <#char **errmsg#>
        char *error;
    //创建一个表格
    if(sqlite3_exec(db, "CREATE TABLE if not exists t_mydb (username text NOT NULL,password text NOT NULL);", NULL,NULL , &error)!=SQLITE_OK)
    {
        NSLog(@"%s",error);
    }
    //1写入一行数据
//    if(sqlite3_exec(db, "insert into t_mydb values('123','123')", NULL,NULL , &error)!=SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }
//    if(sqlite3_exec(db, "insert into t_mydb values('345','123')", NULL,NULL , &error)!=SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }

    //2修改一行数据
    
    if(sqlite3_exec(db, "update t_mydb set username=678,password=789 ", NULL,NULL , &error)!=SQLITE_OK)
    {
        NSLog(@"%s",error);
    }
    //3.删除一行数据
//    if(sqlite3_exec(db, "delete from t_mydb where username=345", NULL, NULL, &error)!=SQLITE_OK)
//    {
//        NSLog(@"%s",error);
//    }
    //运行查询
    sqlite3_stmt*stmt;//记录集
    char *sql="select * from t_mydb";
    //sqlite3_prepare_v2(<#sqlite3 *db#>, <#const char *zSql#>, <#int nByte#>, <#sqlite3_stmt **ppStmt#>, <#const char **pzTail#>)
    
    if (sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK) {
        //sqlite3_step(<#sqlite3_stmt *#>)
        while (sqlite3_step(stmt)==SQLITE_ROW) {//得到一个记录
            char *uname=(char *)sqlite3_column_text(stmt, 0);

            char *pass=(char *)sqlite3_column_text(stmt, 1);
            NSLog(@"username=%@,password=%@",[NSString stringWithUTF8String:uname],[NSString stringWithUTF8String:pass]);
        }
    }
    //释放记录集
    sqlite3_finalize (stmt);

    
    
    
    
        //3.关闭数据库
    sqlite3_close(db);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

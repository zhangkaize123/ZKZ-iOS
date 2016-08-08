//
//  ViewController.m
//  数据库的操作
//
//  Created by 张凯泽 on 15-3-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *passText;
- (IBAction)okTap:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}



- (IBAction)okTap:(UIButton *)sender {
    NSString *name=self.nameText.text;
    NSString *pass=self.passText.text;
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    sqlite3 *db=app.db;
    /*
     方法1.
     对于特殊字符不能保存
     NSString *sql=[NSString stringWithFormat:@"insert into t_mydb values ('%@','%@')",name,pass];
    char *error;
    if(sqlite3_exec(db, [sql UTF8String], NULL, NULL, &error)==SQLITE_OK)
    {
        NSLog(@"添加成功");
    }
    else{
        NSLog(@"添加失败");
    }*/
    
    
    
    //方法2: 优点可以对特殊字符进行存储
//    char *sql="insert into t_mydb values (?,?)";
//    //1.准备运行
//    //设定陈述－－－记录集
//    sqlite3_stmt *stmt;
//    //2.准备运行
//    int preResult=sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
//    //3.绑定参数------数据绑定在陈述上边
//    int bindResult=sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
//    int bindResult1=sqlite3_bind_text(stmt, 2, [pass UTF8String], -1, NULL);
//    //4.运行Sql
//    int execResult=sqlite3_step(stmt);
//    if(preResult==SQLITE_OK&&bindResult==SQLITE_OK&bindResult1==SQLITE_OK&&execResult==SQLITE_DONE){
//        
//        
//        NSLog(@"成功");
//    }else{
//        NSLog(@"失败");
//    }
     //修改
    //设置sql语句
    //使用where 条件语句时  或者使用or   并且使用and
//    char *sql="update t_mydb set username=?,password=? where username='5556'and password='345'";
//    NSLog(@"1");
//    //创建陈述;
//    sqlite3_stmt *stmt;
//    //准备运行－－－－sql放到上边去
//    int pre=sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
//    if (pre==SQLITE_OK) {
//        NSLog(@"2");
//    }
//    
//    //与陈述进行绑定
//    int bind1=sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
//    if (bind1==SQLITE_OK) {
//        NSLog(@"3");
//    }
//
//    int bind2=sqlite3_bind_text(stmt, 2, [pass UTF8String], -1, NULL);
//    //sqlite3_bind_text(<#sqlite3_stmt *#>, <#int#>, <#const char *#>, <#int n#>, <#void (*)(void *)#>)
//    if (bind2==SQLITE_OK) {
//        NSLog(@"4");
//    }
//    //sql
//    int runR=sqlite3_step(stmt);
//    if (runR==SQLITE_DONE) {
//        NSLog(@"5");
//    }
//    if (pre==SQLITE_OK&&bind1==SQLITE_OK&&bind2==SQLITE_OK&&runR==SQLITE_DONE) {
//        NSLog(@"成功＊＊＊＊＊");
//    }else{
//        NSLog(@"失败");
//    }
    //查看
    //1.创建sql语句
    sqlite3_stmt *stmt;
//    char *sql="select * from t_mydb";
//    //NSLog(@"1");
   
//    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
//    {
//        while (sqlite3_step(stmt)==SQLITE_ROW) {
//       
//            char *name=(char*)sqlite3_column_text(stmt, 0);
//            char *pass=(char *)sqlite3_column_text(stmt, 1);
//            NSLog(@"name=%s    pass=%s",name,pass);
//        }
//    }
//    sqlite3_finalize(stmt);
    
}
@end

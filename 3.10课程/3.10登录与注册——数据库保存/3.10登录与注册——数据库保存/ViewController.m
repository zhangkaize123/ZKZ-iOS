//
//  ViewController.m
//  3.10登录与注册——数据库保存
//
//  Created by 张凯泽 on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    UITextField*unametText;//账号控件；
    
    UITextField*upassText;//密码控件；
    BOOL isRember;//是否记住；
    UIButton * remButton;//记住按钮
    BOOL isExist;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=[[NSUserDefaults standardUserDefaults]objectForKey:@"rember"];
    if (str!=nil) {
        isRember=YES;
    }else{
        isRember=NO;
    }
    float width=self.view.frame.size.width;
    UILabel * unameLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2, 40, 80, 40)];
    unameLabel.text=@"账号：";
    unameLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:unameLabel];
    //接收账号文本框
    unametText=[[UITextField alloc]initWithFrame:CGRectMake((width-280)/2+80, 40, 200, 40)];
    unametText.placeholder=@"在这输入你的账号";
    unametText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:unametText];
    //密码文字标签
    UILabel * upassLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2, 100, 80, 40)];
    upassLabel.text=@"密码：";
    upassLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:upassLabel];
    //接收密码文本框
    upassText=[[UITextField alloc]initWithFrame:CGRectMake((width-280)/2+80, 100, 200, 40)];
    //accountText.backgroundColor=[UIColor greenColor];
    upassText.placeholder=@"在这输入你的密码";
    upassText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    upassText.secureTextEntry=YES;
    [self.view addSubview:upassText];
    //记住密码按钮
     remButton=[[UIButton alloc]initWithFrame:CGRectMake((width-280)/2+12, 160, 35, 35)];
    remButton.backgroundColor=[UIColor blueColor];
    [remButton addTarget:self action:@selector(rember:) forControlEvents:UIControlEventTouchUpInside];
    if (isRember) {
        [remButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        NSArray *array=[str componentsSeparatedByString:@","];
        unametText.text=array[0];
        upassText.text=array[1];
        
    }else{
        [remButton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
    }
    
    [self.view addSubview:remButton];
    //记住密码文字标签
    //密码文字标签
    UILabel * remLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2+80, 160, 180, 40)];
    remLabel.text=@"记住密码";
    remLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:remLabel];
    //登录按钮
    UIButton * loginButton=[[UIButton alloc]initWithFrame:CGRectMake((width-280)/2, 220, 280, 40)];
    loginButton.backgroundColor=[UIColor greenColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //注册按钮
    UIButton * registerButton=[[UIButton alloc]initWithFrame:CGRectMake((width-280)/2, 280, 280, 40)];
    registerButton.backgroundColor=[UIColor greenColor];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(register:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
}
/**登录的实现方法*/
-(void)login:(UIButton *)sender
{
    NSString*uname=unametText.text;
    NSString*upass=upassText.text;
    uname=[uname trim];
    upass=[upass trim];
    if([uname isEqualToString:@""])
    {
        [ZHQAlert alert:@"账号不能为空"];
        unametText.text=@"";
        [unametText becomeFirstResponder];
        return;
    }
    if([upass isEqualToString:@""])
    {
        [ZHQAlert alert:@"密码不能为空"];
        upassText.text=@"";
        [upassText becomeFirstResponder];
        return;
    }
    isExist=NO;
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    sqlite3 *db=app.db;
    sqlite3_stmt *stmt;
    char *sql="select * from t_user where username=? and password=?";
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if (sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK&&sqlite3_bind_text(stmt, 2, [upass UTF8String], -1, NULL)==SQLITE_OK) {
            if (sqlite3_step(stmt)==SQLITE_ROW) {
                [ZHQAlert alert:@"登录成功"];
                isExist=YES;
            }
        }
    }
    sqlite3_finalize(stmt);
    if (isExist==NO) {
        [ZHQAlert alert:@"登录失败"];
    }
    //记住密码操作
    if(isRember==YES){
        NSString *string=[NSString stringWithFormat:@"%@,%@",uname,upass];
        [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"rember"];
        
    }
    
    else{
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"rember"];
    }
    
    
    
    
    
    
    
}
/**注册的实现方法*/
-(void)register:(UIButton *)sender
{
    NSString*uname=unametText.text;
    NSString*upass=upassText.text;
    uname=[uname trim];
    upass=[upass trim];
    if([uname isEqualToString:@""])
    {
        [ZHQAlert alert:@"账号不能为空"];
        unametText.text=@"";
        [unametText becomeFirstResponder];
        return;
    }
    if([upass isEqualToString:@""])
    {
        [ZHQAlert alert:@"密码不能为空"];
        upassText.text=@"";
        [upassText becomeFirstResponder];
        return;
    }
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    sqlite3*db=app.db;
    //和以前的数据进行比较
    char *sql="select * from t_user where username=?";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_ROW)
            {
                [ZHQAlert alert:@"账号已经存在,请重新注册"];
                return;
            }
        }
    }
    sqlite3_finalize(stmt);
    isExist=NO;
    sql="insert into t_user values(?,?)";
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK&&sqlite3_bind_text(stmt, 2, [upass UTF8String], -1, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                isExist=YES;
                [ZHQAlert alert:@"添加成功"];
            }
        }
    }
    sqlite3_finalize(stmt);
    if(isExist==NO)
    {
        [ZHQAlert alert:@"添加失败"];
    }
    
}
/**记住密码的实现方法*/
-(void)rember:(UIButton *)sender
{
    if (isRember) {
        [remButton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
        isRember=NO;
    }
    else{
        [remButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        isRember=YES;
    }

}

@end

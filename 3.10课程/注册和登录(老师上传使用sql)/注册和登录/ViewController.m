//
//  ViewController.m
//  注册和登录
//
//  Created by wyzc on 15-3-10.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * uname,* upass;
    //得到默认保存的用户名和密码
    NSString * info=[[NSUserDefaults standardUserDefaults]objectForKey:@"rember"];
    if(info!=nil)//有保存密码
    {
        //拆分到数组
        NSArray * arr=[info componentsSeparatedByString:@","];
        uname=arr[0];//得到用户名
        upass=arr[1];//得到密码
    }
    //提示标签－账号
    UILabel * unameLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 30, 70, 40)];
    unameLabel.text=@"账号：";
    unameLabel.font=[UIFont boldSystemFontOfSize:22];
    [self.view addSubview:unameLabel];
    //输入账号的文本框
    unameText=[[UITextField alloc]initWithFrame:CGRectMake(120, 30, self.view.frame.size.width-50-50-70, 40)];
    unameText.placeholder=@"在这输入你的账号";
    if(info!=nil)
    {
        unameText.text=uname;
    }
    [self.view addSubview:unameText];
    //提示标签－ 密码
    UILabel * upassLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 80, 70, 40)];
    upassLabel.text=@"密码：";
    upassLabel.font=[UIFont boldSystemFontOfSize:22];
    [self.view addSubview:upassLabel];
    //输入密码的文本框
    upassText=[[UITextField alloc]initWithFrame:CGRectMake(120, 80, self.view.frame.size.width-50-50-70, 40)];
    upassText.secureTextEntry=YES;
    upassText.placeholder=@"在这输入你的密码";
    if(info!=nil)
    {
        upassText.text=upass;
    }
    [self.view addSubview:upassText];
    //记住账号的按钮
    remButton=[[UIButton alloc]initWithFrame:CGRectMake(50, 140, 30, 30)];
    if(info!=nil)
    {
        [remButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
    }
    else
    {
        [remButton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
    }
    [remButton addTarget:self action:@selector(remTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:remButton];
    //提示记住账号
    UILabel * remLabel=[[UILabel alloc]initWithFrame:CGRectMake(90, 135, 170, 40)];
    remLabel.text=@"记住密码";
    remLabel.font=[UIFont boldSystemFontOfSize:22];
    [self.view addSubview:remLabel];
    //登录的按钮
    UIButton * loginButton=[[UIButton alloc]initWithFrame:CGRectMake(50, 190, self.view.frame.size.width-50-50, 40)];
    loginButton.backgroundColor=[UIColor greenColor];
    [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font=[UIFont boldSystemFontOfSize:24];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //注册的按钮
    UIButton * registerButton=[[UIButton alloc]initWithFrame:CGRectMake(50, 240, self.view.frame.size.width-50-50, 40)];
    registerButton.backgroundColor=[UIColor greenColor];
    [registerButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    registerButton.titleLabel.font=[UIFont boldSystemFontOfSize:24];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
}
-(void)remTap:(UIButton *)sender//记住密码
{
    if(isRember)
    {
        [remButton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
        isRember=NO;
    }
    else
    {
        [remButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        isRember=YES;
    }
}
-(void)loginTap:(UIButton *)sender//登录
{
    NSString * uname=unameText.text;
    NSString * upass=upassText.text;
    uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    upass=[upass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if([uname isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"用户名不能为空！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        unameText.text=@"";
        [unameText becomeFirstResponder];
        return;
    }
    if([upass isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        upassText.text=@"";
        [upassText becomeFirstResponder];
        return;
    }
    AppDelegate * app=[UIApplication sharedApplication].delegate;
    sqlite3 * db=app.db;
    //查询当前用户是否存在
    char * sql="select * from t_user where uname=? and upass=?";
    BOOL isExist=NO;
    sqlite3_stmt * stmt;
    //绑定并且运行
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK && sqlite3_bind_text(stmt, 2, [upass UTF8String], -1, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_ROW)
            {
                isExist=YES;
            }
        }
    }
    sqlite3_finalize(stmt);//释放陈述
    if(isExist)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录成功！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        //是否记住密码
        if(isRember)
        {
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@,%@",uname,upass] forKey:@"rember"];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"rember"];
        }
        return;
    }
    else
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"登录失败，请检查你的账号和密码！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }

}
-(void)registerTap:(UIButton *)sender//注册
{
    NSString * uname=unameText.text;
    NSString * upass=upassText.text;
    uname=[uname stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    upass=[upass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if([uname isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"用户名不能为空！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        unameText.text=@"";
        [unameText becomeFirstResponder];
        return;
    }
    if([upass isEqualToString:@""])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        upassText.text=@"";
        [upassText becomeFirstResponder];
        return;
    }
    AppDelegate * app=[UIApplication sharedApplication].delegate;
    sqlite3 * db=app.db;
    //查询当前用户是否存在
    char * sql="select * from t_user where uname=?";
    BOOL isExist=NO;
    sqlite3_stmt * stmt;
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_ROW)
            {
                isExist=YES;
            }
        }
    }
    sqlite3_finalize(stmt);
    if(isExist)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"当前账号已经存在，你必须更换！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    sql="insert into t_user values(?,?)";
    isExist=NO;
    if(sqlite3_prepare_v2(db, sql, -1, &stmt, NULL)==SQLITE_OK)
    {
        if(sqlite3_bind_text(stmt, 1, [uname UTF8String], -1, NULL)==SQLITE_OK && sqlite3_bind_text(stmt, 2, [upass UTF8String], -1, NULL)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号注册成功，你可以登录了！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
                isExist=YES;
                [alert show];
            }
        }
    }
    sqlite3_finalize(stmt);
    if(isExist==NO)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号注册失败，请重新操作！" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        isExist=YES;
        [alert show];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

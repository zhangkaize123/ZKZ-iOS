//
//  ViewController.m
//  登录和注册
//
//  Created by wyzc on 15-1-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    filePath=NSHomeDirectory();
    NSString * path=[filePath stringByAppendingPathComponent:@"rember.plist"];
    filePath=[filePath stringByAppendingPathComponent:@"users.plist"];
    self.userInfo=[[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
    if(self.userInfo==nil)
    {
        self.userInfo=[[NSMutableDictionary alloc]initWithCapacity:10];
    }
    NSDictionary * dict=[[NSDictionary alloc]initWithContentsOfFile:path];
    NSLog(@"%@",self.userInfo);
    isCheck=NO;//不记住密码
    self.view.backgroundColor=[UIColor whiteColor];
    float width=self.view.frame.size.width;
    //float height=self.view.frame.size.height;
    //账号文字标签
    UILabel * accountLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2, 40, 80, 40)];
    //accountLabel.backgroundColor=[UIColor blueColor];
    accountLabel.text=@"账号：";
    accountLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:accountLabel];
    //接收账号文本框
    accountText=[[UITextField alloc]initWithFrame:CGRectMake((width-280)/2+80, 40, 200, 40)];
    //accountText.backgroundColor=[UIColor greenColor];
    accountText.placeholder=@"在这输入你的账号";
    accountText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:accountText];
    //密码文字标签
    UILabel * passwordLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2, 100, 80, 40)];
    //accountLabel.backgroundColor=[UIColor blueColor];
    passwordLabel.text=@"密码：";
    passwordLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:passwordLabel];
    //接收密码文本框
    passwordText=[[UITextField alloc]initWithFrame:CGRectMake((width-280)/2+80, 100, 200, 40)];
    //accountText.backgroundColor=[UIColor greenColor];
    passwordText.placeholder=@"在这输入你的密码";
    passwordText.autocapitalizationType=UITextAutocapitalizationTypeNone;
    passwordText.secureTextEntry=YES;
    [self.view addSubview:passwordText];
    //记住密码按钮
    UIButton * checkButton=[[UIButton alloc]initWithFrame:CGRectMake((width-280)/2+12, 160, 35, 35)];
    checkButton.backgroundColor=[UIColor blueColor];
    if(dict==nil)
    {
        [checkButton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
    }
    else
    {
        [checkButton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        NSArray * key=[dict allKeys];
        accountText.text=key[0];
        passwordText.text=[dict objectForKey:key[0] ];
    }
    [checkButton addTarget:self action:@selector(checkTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:checkButton];
    //记住密码文字标签
    //密码文字标签
    UILabel * remberLabel=[[UILabel alloc]initWithFrame:CGRectMake((width-280)/2+80, 160, 180, 40)];
    //accountLabel.backgroundColor=[UIColor blueColor];
    remberLabel.text=@"记住密码";
    remberLabel.font=[UIFont systemFontOfSize:24];
    [self.view addSubview:remberLabel];
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

-(void)calibrate
{

    userName=accountText.text;
    password=passwordText.text;
    //剔除两端空格
    userName=[userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    password=[password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //数据验证
    if([userName isEqualToString:@""])//是否为空
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号不能为空，你必须输入！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        accountText.text=@"";//清空
        [accountText becomeFirstResponder];
        return;
    }
    if(userName.length<6 || userName.length>15)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号只能是6至15个字符！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        [accountText becomeFirstResponder];
        return;
    }
    BOOL flag=NO;
    for(int i=0;i<userName.length;i++)
    {
        if(([userName characterAtIndex:i]>='0' && [userName characterAtIndex:i]<='9') || ([userName characterAtIndex:i]>='a' && [userName characterAtIndex:i]<='z') || ([userName characterAtIndex:i]>='A' && [userName characterAtIndex:i]<='Z'))
        {
            flag=NO;
        }
        else
        {
            flag=YES;
            break;
        }
    }
    if(flag==YES)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号的组成只能是字符和数字！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        accountText.text=@"";//清空
        [accountText becomeFirstResponder];
        return;
    }
    if([password isEqualToString:@""])//是否为空
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空，你必须输入！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordText.text=@"";//清空
        [passwordText becomeFirstResponder];
        return;
    }
    if(password.length!=8)//长度必须为8
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码必须是8个字符！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        [passwordText becomeFirstResponder];
        return;
    }
    flag=NO;
    for(int i=0;i<password.length;i++)//每个字符必须为字母或数字
    {
        if(([password characterAtIndex:i]>='0' && [password characterAtIndex:i]<='9') || ([password characterAtIndex:i]>='a' && [password characterAtIndex:i]<='z') || ([password characterAtIndex:i]>='A' && [password characterAtIndex:i]<='Z'))
        {
            flag=NO;
        }
        else
        {
            flag=YES;
            break;
        }
    }
    if(flag==YES)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码的组成只能是字符和数字！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordText.text=@"";//清空
        [passwordText becomeFirstResponder];
        return;
    }

}




-(void)login:(UIButton *)sender//登录
{
    
    [self calibrate];
    
    
    //登录
    NSString * savePass=(NSString *)[self.userInfo objectForKey:userName];
    if(savePass==nil)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"对不起，没有这个用户，请注册后再登录！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    else
    {
        if([savePass isEqualToString:password])
        {
            UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"恭喜你，登录成功！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
            NSString * path=NSHomeDirectory();
            path=[path stringByAppendingPathComponent:@"rember.plist"];
            NSDictionary * dict=[[NSDictionary alloc]initWithObjectsAndKeys:password,userName, nil];
            if(isCheck)
            {
                [dict writeToFile:path atomically:YES];
            }
            else
            {
                NSFileManager * fm=[[NSFileManager alloc]init];
                [fm removeItemAtPath:path error:nil];
            }
        }
        else
        {
            UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"对不起，用户名或密码错误！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}
-(void)register:(UIButton *)sender//注册
{
    //得到用户输入的账号(6-15个字符组成，只能是字母或数字)和密码(8个字符组成，只能是字母或数字)
    userName=accountText.text;
    password=passwordText.text;
    //剔除两端空格
    userName=[userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    password=[password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //数据验证
    if([userName isEqualToString:@""])//是否为空
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号不能为空，你必须输入！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        accountText.text=@"";//清空
        [accountText becomeFirstResponder];
        return;
    }
    if(userName.length<6 || userName.length>15)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号只能是6至15个字符！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        [accountText becomeFirstResponder];
        return;
    }
    BOOL flag=NO;
    for(int i=0;i<userName.length;i++)
    {
        if(([userName characterAtIndex:i]>='0' && [userName characterAtIndex:i]<='9') || ([userName characterAtIndex:i]>='a' && [userName characterAtIndex:i]<='z') || ([userName characterAtIndex:i]>='A' && [userName characterAtIndex:i]<='Z'))
        {
            flag=NO;
        }
        else
        {
            flag=YES;
            break;
        }
    }
    if(flag==YES)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"账号的组成只能是字符和数字！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        accountText.text=@"";//清空
        [accountText becomeFirstResponder];
        return;
    }
    if([password isEqualToString:@""])//是否为空
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空，你必须输入！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordText.text=@"";//清空
        [passwordText becomeFirstResponder];
        return;
    }
    if(password.length!=8)//长度必须为8
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码必须是8个字符！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        [passwordText becomeFirstResponder];
        return;
    }
    flag=NO;
    for(int i=0;i<password.length;i++)//每个字符必须为字母或数字
    {
        if(([password characterAtIndex:i]>='0' && [password characterAtIndex:i]<='9') || ([password characterAtIndex:i]>='a' && [password characterAtIndex:i]<='z') || ([password characterAtIndex:i]>='A' && [password characterAtIndex:i]<='Z'))
        {
            flag=NO;
        }
        else
        {
            flag=YES;
            break;
        }
    }
    if(flag==YES)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码的组成只能是字符和数字！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordText.text=@"";//清空
        [passwordText becomeFirstResponder];
        return;
    }
    
    
    
    
    
    
    
    
    
    //判断用户是否存在
    id o=[self.userInfo objectForKey:userName];
    if(o)
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"对不起，此用户已经存在，请更换用户名后再注册！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        accountText.text=@"";//清空
        [accountText becomeFirstResponder];
        return;
    }
    //注册
    [self.userInfo setObject:password forKey:userName];
    
    if(![self.userInfo writeToFile:filePath atomically:YES])
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"用户注册失败，请稍后再试！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        [self.userInfo removeObjectForKey:userName];
    }
    else
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"恭喜你,注册成功，你可以去登录了！" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)checkTap:(UIButton *)sender//轻击记住密码按钮
{
    if(isCheck)//选中
    {
        [sender setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];//显示不选中图片
        isCheck=NO;//改标志
    }
    else//未选
    {
        [sender setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];//显示选中图片
        isCheck=YES;//改标志
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  登录与注册teacher
//
//  Created by 张凯泽 on 15-1-23.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ZKZTrming.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    CGRect frame=self.view.frame;
    //文件的创建
    NSString*str=NSHomeDirectory();
    //保存最后一个（记住密码的文件）
    path=[str stringByAppendingPathComponent:@"user.plist"];
    filepath=[str stringByAppendingPathComponent:@"users.plist"];
    NSLog(@"%@",path);
    usersinfo=[[NSMutableDictionary alloc]initWithContentsOfFile:filepath];
    if (usersinfo==nil)
    {
        usersinfo=[[NSMutableDictionary alloc]initWithCapacity:20];
    }
    
    //帐号文字标签label
    UILabel *accountlable=[[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-280)/2, 40, 80, 40)];
    accountlable.backgroundColor=[UIColor grayColor];
    accountlable.text=@"帐号：";
    [self.view addSubview:accountlable];
    //帐号文字文本框textfiled
    accountext=[[UITextField alloc]initWithFrame:CGRectMake((frame.size.width-280)/2+80, 40, 200, 40)];
    accountext.backgroundColor=[UIColor greenColor];
    NSArray *array=[[NSArray alloc]initWithContentsOfFile:path];
    if (array==nil)
    {
        accountext.placeholder=@"请输入帐号";
    }
    else
    {
        accountext.text=array[0];
        NSLog(@"记住的的帐号");
    }
    //剔除首字母大写
    accountext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    [self.view addSubview:accountext];
    
    //密码文字标签label
    UILabel *passwordlable=[[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-280)/2, 100, 80, 40)];
    passwordlable.backgroundColor=[UIColor grayColor];
    passwordlable.text=@"密码：";
   // passwordlable.autocapitalizationType=[UITextAutocapitalizationTypeNone ];
    //codelable.textAlignment=UITextAlignmentCenter;
    //设值密码框
    [self.view addSubview:passwordlable];
    //密码文字文本框textfiled
    passwordtext=[[UITextField alloc]initWithFrame:CGRectMake((frame.size.width-280)/2+80, 100, 200, 40)];
    //剔除首字母大写。
    passwordtext.autocapitalizationType=UITextAutocapitalizationTypeNone;
    passwordtext.secureTextEntry=YES;
    passwordtext.backgroundColor=[UIColor greenColor];
    //4.文本框提示
    NSArray *array2=[[NSArray alloc]initWithContentsOfFile:path];
    if (array2==nil)
    {
        passwordtext.placeholder=@"请输入密码";
        
    }
    else
    {
        passwordtext.text=array2[1];
        NSLog(@"记住的密码");
    }

    [self.view addSubview:passwordtext];
    
    //记住密码button
    UIButton *checkbutton=[[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-280)/2+12, 160, 35, 35)];
    checkbutton.backgroundColor=[UIColor greenColor];
    NSArray *array1=[[NSArray alloc]initWithContentsOfFile:path];
    if (array1==nil)
    {
        [checkbutton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
       // isCheck=NO;
    }
    else
    {
       [checkbutton setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        //isCheck=YES;
    }
    
    //[checkbutton setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
    [checkbutton addTarget:self action:@selector(checktap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbutton];
    
    
    
    //记住密码lable
    UILabel *remberlable=[[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-280)/2+80, 160, 180, 40)];
    remberlable.text=@"记住密码";
    remberlable.backgroundColor=[UIColor redColor];
    [self.view addSubview:remberlable];
    
    
    
    //登录button
    UIButton *enterbutton=[[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-280)/2, 220, 280, 40)];
    enterbutton.backgroundColor=[UIColor greenColor];
    [enterbutton setTitle:@"登录" forState:UIControlStateNormal];
    [enterbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [enterbutton addTarget:self action:@selector(entertag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enterbutton];
    
    
    
    //注册button
    UIButton *registerbutton=[[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-280)/2, 280, 280, 40)];
    registerbutton.backgroundColor=[UIColor greenColor];
    [registerbutton setTitle:@"注册" forState:UIControlStateNormal];
    [registerbutton addTarget:self action:@selector(registeraction:) forControlEvents:UIControlEventTouchUpInside];
    [registerbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:registerbutton];
    
    
    
    
}
-(void)checktap:(UIButton*)sender
{
    //密码狂
    //大小写消除
    //全局变量 待查看？开始时时  NO
    //NSLog(@"%d",isCheck);
    if (isCheck)
    {
        [sender setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
        
        isCheck=NO;
        //NSLog(@"%d......",isCheck);

    }
    
    else
    {
        [sender setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        isCheck=YES;
        //NSString *pathstring=NSHomeDirectory();
        //pathstring=[pathstring stringByAppendingPathComponent:@"path.plist"];
        NSArray *array=[[NSArray alloc]initWithObjects:accountext.text,passwordtext.text, nil];
        [array writeToFile:path atomically:YES];
        NSLog(@"-----%@----",path);
        
        
    }
    
}
-(void)entertag:(UIButton*)sender//登录操作
{
    if (isCheck==NO)
    {
        //删除记住的文件夹 －－》 内容
        
        NSFileManager *manger=[[NSFileManager alloc]init];
        [manger removeItemAtPath:path error:nil];
        NSLog(@"信息删除");
    }

    //得到用户名和密码。
    NSString *username=accountext.text;
    NSString *password=passwordtext.text;
    //剔除空格
    username=[username trming];
    password=[password trming];
    //有效性验证。
    BOOL flag1=NO;
    BOOL flag2=NO;
    //验证
    //1消息对话框／／2获得焦点
    if ([username isEqualToString:@""])
    {
        //弹出对话框的设值
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"帐号不能为空" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        
        
        accountext.text=@"";
        //3.变成焦点－－－－光标定在那个位置
        [accountext becomeFirstResponder];
        return;
    }
    if (username.length<6||username.length>15)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"帐号只能是6-15个字符" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [accountext becomeFirstResponder];
        return;
    }
    
    for (int i=0; i<username.length; i++)
    {
        if(([username characterAtIndex:i]>='0'&&[username characterAtIndex:i]<='9')||([username characterAtIndex:i]>='a'&&[username characterAtIndex:i]<='z')||([username characterAtIndex:i]>='A'&&[username characterAtIndex:i]<='Z'))
        {
            
            flag1=YES;
            
        }
        else
        {
            flag1=NO;
            break;//------------->检测到异常后直接退出循环，老师那里学的，自己没想到。
        }

        
    }
    if (flag1==NO)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的只能是数字或者字母" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
        [alert show];
        accountext.text=@"";
        [accountext becomeFirstResponder];
        return;
    }
   //密码验证
    if ([password isEqualToString:@""])
    {
        //弹出对话框的设值
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordtext.text=@"";
        //3.变成焦点－－－－光标定在那个位置
        [passwordtext becomeFirstResponder];
        return;
    }
    //密码长度检测
    if (password.length!=8)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码只能是8个字符" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [passwordtext becomeFirstResponder];
        return;
    }
    
    //密码中字符检测
    for (int i=0; i<password.length; i++)
    {
        if(([password characterAtIndex:i]>='0'&&[password characterAtIndex:i]<='9')||([password characterAtIndex:i]>='a'&&[password characterAtIndex:i]<='z')||([password characterAtIndex:i]>='A'&&[password characterAtIndex:i]<='Z'))
        {
            
            
            flag2=YES;
            
        }
        else
        {
            flag2=NO;
            break;//------------->检测到异常后直接退出循环，老师那里学的，自己没想到。
        }

        
    }
    if (flag2==NO)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的只能是数字或者字母" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
        [alert show];
        passwordtext.text=@"";
        [passwordtext becomeFirstResponder];
        return;
    }
    //对用户名进行验证
    //对密码进行验证
    usersinfo=[[NSMutableDictionary  alloc]initWithContentsOfFile:filepath];
    if (usersinfo==nil)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"对不起，没有这个用户，请注册后再登录！" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
   // NSLog(@"%@",usersinfo);
    else
    {
        NSArray *array=[usersinfo allKeys];
        for (NSString *str2 in array)
        {
            if ([str2 isEqualToString:username]&&[usersinfo objectForKey:str2])//在这里可以不用判定密码，因为一个一个键对应一个值，如果有相同的键会把前一个跟他一样的替换掉。
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"恭喜你输入正确" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            
        }
    }
    
    
    
    
}
-(void)registeraction:(UIButton*)sender
{    //得到用户输入的帐号和密码（6-15）字符   字母或者数字／／ 必须是8个字符
    NSString *username=accountext.text;
    NSString *password=passwordtext.text;
    //剔除空格。
    username=[username trming];
    password=[password trming];
    BOOL flag1=NO;
    BOOL flag2=NO;
    //验证
    //1消息对话框／／2获得焦点
    if ([username isEqualToString:@""])
    {
        //弹出对话框的设值
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"帐号不能为空" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        
        
        accountext.text=@"";
        //3.变成焦点－－－－光标定在那个位置
        [accountext becomeFirstResponder];
        return;
    }
    if (username.length<6||username.length>15)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"帐号只能是6-15个字符" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [accountext becomeFirstResponder];
        return;
    }
    
    for (int i=0; i<username.length; i++)
    {
        if(([username characterAtIndex:i]>='0'&&[username characterAtIndex:i]<='9')||([username characterAtIndex:i]>='a'&&[username characterAtIndex:i]<='z')||([username characterAtIndex:i]>='A'&&[username characterAtIndex:i]<='Z'))
        {

            flag1=YES;
            
        }
        else
        {
            flag1=NO;
            break;//------------->检测到异常后直接退出循环，老师那里学的，自己没想到。
        }
        
    }
    if (flag1==NO)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的只能是数字或者字母" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
        [alert show];
        accountext.text=@"";
        [accountext becomeFirstResponder];
        return;
    }
    //密码检测
    if ([password isEqualToString:@""])
    {
        //弹出对话框的设值
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
        passwordtext.text=@"";
        //3.变成焦点－－－－光标定在那个位置
        [passwordtext becomeFirstResponder];
        return;
    }
    //密码长度检测
    if (password.length!=8)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"密码只能是8个字符" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        [passwordtext becomeFirstResponder];
        return;
    }

    //密码中字符检测
    for (int i=0; i<password.length; i++)
    {
        if(([password characterAtIndex:i]>='0'&&[password characterAtIndex:i]<='9')||([password characterAtIndex:i]>='a'&&[password characterAtIndex:i]<='z')||([password characterAtIndex:i]>='A'&&[password characterAtIndex:i]<='Z'))
        {

            flag2=YES;
            
        }
        else
        {
            flag2=NO;
            break;//------------->检测到异常后直接退出循环，老师那里学的，自己没想到。
        }

        
    }
    if (flag2==NO)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入的只能是数字或者字母" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
        [alert show];
        passwordtext.text=@"";
        [passwordtext becomeFirstResponder];
        return;
    }
    //判断文件中是否有这个用户名
    BOOL flag3=NO;
    /*
     这是老师做的判断方法。因为username就是字典里的键所有可以用它。－－－》自己没有想到－－－－－－－－－－－《
     id o=[usersinfo objectForKey:username];
    if (o)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入用户名已被使用" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
        [alert show];
        accountext.text=@"";
        [accountext becomeFirstResponder];
        return;
    }*/
    NSArray *array=[usersinfo allKeys];
    for (NSString *str in array)
    {
        if ([str isEqualToString:username])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"输入用户名已被使用" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
            [alert show];
            accountext.text=@"";
            [accountext becomeFirstResponder];
            flag3=YES;
            return;
        }
        
        
    }
    //把它写入到文件。
    if (flag3==NO)
    {
        [usersinfo setObject:password forKey:username];
        if([usersinfo writeToFile:filepath atomically:YES])
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"友情提示" message:@"恭喜你创建用户成功" delegate:nil cancelButtonTitle:@"知道了！" otherButtonTitles:nil, nil];
            [alert show];
        }
        

    }
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

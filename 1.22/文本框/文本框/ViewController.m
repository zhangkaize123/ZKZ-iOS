//
//  ViewController.m
//  文本框
//
//  Created by 张凯泽 on 15-1-22.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZTextFiled.h"
@interface ViewController ()
{
    ZKZTextFiled*tt;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame=self.view.frame;//获取手机的屏幕
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    lable=[[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-100)/2, 200, 100, 100)];
    lable.backgroundColor=[UIColor greenColor];
    lable.textAlignment=NSTextAlignmentCenter;
    
    tt=[[ZKZTextFiled alloc]initWithFrame:CGRectMake(20, 150, 200, 40)];
    tt.backgroundColor=[UIColor redColor];
    [self.view addSubview:tt];
    NSMutableString *a = [[NSMutableString  alloc] initWithString:@"123456798"];
//a:  123456798
//a:  1love6798
    [a replaceCharactersInRange:NSMakeRange(1, 4) withString:@"love"];
    //NSLog(@" \n a:  %@ \n",a);
    NSMutableString *ss=[[NSMutableString alloc]initWithString:@"12345"];
    for (int i=0; i<ss.length; i++) {
        NSMutableString *str=[[NSMutableString alloc]init];
        NSRange range={i,1};
        [ss replaceCharactersInRange:range withString:@"."];
        
    }
    NSLog(@"______%@",ss);
    
    
    //1.文本框
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    
    text.backgroundColor=[UIColor greenColor];
    [text replaceRange:text.selectedTextRange withText:@"zkz"];
    
    //1.可以给文本框增加一个目标。
    [text addTarget: self action:@selector(colseKeyboard) forControlEvents:UIControlEventEditingDidEnd];
    //text.text=@"你必须看到我 ";
    
//    NSRange cursorPosition = [text selectedRange];
//    NSInteger index = cursorPosition.location;
//    NSMutableString *content = [[NSMutableString alloc] initWithString:textview.text];
//    [content insertString:@"XXXXX" atIndex:index];
//    textview.text = content;

    //文本对其方式
    text.textAlignment=NSTextAlignmentCenter;
//    UIView*vv=[[UIView alloc]initWithFrame:self.view.frame];
//    vv.backgroundColor=[UIColor redColor];
//    tt.inputView=vv;
    
    //设定数字键盘。
    //text.keyboardType=UIKeyboardTypeNumberPad;
    //去掉首字母大写
    text.autocapitalizationType=UITextAutocapitalizationTypeNone;
    //关闭拼写检查
    text.autocorrectionType=UITextAutocorrectionTypeNo;
    //设定return键类型--->完成
    //text.returnKeyType=UIReturnKeyDone;---> UIControlEventEditingDidEndOnExit
    //text.tintColor=[UIColor clearColor];
    
    //密码框
    //text.secureTextEntry=YES;
    //使用代理完成事件。
    text.delegate=self;
    //[text setDelegate:self];
    //获得文件路径
    //提示符
    text.placeholder=@"提示赋";
    

    NSString *path=NSHomeDirectory();
    NSString *file=[path stringByAppendingPathComponent:@"user.plist"];
    BOOL b=[file writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (b)
    {
        //NSLog(@"失败");
    }
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 40)];
    btn.backgroundColor=[UIColor greenColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.view addSubview:text];
    [self.view addSubview:lable];
    }
//-(NSString *)sum:(NSString*)number
//{
//    int sum=0;
//    for (int i=1; i<=[number intValue]; i++)
//    {
//        sum+=i;
//    }
//    return [[NSString alloc]initWithFormat:@"%d",sum];
//}
//1.方法：可以使用目标事件给文本框增加事件
-(void)colseKeyboard
{
    NSLog(@"*************");
         //[text resignFirstResponder];
    
}
//2.方法：使用代理模式
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [text resignFirstResponder];
   
    return NO;
}
//////3.方法：调用行为
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        [text resignFirstResponder];
    //[tt resignFirstResponder];
}

-(void)onLongpress:(UILongPressGestureRecognizer *)recognizer
{
    if (recognizer.state==UIGestureRecognizerStateBegan) {
        NSLog(@"this is begin");
    }
    if (recognizer.state==UIGestureRecognizerStateEnded) {
        NSLog(@"this is ended");
    }

    //recognizer.enabled=NO;
}



//2.输入一个数计算从1到这个数的sum.
-(void)tap:(UIButton*)sender
{
    //1.提出空格。
    //2.验证有效性。
    int sum=0;
    for (int i=1; i<=[text.text intValue]; i++)
    {
        sum+=i;
    }
    NSString *str=[[NSString alloc]initWithFormat:@"%d",sum];
    text.text=str;
    //[lable setText:str];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

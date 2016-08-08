//
//  FindpasswordViewController.m
//  注册和登录
//
//  Created by 张凯泽 on 15-3-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "FindpasswordViewController.h"
#import "ZKZAnswerinfo.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
@interface FindpasswordViewController ()
{
    BOOL isClick;
    UITextField *answerText;
    int count;
}
@property(nonatomic,copy)NSString *saveanswer;
@end

@implementation FindpasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //找回密码问题
    UILabel * questionLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 200, 40)];
    questionLabel.text=@"找回密码问题：";
    questionLabel.font=[UIFont boldSystemFontOfSize:22];
    [self.view addSubview:questionLabel];
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 30, 30)];
    //*************
    btn1.tag=10;
    btn1.backgroundColor=[UIColor redColor];
    [btn1 setImage:[UIImage imageNamed:@"discheck"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(60, 80, 200, 30)];
    ZKZAnswerinfo *info1=self.array[0];
    lable1.text=info1.question;
    lable1.backgroundColor=[UIColor greenColor];
    [self.view addSubview:lable1];
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(20, 120, 30, 30)];
    //***********
    btn2.tag=20;
    [btn2 setImage:[UIImage imageNamed:@"discheck"] forState:UIControlStateNormal];
    btn2.backgroundColor=[UIColor redColor];
    [btn2 addTarget:self action:@selector(selectTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    UILabel *lable2=[[UILabel alloc]initWithFrame:CGRectMake(60, 120, 200, 30)];
    ZKZAnswerinfo *info2=self.array[1];
    lable2.text=info2.question;
    lable2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:lable2];
    
    
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(20, 160, 30, 30)];
    //*********
    btn3.tag=30;
    [btn3 setImage:[UIImage imageNamed:@"discheck"] forState:UIControlStateNormal];
    btn3.backgroundColor=[UIColor redColor];
    [btn3 addTarget:self action:@selector(selectTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    UILabel *lable3=[[UILabel alloc]initWithFrame:CGRectMake(60, 160, 200, 30)];
    ZKZAnswerinfo *info3=self.array[2];
    lable3.text=info3.question;
    lable3.backgroundColor=[UIColor greenColor];
    [self.view addSubview:lable3];
    
    UIButton *btn4=[[UIButton alloc]initWithFrame:CGRectMake(20, 200, 30, 30)];
    //*********
    btn4.tag=40;
    
    [btn4 setImage:[UIImage imageNamed:@"discheck"] forState:UIControlStateNormal];
    btn4.backgroundColor=[UIColor redColor];
    [btn4 addTarget:self action:@selector(selectTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    UILabel *lable4=[[UILabel alloc]initWithFrame:CGRectMake(60, 200, 200, 30)];
    ZKZAnswerinfo *info4=self.array[3];
    lable4.text=info4.question;
    lable4.backgroundColor=[UIColor greenColor];
    [self.view addSubview:lable4];
    //答案输入框
    answerText=[[UITextField alloc]initWithFrame:CGRectMake(20, 240, 200, 30)];
    answerText.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:answerText];
    //确定按钮
    UIButton *okBtn=[[UIButton alloc]initWithFrame:CGRectMake(230, 240, 30, 30)];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    okBtn.titleLabel.font=[UIFont boldSystemFontOfSize:13];
    okBtn.backgroundColor=[UIColor greenColor];
    [okBtn addTarget:self action:@selector(verifyOk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okBtn];
    //return按钮
    UIButton *returnBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 280, 100, 30)];
    [returnBtn setTitle:@"返回" forState:UIControlStateNormal];
    returnBtn.backgroundColor=[UIColor greenColor];
    [returnBtn addTarget:self action:@selector(returnOk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    
}
-(void)selectTap:(UIButton *)sender
{
    
    //点击开始时先把以前的复原；
    for (int i=10; i<=40; i+=10) {
        UIButton *btn=(UIButton *)[self.view viewWithTag:i];
       [btn setImage:[UIImage imageNamed:@"discheck"] forState:UIControlStateNormal];
        
    }
    
    //再执行点击的是哪个按钮；
            [sender setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    if(sender.tag==10){
        ZKZAnswerinfo *info=[self.array objectAtIndex:0];
        _saveanswer=info.answer;
        NSLog(@"_saveanswer=%@",_saveanswer);
    }
    else if(sender.tag==20){
        ZKZAnswerinfo *info=[self.array objectAtIndex:1];
        _saveanswer=info.answer;
        NSLog(@"_saveanswer=%@",_saveanswer);
    }
    else if(sender.tag==30){
        ZKZAnswerinfo *info=[self.array objectAtIndex:2];
        _saveanswer=info.answer;
        NSLog(@"_saveanswer=%@",_saveanswer);
    }
    else if(sender.tag==40){
        ZKZAnswerinfo *info=[self.array objectAtIndex:3];
        _saveanswer=info.answer;
        NSLog(@"_saveanswer=%@",_saveanswer);
    }
    
    
}
//核实答案与问题
-(void)verifyOk
{
    NSString *anwer=answerText.text;
    NSLog(@"anwer=%@",anwer);
    anwer=[anwer trim];
    if ([anwer isEqualToString:_saveanswer]) {
        [ZHQAlert alert:@"恭喜你找回密码"];
        
        
        
    }else{
        [ZHQAlert alert:@"问题与答案不匹配"];
        answerText.text=@"";
        [answerText becomeFirstResponder];
        
    }
}
//返回按钮
-(void)returnOk
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    FMDatabase *db=app.db;
    FMResultSet *set=[db executeQuery:@"select * from t_zkzfmdb where username=?",_sendstr];
    if ([set next]) {
        NSString *password=[set stringForColumnIndex:1];
        [self.delegate passwordViewControllersendValue:password];

    }
    
}
//重写array的set方法
-(void)setArray:(NSArray *)array
{
    _array=array;
    
}
//重写sendstr的set方法
-(void)setSendstr:(NSString *)sendstr
{
    _sendstr=sendstr;
}
@end

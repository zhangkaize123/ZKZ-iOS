//
//  AddViewController.m
//  班级管理
//
//  Created by 张凯泽 on 15-3-26.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AddViewController.h"
#import "ZKZClassInfo.h"
@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addText;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)addTap;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
#pragma mark----重写set方法
-(void)setSenduser:(NSString *)senduser
{
    _senduser=senduser;
}
#pragma mark----添加按钮的行为
- (IBAction)addTap {
    
    NSString *textStr=self.addText.text;
    //对数据进行校验
    //提交数据
    NSString *s=[NSString stringWithFormat:@"http://127.0.0.1/zkz/add_ios.php?userid=%@&classname=%@",self.senduser,textStr];
    NSURL *url=[NSURL URLWithString: s];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
     if([str containsString:@"error"])
    {
        //提示添加错误
        NSLog(@"error-%@-",str);
        //
        
    }
    else{
        
        //提示班级添加成功
        NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"array=%@",array);
        NSDictionary *dic=[array lastObject];
        NSLog(@"dic=%@",dic);
        ZKZClassInfo *info=[[ZKZClassInfo alloc]init];
        info.name=[dic objectForKey:@"name"];
        info.userid=[dic objectForKey:@"userid"];
        info.number=[[dic objectForKey:@"id"]intValue];
        NSLog(@"%@",info);
        [self.delegate sendValueWith:info];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
#pragma mark----推出键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end

//
//  MainViewController.m
//  即时通讯框架
//
//  Created by wyzc on 15-4-8.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "NSString+trim.h"
#import "ZHQAlert.h"
#import "AppDelegate.h"
@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bageValueText;
- (IBAction)clearNumber;

@end

@implementation MainViewController
//select username , count(*) from messages where flag = 0 group by username
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bageValueText.text = self.bageNumber;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(comeMessage:) name:@"MESSAGE" object:nil];
}
-(void)comeMessage:(id)obj
{
    NSLog(@"来内容了！%@",[obj object]);
    self.msgText.text=[NSString stringWithFormat:@"%@%@\r\n",self.msgText.text,[obj object]];
}

- (IBAction)send:(UIButton *)sender {
    NSString * to=self.unameText.text;
    NSString * msg=self.messageText.text;
    to=[to trim];
    msg=[msg trim];
    if([to isEqualToString:@""])
    {
        [ZHQAlert alert:@"用户名不能为空!"];
        self.unameText.text=@"";
        [self.unameText becomeFirstResponder];
        return;
    }
    if([msg isEqualToString:@""])
    {
        [ZHQAlert alert:@"发送内容不能为空!"];
        self.unameText.text=@"";
        [self.unameText becomeFirstResponder];
        return;
    }
    AppDelegate * app=[UIApplication sharedApplication].delegate;
    [app sendMessage:msg withTo:to];
    self.messageText.text = nil;
}

- (IBAction)close:(UIButton *)sender {
    UIActionSheet * sheet=[[UIActionSheet alloc]initWithTitle:@"真的想退出？" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"是" otherButtonTitles:@"否", nil];
    [sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        AppDelegate * app=[UIApplication sharedApplication].delegate;
        [app disconnect];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (IBAction)clearNumber {
    self.bageValueText.text = @"";
}
@end

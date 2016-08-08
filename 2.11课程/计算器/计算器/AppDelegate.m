//
//  AppDelegate.m
//  计算器
//
//  Created by wyzc on 15-1-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface AppDelegate ()

@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *main=[[MainViewController alloc]init];
    self.window.rootViewController=main;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    //改变状态栏 黑底白字
    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

    //计算器上面显示信息的标签
    [self creatLabel];
    [self creatButtons];
    //在这里创记为什么。
    showText=[[NSMutableString alloc]initWithCapacity:20];
    
    return YES;
}
-(void)creatButtons
{
    //第一个按钮左上角的坐标
    float x=1;
    float y=22+HEIGHT/7*2;
    //每个按钮的宽度和高度
    float width=(WIDTH-5)/4;
    float height=(HEIGHT-y-6)/5;
    NSArray * titles=[[NSArray alloc]initWithObjects:
                      @"C",@"+/-",@"%",@"➗",
                      @"7",@"8",@"9",@"X",
                      @"4",@"5",@"6",@"-",
                      @"1",@"2",@"3",@"+",
                      @"0",@"0",@".",@"=",
                      nil];
    NSArray * colors=[[NSArray alloc]initWithObjects:
    [UIColor grayColor],[UIColor grayColor],[UIColor grayColor],[UIColor orangeColor],
    [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
    [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
    [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
    [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],nil];
    SEL sels[]={
        @selector(clearTap),@selector(signTap),@selector(modTap),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(tap:),@selector(zeroTap:),@selector(pointTap),
        @selector(equalTap)
    };
    for(int i=0;i<5;i++)//行
    {
        for(int j=0;j<4;j++)//列
        {
            UIButton * btn=[[UIButton alloc]initWithFrame:CGRectMake(x+(width+1)*j, y+(height+1)*i, width, height)];
            if(j+4*i==17)
            {
                btn.frame=CGRectMake(x, y+(height+1)*i, width*2+1, height);
            }
            [btn setTitle:titles[j+4*i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.backgroundColor=colors[j+4*i];
            [btn addTarget:self action:sels[j+4*i] forControlEvents:UIControlEventTouchUpInside];
            [self.window addSubview:btn];
        }
    }
}
-(void)pointTap//.
{
    if([showText isEqualToString:@""])//第一次就按下.
    {
        [showText appendString:@"0."];
    }
    else if([showText containsString:@"."]==NO)//里面没有点
    {
        [showText appendString:@"."];
    }
    show.text=showText;
}
-(void)equalTap//=
{
    double d=[preString doubleValue];
    double dd=[showText doubleValue];
    if([signString isEqualToString:@"➗"])
    {
        NSLog(@"---%g,%g---",d,dd);
        d=d/dd;
    }
    else if([signString isEqualToString:@"X"])
    {
        d=d*dd;
    }
    else if([signString isEqualToString:@"-"])
    {
        d=d-dd;
    }
    else if([signString isEqualToString:@"+"])
    {
        d=d+dd;
    }
    show.text=[[NSString alloc]initWithFormat:@"%g",d ];
    //得到整个字符串范围
    NSRange range={0,showText.length};
    //删除所有字符
    [showText deleteCharactersInRange:range];
}
-(void)modTap//%      －－－－－－－－－－－－－－－－－－－－－－－－3.
{
    double d=[showText doubleValue]/100;
    show.text=[[NSString alloc]initWithFormat:@"%g",d];
    //得到整个字符串范围
    NSRange range={0,showText.length};
    //删除所有字符
    [showText deleteCharactersInRange:range];
    [showText appendString:[[NSString alloc]initWithFormat:@"%g",d]];
}
-(void)actionTap:(UIButton *)sender//+-*/
{
    //首先保存前面的数
    preString=[showText copy] ;//重点理解－－－－－－－－－－－－－
    //保存符号
    signString=sender.titleLabel.text;
    //得到整个字符串范围
    NSRange range={0,showText.length};
    //删除所有字符
    [showText deleteCharactersInRange:range];
}
-(void)signTap//+/-－－－－－－－－－－－－－－－－－－－－－－－－－2.
{
    
    
    
    //得到整个字符串范围
    NSRange range={0,showText.length};
    //删除所有字符
    [showText deleteCharactersInRange:range];
    [showText appendString:show.text];//为什么这么做呀－－－－－》《－－－－
    
    
    
    
    
    //是0
    if([showText isEqualToString:@""])
    {
        return;
    }
    if([showText hasPrefix:@"-"])//如果以负号开头
    {
        NSRange r={0,1};
        [showText deleteCharactersInRange:r];//删除第一个字符
    }
    else
    {
        [showText insertString:@"-" atIndex:0];//加上负号
    }
    show.text=showText;//显示信息
}
-(void)clearTap//C1.－－－－－－－－－－－－－－
{
    //得到整个字符串范围
    NSRange range={0,showText.length};//相当与自己里边的showstring
    //删除所有字符
    [showText deleteCharactersInRange:range];
    //显示0
    show.text=@"0";
}
-(void)numberTap:(UIButton *)sender//123456789-----------
{
    //字符串长度不能超过10个数字
    if(showText.length>9)
    {
        return;
    }
    //把单击按钮上的文本加到显示字符串后面
    [showText appendString:sender.titleLabel.text];
    //显示出来
    show.text=showText;
}
-(void)zeroTap:(UIButton *)sender//0------------
{
    //第一次就单击了0这个数字键
    if([showText isEqualToString:@""])
    {
        return;
    }
    //按普通数字键处理
    [self numberTap:sender];
}
-(void)tap:(UIButton *)sender
{
    NSLog(@"你单击%@按钮！",sender.titleLabel.text);
}
-(void)creatLabel
{
    CGRect rect;
    //左上角坐标
    rect.origin.x=2;
    rect.origin.y=22;
    //宽度和高度
    rect.size.width=WIDTH-4;
    rect.size.height=HEIGHT/7*2;
    show=[[UILabel alloc]initWithFrame:rect];
    //show.backgroundColor=[UIColor blueColor];
    show.text=@"0";
    show.font=[UIFont systemFontOfSize:30];
    show.textAlignment=NSTextAlignmentRight;
    show.textColor=[UIColor whiteColor];
    [self.window addSubview:show];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

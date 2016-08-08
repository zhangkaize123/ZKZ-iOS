//
//  AppDelegate.m
//  计算器1.24
//
//  Created by 张凯泽 on 15-1-24.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建lable
    self.window.backgroundColor=[UIColor blackColor];
    
    height=self.window.frame.size.height;
    width=self.window.frame.size.width;
    [self creatlable];
    [self creatbutton];
    [self.window makeKeyAndVisible];
    
        NSLog(@"  -----%@",showstring);
    
    // Override point for customization after application launch.
    return YES;
}

-(void)creatlable
{
    lable=[[UILabel alloc]initWithFrame:CGRectMake(1, 20, width-2, (height)/7*2)];
    lable.backgroundColor=[UIColor blackColor];
    lable.text=@"0";
    lable.textColor=[UIColor whiteColor];
    lable.font=[UIFont systemFontOfSize:30];
    lable.textAlignment=NSTextAlignmentRight;
    [self.window addSubview:lable];
}


-(void)creatbutton
{
    showstring=[[NSMutableString alloc]initWithCapacity:20];
    //在button里边初始化这个showstring这个字符串就可以连续的加数，在numbertag:里边初始化为什么就不能加数。－－－－－－》星期一问老师－－－－－《
    
        NSArray * titles=[[NSArray alloc]initWithObjects:
                      @"C",@"+/-",@"%",@"➗",
                      @"7",@"8",@"9",@"X",
                      @"4",@"5",@"6",@"-",
                      @"1",@"2",@"3",@"+",
                      @"0",@"0",@".",@"=",
                      nil];
    SEL sels[]={
        @selector(clearTap),@selector(signTap),@selector(modTap),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),@selector(tap:),
        @selector(zeroTap:),@selector(pointTap),
        @selector(equalTap)
    };

    float x=1;
    float y=20+height/7*2;
    float w=(width-5)/4;
    float h=(height-y-6)/5;
    for (int j=0; j<5; j++)//竖向
    {
        
        for (int i=0; i<4; i++)//横向的按钮
        {
            
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(x+w*i+i, y+h*j+j, w, h)];
            
            button.backgroundColor=[UIColor lightGrayColor];
            button.showsTouchWhenHighlighted=YES;
            [button setTitle:titles[i+4*j] forState:UIControlStateNormal];
            [button addTarget:self action:sels[i+4*j] forControlEvents:UIControlEventTouchUpInside];
            if(i+4*j==17)//后边覆盖前边的。j等于4-－－》列i---》等于1
            {
                button.frame=CGRectMake(x, y+(h+1)*j, w*2+1, h);
            }
            
            if (i==3)
            {
                button.backgroundColor=[UIColor orangeColor];
            }
            if (j==0&&i!=3)
            {
                button.backgroundColor=[UIColor grayColor];
            }
            button.layer.cornerRadius=h/4;
            [self.window addSubview:button];
        }
        
    }
    
}
-(void)clearTap//清除键--->C－－－－－－－－－－－－－－－－－4
{
    NSRange range={0,showstring.length};//相当与自己里边的showstring
    //删除所有字符
    [showstring deleteCharactersInRange:range];
    //显示0

    lable.text=@"0";
//    NSRange range=[showstring rangeOfString:showstring];//自己这样做有问题。－－－－－－－－－－－－－－－－－－－－－
//    [showstring deleteCharactersInRange:range];
    
}
-(void)signTap//正负号-－－－－－－－－－－－－－－－－－－－－－5
{
    if ([showstring isEqualToString:@""])
    {
        //lable.text=showstring;
        return;//--------老师加的return
    }
    else{
        NSRange range={0,1};
        NSString *str=[showstring substringWithRange:range];
        
        if ([str isEqualToString:@"-"])
        {
            //[showstring appendString:@"-"];
            [showstring deleteCharactersInRange:range];
            lable.text=showstring;
        }
        else
        {
            //[showstring appendString:@"-"];
            [showstring insertString:@"-" atIndex:0];
            lable.text=showstring;
        }
    }
    
    
}
-(void)modTap//初100；
{
    float aMod=[showstring floatValue];
    aMod=aMod/100;
    NSRange range=[showstring rangeOfString:showstring];
    [showstring deleteCharactersInRange:range];
    [showstring appendFormat:@"%g",aMod];
    lable.text=showstring;
    
}

-(void)actionTap:(UIButton*)sender//加减乘除
{
    
    lable.text=showstring;
    sign=[[NSString alloc]initWithFormat:@"%@",sender.titleLabel.text];
    one=[showstring floatValue];
    //老师作法是建立一个字符串的全局变量 用  [showstring copy]
    NSRange range=[showstring rangeOfString:showstring];
    [showstring deleteCharactersInRange:range];
    
    
}
-(void)equalTap//等于号
{
    if ([sign isEqualToString:@"+"])
    {
        
        float b=[lable.text floatValue];
        //one+b
        NSString *str=[[NSString alloc]initWithFormat:@"%g",one+b];
        lable.text=str;
        NSRange range=[showstring rangeOfString:showstring];
        [showstring deleteCharactersInRange:range];
        [showstring appendString:str];
        
    }
    
    
}

-(void)numberTap:(UIButton *)sender//数字键。
{
    
    
    //0后边不能加数字。------>和数字前边不能加0，要两个方面一起考虑。
//    if ([showstring isEqualToString:@"0"])
//    {
//        return;
//    }
    if(showstring.length>9)
    {
        return;
    }
    [showstring appendString:sender.titleLabel.text];
    //NSLog(@"%@",showstring);
    lable.text=showstring;
    
    
}
-(void)zeroTap:(UIButton *)sender//数字0
{
    //0后边不能加数字。------>和数字前边不能加0，要两个方面一起考虑。
    
//        [showstring appendString:sender.titleLabel.text];
//    lable.text=showstring;
    
    
    //第一次就单击了0这个数字键
    if([showstring isEqualToString:@""])
    {
        return;
    }
    //按普通数字键处理
    [self numberTap:sender];//没有想到  很有用重点看－－－－－－－－－－
//这里的sender是0
}
-(void)pointTap//小数点
{
    

    if ([showstring isEqualToString:@""])
    {
        [showstring appendString:@"0."];
        //lable.text=showstring;
    }
    if ([showstring rangeOfString:@"."].location==NSNotFound)
    {
        [showstring appendString:@"."];
        
        //NSLog(@"这是点");
        
    }
    //[showstring appendString:@"."];
    lable.text=showstring;
    
    
    
}
-(void)tap:(UIButton*)sender//原来的0键。
{
    
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

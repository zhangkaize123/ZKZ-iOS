//
//  MainViewController.m
//  计算器
//
//  Created by 张凯泽 on 15-2-11.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MainViewController ()
{
    NSArray * titles;
    NSArray * colors;
    SEL sels[]={
        @selector(clearTap),@selector(signTap),@selector(modTap),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(numberTap:),@selector(numberTap:),@selector(numberTap:),@selector(actionTap:),
        @selector(tap:),@selector(zeroTap:),@selector(pointTap),
        @selector(equalTap)
    };

    
}
@end

@implementation MainViewController
-(void)dictchange
{
    UIDeviceOrientation dict=[[UIDevice currentDevice]orientation];
    if (dict==1)
    {
        [v2 removeFromSuperview];
        [v3 removeFromSuperview];
        v1=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v1];
        CGRect rect;
        //左上角坐标
        rect.origin.x=2;
        rect.origin.y=22;
        //宽度和高度
        rect.size.width=WIDTH-4;
        rect.size.height=HEIGHT/7*2;
        UILabel * show=[[UILabel alloc]initWithFrame:rect];
        //show.backgroundColor=[UIColor blueColor];
        show.text=@"0";
        show.font=[UIFont systemFontOfSize:30];
        show.textAlignment=NSTextAlignmentRight;
        show.textColor=[UIColor whiteColor];
        [v1 addSubview:show];
        float x=1;
        float y=22+HEIGHT/7*2;
        //每个按钮的宽度和高度
        float width=(WIDTH-5)/4;
        float height=(HEIGHT-y-6)/5;

        
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
//                [btn addTarget:self action:sels[j+4*i] forControlEvents:UIControlEventTouchUpInside];
                [v1 addSubview:btn];
            }
        }

        
    }
    
    else if (dict==3)
    
    {
        [v1 removeFromSuperview];
        [v3 removeFromSuperview];
        v2=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v2];
        
        CGRect rect;
        //左上角坐标
        rect.origin.x=2;
        rect.origin.y=22;
        //宽度和高度
        rect.size.width=self.view.frame.size.width-4;
        rect.size.height=self.view.frame.size.height/7*2;
        UILabel * show=[[UILabel alloc]init];
        show.text=@"0";
        show.font=[UIFont systemFontOfSize:30];
        show.textAlignment=NSTextAlignmentRight;
        show.textColor=[UIColor whiteColor];
        [show setFrame:CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2)];
        [v1 addSubview:show];
        float x=1;
        float y=22+self.view.frame.size.height/7*2;
        //每个按钮的宽度和高度
        float width=(self.view.frame.size.width-5)/4;
        float height=(self.view.frame.size.height-y-6)/5;
        
        
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
                //                [btn addTarget:self action:sels[j+4*i] forControlEvents:UIControlEventTouchUpInside];
                [v1 addSubview:btn];
            }
        }

        
        
        
        
    }
    else if (dict==4)
    {
        [v2 removeFromSuperview];
        [v1 removeFromSuperview];
        v3=[[UIView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:v3];

        CGRect rect;
        //左上角坐标
        rect.origin.x=2;
        rect.origin.y=22;
        //宽度和高度
        rect.size.width=self.view.frame.size.width-4;
        rect.size.height=self.view.frame.size.height/7*2;
        UILabel * show=[[UILabel alloc]init];
        //show.backgroundColor=[UIColor blueColor];
        show.text=@"0";
        show.font=[UIFont systemFontOfSize:30];
        show.textAlignment=NSTextAlignmentRight;
        show.textColor=[UIColor whiteColor];
        [show setFrame:CGRectMake(1, 22, self.view.frame.size.width-2, self.view.frame.size.height/7*2)];
        [v1 addSubview:show];
        float x=1;
        float y=22+self.view.frame.size.height/7*2;
        //每个按钮的宽度和高度
        float width=(self.view.frame.size.width-5)/4;
        float height=(self.view.frame.size.height-y-6)/5;
        
        
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
                //                [btn addTarget:self action:sels[j+4*i] forControlEvents:UIControlEventTouchUpInside];
                [v1 addSubview:btn];
            }
        }

    }
    
}
- (void)viewDidLoad
{
     titles=[[NSArray alloc]initWithObjects:
                      @"C",@"+/-",@"%",@"➗",
                      @"7",@"8",@"9",@"X",
                      @"4",@"5",@"6",@"-",
                      @"1",@"2",@"3",@"+",
                      @"0",@"0",@".",@"=",
                      nil];
     colors=[[NSArray alloc]initWithObjects:
                      [UIColor grayColor],[UIColor grayColor],[UIColor grayColor],[UIColor orangeColor],
                      [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
                      [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
                      [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],
                      [UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor lightGrayColor],[UIColor orangeColor],nil];
  
    [super viewDidLoad];
    

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dictchange) name:UIDeviceOrientationDidChangeNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

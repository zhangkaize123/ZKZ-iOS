//
//  MainViewController.m
//  练习题2
//
//  Created by 张凯泽 on 15-1-21.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    CGRect fame=self.view.frame;
    
//        b1=[[UIButton alloc]initWithFrame:CGRectMake((fame.size.width-100)/2, 20, 100, 50)];
    b1=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2,20,100,50)];

    //[b1 setFrame:CGRectMake((self.view.frame.size.width-100)/2,20,100,50)];
    b1.backgroundColor=[UIColor grayColor];
    [b1 setTitle:@"看见我了" forState:UIControlStateNormal];
    [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:b1];
    b2=[[UIButton alloc]initWithFrame:CGRectMake((fame.size.width-200)/2, 100, 200, 50)];
    b2.backgroundColor=[UIColor greenColor];
    [b2 setTitle:@"显示" forState:UIControlStateNormal];
    [b2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    
    UIButton *b3=[[UIButton alloc]initWithFrame:CGRectMake((fame.size.width-200)/2, 180, 55, 55)];
    b3.backgroundColor=[UIColor greenColor];
    //[b3 setTitle:@"显示" forState:UIControlStateNormal];
    //[b3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [b3 setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
    b3.layer.cornerRadius=55/4;
    [b3 addTarget:self action:@selector(actionimage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b3];
    
    
}

-(void)actionimage:(UIButton *)sender
{
   
    if (flag)
    {
        
        [sender setImage:[UIImage imageNamed:@"discheck.png"] forState:UIControlStateNormal];
        sender.layer.cornerRadius=55/4;
        flag=NO;
    }
    else
    {
        [sender setImage:[UIImage imageNamed:@"check.png"] forState:UIControlStateNormal];
        sender.layer.cornerRadius=55/4;
        flag=YES;
    }
    
}


//奔跑的按钮
-(void)tap:(UIButton*)sender
{
    static BOOL dict=YES;
    CGRect rect=b1.frame;//可以把CGRect设为变量
    if (dict)
    {
        rect.origin.x=rect.origin.x+5;
        b1.frame=rect;
        if (rect.origin.x>(self.view.frame.size.width-rect.size.width))
        {
            dict=NO;
        }
    }
    else
    {
        rect.origin.x=b1.frame.origin.x-5;
        b1.frame=rect;
        if (rect.origin.x<self.view.frame.origin.x)
        {
            dict=YES;
        }
    }
    NSLog(@"%d",dict);
   
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

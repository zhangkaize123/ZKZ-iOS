//
//  MainViewController.m
//  练习题
//
//  Created by 张凯泽 on 15-1-21.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGRect frame=self.view.frame;
    btn1=[[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-100)/2, 20, 100, 50)];
    [btn1 setBackgroundColor:[UIColor redColor]];
    [btn1 setTitle:@"看见我了" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    //[btn1 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    btn2=[[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-200)/2, 100, 55, 55)];
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 setTitle:@"隐藏" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    btn2 .showsTouchWhenHighlighted=YES;//按钮点亮。
    //btn2.layer.cornerRadius=55/2;//倒角。
    btn2.layer.cornerRadius=55/4;
    
    [self.view addSubview:btn2];
    

}
-(void)action2:(UIButton*)sender
{
//    static BOOL flag;//no
//    if (flag)//if只执行正确的逻辑
//    {
//        btn1.hidden=NO;
//        [btn2 setTitle:@"隐藏" forState:UIControlStateNormal];
//        flag=NO;
//        
//        
//    }
//    else
//    {
//        btn1.hidden=YES;
//        [btn2 setTitle:@"显示" forState:UIControlStateNormal];
//        flag=YES;
//    }
    
    
    
    if (btn1.hidden)
    {
        btn1.hidden=NO;
        [btn2 setTitle:@"隐藏" forState:UIControlStateNormal];

        
    }
    
    else
    {
        btn1.hidden=YES;
        [btn2 setTitle:@"显示" forState:UIControlStateNormal];
        
    }
    
    
    
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

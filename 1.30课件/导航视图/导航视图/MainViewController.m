//
//  MainViewController.m
//  导航视图
//
//  Created by 张凯泽 on 15-1-30.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    /*
     ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
     对于使用导航栏切换视图是再appdelegate中设为主控制器的只执行一次viewDidLoad
     而其他视图在呈现后再次出现时需要重新加载viewDidLoad。
     ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
     
     
     
     
     */
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"main";//显示在导航栏的文字
    
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"1",@"2",@"3", nil]];
    seg.frame=CGRectMake(0, 64, 200, 40);
    [self.view addSubview:seg];
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 150, 200, 40)];
    text.backgroundColor=[UIColor orangeColor];
    text.returnKeyType=UIReturnKeyGo;
    
    //main--->other
    text.text=self.sendother;
    
    text.enabled=NO;
    //[text addTarget:self action:@selector(passtring:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:text];
    
    
    
    // 编辑按钮
    rightbutton=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(oktage:)];
    self.navigationItem.rightBarButtonItem=rightbutton;
    [super viewDidLoad];
    NSLog(@"已经加载完成");
    // Do any additional setup after loading the view.
}
-(void)oktage:(UIBarButtonItem*)sender
{
    NSString *str=sender.title;
    if ([str isEqualToString:@"编辑"])
    {
        text.enabled=YES;
        sender.title=@"完成";
    }
    else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    //other-->main
    self.main.update=text.text;
    NSLog(@"将要消失");
}
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"将要出现");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"已经出现");
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    NSLog(@"将要消失");
//}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"已经消失");
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

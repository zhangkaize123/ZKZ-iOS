//
//  MainViewController.m
//  视图
//
//  Created by 张凯泽 on 15-1-21.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
-(void)loadView//加载视图
{
    
    /*
     当调用ViewCotroller时它会问有没有view视图没有的话就会叫用loadView ，接下来就会问：是自己创建还是 通过故事版创建，如果是自己创建那就是    UIView *v=[UIView alloc]initWithFrame:<#(CGRect)#>
     如果是通过故事版里边有没有，如果有就提出来，没有就创建一个空的view。
     
     */
    [super loadView];//必须调用一下fu
}
-(void)viewWillAppear:(BOOL)animated
{

    //视图将要出现
}

-(void)viewDidAppear:(BOOL)animated
{
    //视图已经出现
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"将要消失");
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"已经消失");
}
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"将要转屏");
}




- (void)viewDidLoad {//视图加载完成。
    
    /*在执行这些事件时为什么总是调用[super viewDidLoad] 因为他要去承接父类里边的一些视图。
     
     */
    [super viewDidLoad];//
    //1.
    CGRect fame=self.view.frame;
    lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, fame.size.width-40, 20)];
    [lable setBackgroundColor:[UIColor redColor]];
    lable.text=@"";
    //视图的背景颜色。
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:lable];
    UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake((fame.size.width-200)/2, 80, 200, 40)];
    button.backgroundColor=[UIColor greenColor];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    //2.
    button.enabled=NO;//不接受事件, 当点击按钮时
    
}
-(void)action:(UIButton*)sender
{
    //3.
    lable.hidden=YES;//程序到这里后隐藏lable控件
    
}

- (void)didReceiveMemoryWarning {//接受到内存警告
    [super didReceiveMemoryWarning];
    }
/*
 当出现内存警告时，就会调用willunload 方法和didunload方法在这里边就会把rootview release掉，同时在这里应把这个类的属性设置为nil,不是全局的view，在执行此方法rootrelease掉后会自动把不是全局的viewrelease一次。
 
 
 */








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

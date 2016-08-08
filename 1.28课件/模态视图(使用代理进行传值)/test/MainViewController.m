//
//  MainViewController.m
//  test
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"
#import "OtherViewController.h"
@interface MainViewController ()<ZKZOtherdelegate>

@end

@implementation MainViewController
/*
 。。。。。。。。。。。。。。。。。。。。。
 对于主视图器上的view只加载一次，它消失后在内存中还是存在的
 
 
 
 
 */
- (void)viewDidLoad
{
    NSLog(@"main已经加载完成。。。。。");
    self.view.backgroundColor=[UIColor whiteColor];
    
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    text.backgroundColor=[UIColor grayColor];
    text.placeholder=@"输入";
    [self.view addSubview:text];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 40)];
    button.backgroundColor=[UIColor greenColor];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"显示" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [super viewDidLoad];
    
}
-(void)showTag:(UIButton *)sender//
{
   // NSLog(@"sdfsaf");
    OtherViewController *other=[[OtherViewController alloc]init];
    //转场样式
    [other setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    other.delegate=self;
    //main---->other
    other.sendstring=text.text;
    [self presentViewController:other animated:YES completion:nil];
    
}
/**代理方法*/
-(void)otherpresentValue:(NSString *)string
{
    self.str=string;
    NSLog(@"string=-------%@",string);
}
-(void)viewWillAppear:(BOOL)animated
{
    text.text=self.str;
    NSLog(@"%@",self.str);
    NSLog(@"main将要出现");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"main已经出现");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"main将要消失");
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"main已经消失");
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

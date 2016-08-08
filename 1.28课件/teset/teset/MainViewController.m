//
//  MainViewController.m
//  teset
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    
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
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setString:(NSString *)string
{
    text.text=string;
    NSLog(@"%@",text.text);
}

-(void)showTag:(UIButton*)sender
{
    
    OtherViewController *other=[[OtherViewController alloc]init];
    //样式
    [other setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    other.str=text.text;
    //other.main=self;
    other.delegate=self;
    [self presentViewController:other animated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    
    //text.text=self.mainstring;
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

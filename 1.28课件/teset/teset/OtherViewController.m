//
//  OtherViewController.m
//  teset
//
//  Created by 张凯泽 on 15-1-28.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "OtherViewController.h"
//#import "MainViewController.h"
@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad
{
    self.view.backgroundColor=[UIColor brownColor];
    
    text=[[UITextField alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    text.backgroundColor=[UIColor grayColor];
    text.placeholder=@"输入";
    //main--->other
    text.text=self.str;
    [self.view addSubview:text];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20, 80, 200, 40)];
    button.backgroundColor=[UIColor greenColor];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"消失" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dissTag:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)dissTag:(UIButton*)sender
{
    //self.main.mainstring=text.text;
    
    [self.delegate setString:text.text];
    
    NSLog(@".....%@",text.text);
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
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

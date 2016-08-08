//
//  MainViewController.m
//  自动布局代码2
//
//  Created by 张凯泽 on 15-2-12.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    /*
     自动布局注意事项：1.给谁添加约束，必须关闭该控件的自动转换到约束未NO;
     2.再添加约束时右（right）和底（buttom）为负值。
     3.//先把控件放到视图上去，才能做约束。
     
     */
    self.view.backgroundColor=[UIColor whiteColor];
    [super viewDidLoad];
    
    
    //左上lable
    UILabel *lable1=[[UILabel alloc]init];
    lable1.backgroundColor=[UIColor greenColor];
    lable1.text=@"左上";
    //该控件的自动转换到约束为NO
    lable1.translatesAutoresizingMaskIntoConstraints=NO;
    //先把控件放到视图上去，才能做约束。
    [self.view addSubview:lable1];
    //设置宽度
    NSLayoutConstraint *c11=[NSLayoutConstraint constraintWithItem:lable1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
    //设置高度
    c11=[NSLayoutConstraint constraintWithItem:lable1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
//设置离上边的距离
    c11=[NSLayoutConstraint constraintWithItem:lable1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:c11];
    //设置离左边的距离
    c11=[NSLayoutConstraint constraintWithItem:lable1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
    [self.view addConstraint:c11];
    //设置右上
    UILabel *lable2=[[UILabel alloc]init];

    lable2.backgroundColor=[UIColor grayColor];
    lable2.translatesAutoresizingMaskIntoConstraints=NO;
    lable2.text=@"右上";
    
    [self.view addSubview:lable2];
    
    c11=[NSLayoutConstraint constraintWithItem:lable2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    [self.view addConstraint:c11];
   c11=[NSLayoutConstraint constraintWithItem:lable2 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
    [self.view addConstraint:c11];
    
    
    //中左
    UILabel *lable3=[[UILabel alloc]init];
    lable3.text=@"中左";
    lable3.backgroundColor=[UIColor redColor];
    lable3.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lable3];
    
    NSLayoutConstraint *c21=[NSLayoutConstraint constraintWithItem:lable3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    NSLayoutConstraint *c22=[NSLayoutConstraint constraintWithItem:lable3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    [self.view addConstraint:c21];
    [self.view addConstraint:c22];
    //水平
    c11=[NSLayoutConstraint constraintWithItem:lable3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraint:c11];
   c11=[NSLayoutConstraint constraintWithItem:lable3 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
    
    [self.view addConstraint:c11];
    
    UILabel *lable4=[[UILabel alloc]init];
    lable4.text=@"中右";
    lable4.backgroundColor=[UIColor redColor];
    lable4.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lable4];
    c11=[NSLayoutConstraint constraintWithItem:lable4 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    
    [self.view addConstraint:c11];
    
    c11=[NSLayoutConstraint constraintWithItem:lable4 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable4 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
    [self.view addConstraint:c11];
    
    //下左
    UILabel *lable5=[[UILabel alloc]init];
    lable5.text=@"下左";
    lable5.backgroundColor=[UIColor redColor];
    lable5.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lable5];
    
   c11=[NSLayoutConstraint constraintWithItem:lable5 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
   c11=[NSLayoutConstraint constraintWithItem:lable5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable5 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
    
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable5 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    [self.view addConstraint:c11];
    
    //下右
    UILabel *lable6=[[UILabel alloc]init];
    lable6.text=@"下右";
    lable6.backgroundColor=[UIColor redColor];
    lable6.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lable6];
    
    c11=[NSLayoutConstraint constraintWithItem:lable6 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    [self.view addConstraint:c11];
   c11=[NSLayoutConstraint constraintWithItem:lable6 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    
    [self.view addConstraint:c11];
    c11=[NSLayoutConstraint constraintWithItem:lable6 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
    
    [self.view addConstraint:c11];
   c11=[NSLayoutConstraint constraintWithItem:lable6 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    [self.view addConstraint:c11];

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

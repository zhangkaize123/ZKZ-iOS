//
//  ViewController.m
//  按钮的selected属性测试
//
//  Created by 张凯泽 on 15-4-7.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property(nonatomic,weak)UIButton *selectedBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.b1 addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
    [self.b2 addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
    [self.b3 addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
    [self.b4 addTarget:self action:@selector(oktap:) forControlEvents:UIControlEventTouchUpInside];
    [self oktap:self.b1];
}

-(void)oktap:(UIButton *)button
{
    self.selectedBtn.selected=NO;
    button.selected=YES;
    self.selectedBtn=button;
    
    
}

@end

//
//  ViewController.m
//  块_应用
//
//  Created by 张凯泽 on 15-3-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
      块可以访问外边的值的，但是不能改变它，如果想改变必须：__block 来修饰它；
     */
    __block int a=8;//用__block来修饰才能在块中才能改变。
    int n;
    void (^ myblock)(void)=^{
        
        //int n;
        NSLog(@"n=%d",n);//块访问外边的值时如果不加__block，外边的值必须要副初值,而且是不能改变外边的这个值。
        
        NSLog(@"a=%d",a--);
        NSLog(@"a=%d",a--);
        
    };
    
    
    myblock();
}


@end

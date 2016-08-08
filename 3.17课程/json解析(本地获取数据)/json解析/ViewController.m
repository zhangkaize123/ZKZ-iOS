//
//  ViewController.m
//  json解析
//
//  Created by 张凯泽 on 15-3-17.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * path=[[NSBundle mainBundle]pathForResource:@"Json" ofType:@"geojson"];
    NSData * data=[NSData dataWithContentsOfFile:path];
    NSArray * studens=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (studens) {
        for (NSDictionary *dic in studens) {
            NSLog(@"name=%@,age=%@",[dic objectForKey:@"name"],[dic objectForKey:@"age"]);
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

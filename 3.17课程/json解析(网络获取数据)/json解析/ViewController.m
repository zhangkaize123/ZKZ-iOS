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
    NSURL *url=[NSURL URLWithString:@"http://localhost/web/d.php"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
    NSLog(@"********************");
    NSDictionary *root=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    //NSArray *array = [root allKeys];
    NSDictionary *dic=[root objectForKey:@"data"];
    NSArray *array=[dic allKeys];
    for (NSString *str in array) {
        NSLog(@"%@",[dic objectForKey:str]);
    }
    
}


@end

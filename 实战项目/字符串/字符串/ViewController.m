//
//  ViewController.m
//  字符串
//
//  Created by 张凯泽 on 15-4-22.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=@"*****A*B*CD****";
    NSRange range=[str rangeOfString:@"A*B*CD"];
    NSString *s=[str substringWithRange:range];
//    NSString *s=[str substringFromIndex:range.location];
  NSLog(@"s=%@",s);
//    NSString *ss=[s substringToIndex:<#(NSUInteger)#>]
}


@end

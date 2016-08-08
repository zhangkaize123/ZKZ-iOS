//
//  TwoViewController.m
//  我赢新闻
//
//  Created by wyzc on 15/4/13.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated
{
    NSString * str=[NSString stringWithFormat:@"%@getorders.php",[ZHQUtil hostname]];
    [self loadDataWithNetworkWithString:str];
}
@end

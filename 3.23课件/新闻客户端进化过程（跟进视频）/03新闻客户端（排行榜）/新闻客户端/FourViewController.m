//
//  FourViewController.m
//  新闻客户端
//
//  Created by 张凯泽 on 15-3-25.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "FourViewController.h"
#import "FMDatabase.h"
@interface FourViewController ()
@property(nonatomic,strong)NSMutableArray *allnews;
@end

@implementation FourViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
   // self.allnews=[NSMutableArray array];
    self.navigationItem.title=@"收藏";
    
}
@end

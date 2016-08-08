//
//  ViewController.m
//  test
//
//  Created by 张凯泽 on 15-4-17.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "ZKZApplication.h"
#import "ZKZTopic.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    //拿到access_token
    //http://iappfree.candou.com:8080/free/special?page=%d&limit=5
    params[@"limit"]=@5;
    params[@"page"]=@1;
    [mgr GET:@"http://iappfree.candou.com:8080/free/special" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"成功————%@",responseObject );
        NSArray *statusArray=[ZKZTopic objectArrayWithKeyValuesArray:responseObject];
        for (ZKZTopic *t in statusArray) {
            NSLog(@"%@",[t.applications.lastObject class]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败————%@",error);

    }];
}

@end

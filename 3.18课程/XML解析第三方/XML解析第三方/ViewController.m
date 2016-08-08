//
//  ViewController.m
//  XML解析第三方
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "ZKZStudent.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    students=[NSMutableArray array];
    NSURL *url=[NSURL URLWithString:@"http://192.168.1.219/web/xml.xml"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    if (data) {
        GDataXMLDocument *document=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        
        NSArray *arr=document.rootElement.children;
        NSLog(@"arr=%@",arr);
        for (GDataXMLElement *element in arr) {
            ZKZStudent *student=[[ZKZStudent alloc]init];
            [student setValue:[element attributeForName:@"name"].stringValue forKey:@"name"];
            [student setValue:[element attributeForName:@"age"].stringValue forKey:@"age"];
           
            [students addObject:student];
        }
        
        for (ZKZStudent *s in students) {
            NSLog(@"name=%@,age=%@",s.name,s.age);
        }
        
    }
    
}


@end

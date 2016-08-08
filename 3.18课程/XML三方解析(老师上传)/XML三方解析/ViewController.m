//
//  ViewController.m
//  XML三方解析
//
//  Created by wyzc on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "ZHQStudent.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students=[[NSMutableArray alloc]init];
    NSURL * url=[NSURL URLWithString:@"http://localhost/web/xml.xml"];
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data)
    {
        GDataXMLDocument * document=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        if(document==nil)
        {
            NSLog(@"error!");
        }
        NSArray * arr=document.rootElement.children;
        for(GDataXMLElement * element in arr)
        {
            ZHQStudent * student=[[ZHQStudent alloc]init];
            [student setValue:[element attributeForName:@"name"].stringValue forKey:@"name"];
            [student setValue:[element attributeForName:@"age"].stringValue forKey:@"age"];
            [self.students addObject:student];
        }
        for(ZHQStudent * s in self.students)
        {
            NSLog(@"name=%@,age=%@",s.name,s.age);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

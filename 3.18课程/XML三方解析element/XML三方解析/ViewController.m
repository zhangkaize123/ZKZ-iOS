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
#import "ZHQTeacher.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students=[[NSMutableArray alloc]init];
    self.teachers=[[NSMutableArray alloc]init];
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
            NSArray * students=element.children;
            for(GDataXMLElement * e in students)
            {
                //创建一个学生或教师
                ZHQStudent * student=[[ZHQStudent alloc]init];
                ZHQTeacher * teacher=[[ZHQTeacher alloc]init];
                NSArray * sPropertys=e.children;
                for(GDataXMLElement * ee in sPropertys)
                {
                    //对学生或教师赋值
                    if([e.name isEqualToString:@"student"])
                    {
                        [student setValue:ee.stringValue forKey:ee.name];
                    }
                    else if([e.name isEqualToString:@"teacher"])
                    {
                        [teacher setValue:ee.stringValue forKey:ee.name];
                    }
                }
                //把学生或教师放到数组
                if([e.name isEqualToString:@"student"])
                {
                    [self.students addObject:student];
                }
                else if([e.name isEqualToString:@"teacher"])
                {
                    [self.teachers addObject:teacher];
                }
            }
        }
        for(ZHQStudent * t in self.students)
        {
            NSLog(@"student's name=%@,age=%@",t.name,t.age);
        }
        for(ZHQTeacher * t in self.teachers)
        {
            NSLog(@"teacher's name=%@,age=%@",t.name,t.age);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

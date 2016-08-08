//
//  ViewController.m
//  xml解析（第三方 element ）
//
//  Created by 张凯泽 on 15-3-19.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "ZKZStudent.h"
#import "ZKZTeacher.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *students;
@property(nonatomic,strong)NSMutableArray *teachers;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.students=[NSMutableArray array];
    self.teachers=[NSMutableArray array];
    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:@"http://localhost/web/xml3.19.xml"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //NSLog(@"%@",data);
    if (data) {
        GDataXMLDocument *document=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        
        NSArray *elements=document.rootElement.children;
       //students -----teachers
        for (GDataXMLElement *e in elements)
        {
            
            NSArray *arr=e.children;
            //student -----teacher
            for (GDataXMLElement *ee in arr)
            {
                
            //student
            if ([ee.name isEqualToString:@"student"]) {
                
                ZKZStudent *student=[[ZKZStudent alloc]init];
                
                NSArray *arr1=ee.children;
                for (GDataXMLElement *eee in arr1) {
                    [student setValue:eee.stringValue forKey:eee.name];
                }
                [self.students addObject:student];
            }
                //teacher
            if ([ee.name isEqualToString:@"teacher"]) {
                ZKZTeacher *teacher=[[ZKZTeacher alloc]init];
                NSArray *arr2=ee.children;
                for (GDataXMLElement *eee in arr2) {
                    [teacher setValue:eee.stringValue forKey:eee.name];
                }
                [self.teachers addObject:teacher];
                NSLog(@"%@",self.teachers);
            }
                
            }
        }
        
        
        
        for (ZKZStudent *s in self.students) {
            NSLog(@"%@",s);
        }
        for (ZKZTeacher *t in self.teachers) {
            NSLog(@"%@",t);
        }
        
        
    }
}


@end

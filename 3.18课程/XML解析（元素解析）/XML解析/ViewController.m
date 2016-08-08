//
//  ViewController.m
//  XML解析
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZStudent.h"
@interface ViewController ()<NSXMLParserDelegate>
{
    NSMutableArray *array;
    ZKZStudent *student;
    BOOL isStudent;
    NSString *str1;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array=[NSMutableArray array];
    NSURL *url=[NSURL URLWithString:@"http://192.168.1.219/web/xml.xml"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    if (data) {
            NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
        //设定代理
        parser.delegate=self;
        //开始解析
        if([parser parse])
        {
            NSLog(@"解析成功");
        }else{
            NSLog(@"解析失败");
        }
    }
    
}
#pragma  mark----－－－－－－xml解析代理方法
//文档的开始
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"文档开始");
}
//元素的开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"元素开始-%@-",elementName);
    if ([elementName isEqualToString:@"student"])
    {
        isStudent=YES;
        student=[[ZKZStudent alloc]init];
    }
    str1=elementName;
    
}
//发现字符串
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"发现字符串－%@－",string);
    if (isStudent) {
        if ([str1 isEqualToString:@"name"]) {
            student.name=string;
        }
        if ([str1 isEqualToString:@"age"]) {
            student.age=[string intValue];
        }
    }
    
    
}
//元素的结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"元素的结束-%@-",elementName);
    if ([elementName isEqualToString:@"student"]) {
        [array addObject:student];
        isStudent=NO;
    }
    str1=@"";
    
    
}
//文档的结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"文档的结束");
    for (ZKZStudent *s in array) {
        NSLog(@"%@",s);
    }
}

//转换的错误
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"转换的错误");
}
//校验错误
-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    NSLog(@"校验错误");
}

@end

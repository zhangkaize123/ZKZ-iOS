//
//  ViewController.m
//  XML解析
//
//  Created by wyzc on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"

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
        NSXMLParser * parser=[[NSXMLParser alloc]initWithData:data];
        [parser setDelegate:self];
        if([parser parse])
        {
            NSLog(@"解析成功！");
        }
        else
        {
            NSLog(@"解析失败！");
        }
    }
}
//文档的开始
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"文档开始!");
}
//元素开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@元素开始!",elementName);
    if([elementName isEqualToString:@"student"])
    {
        isStudent=YES;
        NSLog(@"student开始!");
        student=[[ZHQStudent alloc]init];
    }
    nameProperty=elementName;
}
//发现字符串
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(isStudent)
    {
        if([nameProperty isEqualToString:@"name"])
        {
            student.name=string;
        }
        else if([nameProperty isEqualToString:@"age"])
        {
            student.age=[string intValue];
        }
    }
}
//元素结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"%@元素结束!",elementName);
    if([elementName isEqualToString:@"student"])
    {
        isStudent=NO;
        [self.students addObject:student];
    }
    nameProperty=@"";
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"文档结束!");
    for(ZHQStudent * s in self.students)
    {
        NSLog(@"%@",s);
    }
}
//转换错误
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"转换错误了!");
}
//校验错误
-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    NSLog(@"校验错误了!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

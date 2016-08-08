//
//  ViewController.m
//  XML作业
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZStudent.h"
#import "ZKZTeacher.h"
@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic,strong)NSMutableArray *students;
@property(nonatomic,strong)NSMutableArray *teaches;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.teaches=[NSMutableArray array];
    self.students=[NSMutableArray array];
    NSURL *url=[NSURL URLWithString:@"http://localhost/web/xmlhomework.xml"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if (data) {
        //NSLog(@"%@",data);
        NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
        parser.delegate=self;
        if (parser.parse) {
            NSLog(@"解析成功");
        }else{
            NSLog(@"解析失败");
        }
    }
}
#pragma mark------xml代理方法
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"student"]) {
        ZKZStudent *student=[[ZKZStudent alloc]init];
        [student setValuesForKeysWithDictionary:attributeDict];
        [self.students addObject:student];
    }
    if ([elementName isEqualToString:@"teacher"]) {
        ZKZTeacher *student=[[ZKZTeacher alloc]init];
        [student setValuesForKeysWithDictionary:attributeDict];
        [self.students addObject:student];
    }

    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    for (ZKZStudent *s in self.students) {
        NSLog(@"%@",s);
    }
    for (ZKZTeacher *t in self.teaches) {
        NSLog(@"%@",t);
    }

}
@end

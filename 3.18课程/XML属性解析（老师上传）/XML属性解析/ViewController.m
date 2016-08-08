//
//  ViewController.m
//  XML属性解析
//
//  Created by wyzc on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZHQStudent.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students=[[NSMutableArray alloc]initWithCapacity:100];
    NSURL * url=[NSURL URLWithString:@"http://localhost/web/xml.xml"];
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    NSData * data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data)
    {
        NSXMLParser * parser=[[NSXMLParser alloc]initWithData:data];
        [parser setDelegate:self];
        [parser parse];
    }
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@开始！(%@)",elementName,attributeDict);
    if([elementName isEqualToString:@"student"])
    {
        ZHQStudent * student=[[ZHQStudent alloc]init];
        NSArray * keys=[attributeDict allKeys];
        for(NSString * s in keys)
        {
            [student setValue:[attributeDict objectForKey:s] forKey:s];
        }
        /*
        for(NSString * s in keys)
        {
            if([s isEqualToString:@"name"])
            {
                student.name=[attributeDict objectForKey:s];
            }
            if([s isEqualToString:@"age"])
            {
                student.age=[attributeDict objectForKey:s];
            }
        }
         */
        [self.students addObject:student];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"%@结束!",elementName);
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    for(ZHQStudent * s in self.students)
    {
        NSLog(@"%@",s);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  XML解析（属性解析）
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZStudent.h"
@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic,strong)NSMutableArray *students;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students=[NSMutableArray array];
    NSURL *url=[NSURL URLWithString:@"http://192.168.1.219/web/xml.xml"];
    NSURLRequest *resquest=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:resquest returningResponse:nil error:nil];
    if (data)
    {
        NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
        parser.delegate=self;
        if(parser.parse)
        {
            NSLog(@"解析成功");
        }else{
            NSLog(@"解析失败");
        }

    }
}
#pragma mark------xml代理方法
//元素的开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    NSLog(@"元素的开始");
    if ([elementName isEqualToString:@"student"]) {
        ZKZStudent *student=[[ZKZStudent alloc]init];
        NSArray * keys=[attributeDict allKeys];
        for (NSString *str in keys) {
            //通过kvc来设值
            //[student setValue:[attributeDict objectForKey:str] forKey:str];
            [student setValue:[attributeDict objectForKey:str] forKeyPath:str];
        }
        //[student setValuesForKeysWithDictionary:attributeDict];
        [self.students addObject:student];
    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"string=%@",string);
}
//元素的结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"元素的结束");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    for (ZKZStudent *s in self.students) {
        NSLog(@"%@",s);
    }
}







@end

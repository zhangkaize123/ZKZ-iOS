//
//  ViewController.m
//  03_xml
//
//  Created by 张凯泽 on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZStudent.h"
@interface ViewController ()<NSXMLParserDelegate>
{
    BOOL isStudent;
    NSString *strparamery;
    ZKZStudent *student;
}
@property(nonatomic,strong)NSMutableArray *students;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students=[NSMutableArray array];
//    NSBundle *bundle=[NSBundle mainBundle];
//    NSString *path=[bundle pathForResource:@"xml_1" ofType:@"xml"];
//    NSURL *url = [[NSURL alloc]initFileURLWithPath:path];

    NSURL *url=[NSURL URLWithString:@"http://localhost/web/xml_1.xml"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSError *error;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSLog(@"%@",data);
    NSLog(@"%@",error);
    if (data) {
        NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
        parser.delegate=self;
        if(parser.parse)
        {
            NSLog(@"解析成功");
        }
        else{
            NSLog(@"解析失败");
        }
    }

}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
   
    if ([elementName isEqualToString:@"student"]) {
        student=[[ZKZStudent alloc]init];
        [student setValuesForKeysWithDictionary:attributeDict];
       
        isStudent=YES;
    }
    strparamery=elementName;
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (isStudent) {
        
        if ([strparamery isEqualToString:@"sex"]) {
            
            student.sex=string;
            
        }
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"student"]) {
        isStudent=NO;
        [self.students addObject:student];
       
    }
    strparamery=@"";
    
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    for (ZKZStudent *s in self.students) {
        NSLog(@"%@",s);
    }
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parseError=%@",parseError);
}
@end

//
//  ViewController.m
//  02XML作业
//
//  Created by 张凯泽 on 15-3-18.
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
    [super viewDidLoad];
    self.teachers=[NSMutableArray array];
    self.students=[NSMutableArray array];
    NSURL *url=[NSURL URLWithString:@"http:localhost/web/xmlhomework.xml"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data) {
        GDataXMLDocument *document=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        NSArray *array=document.rootElement.children;
        for (GDataXMLElement *element in array) {
            if ([element.name isEqualToString:@"students"])
            {
                NSArray *students=element.children;
                for (GDataXMLElement *student in students) {
                    ZKZStudent *s=[[ZKZStudent alloc]init];
                    NSString *strname=[student attributeForName:@"name"].stringValue;
                    NSString * strage=[[student attributeForName:@"age"]stringValue];
                    [s setValue:strname forKey:@"name"];
                    [s setValue:strage forKey:@"age"];
                    [self.students addObject:s];
                }
            }
            if ([element.name isEqualToString:@"teachers"]) {
                NSArray *teachers=element.children;
                for (GDataXMLElement *teacher in teachers) {
                    ZKZTeacher *t=[[ZKZTeacher alloc]init];
                    NSString *strname=[teacher attributeForName:@"name"].stringValue;
                    NSString * strage=[[teacher attributeForName:@"age"]stringValue];
                    [t setValue:strname forKey:@"name"];
                    [t setValue:strage forKey:@"age"];
                    [self.teachers addObject:t];
                    
                }

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


@end

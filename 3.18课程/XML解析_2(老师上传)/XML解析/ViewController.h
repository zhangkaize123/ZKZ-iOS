//
//  ViewController.h
//  XML解析
//
//  Created by wyzc on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHQStudent.h"
@interface ViewController : UIViewController<NSXMLParserDelegate>
{
    BOOL isStudent;//是不是学生节点
    NSString * nameProperty;//属性
    ZHQStudent * student;
}
@property (strong,nonatomic) NSMutableArray * students;
@end


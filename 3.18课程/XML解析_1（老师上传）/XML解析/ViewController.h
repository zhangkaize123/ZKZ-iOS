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
    int  idProperty;//属性代号1－姓名2-年龄0-不是学生的属性
    ZHQStudent * student;
}
@property (strong,nonatomic) NSMutableArray * students;
@end


//
//  ViewController.h
//  XML属性解析
//
//  Created by wyzc on 15-3-18.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate>
@property (strong,nonatomic) NSMutableArray * students;

@end


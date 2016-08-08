//
//  ViewController.h
//  分区索引表视图
//
//  Created by wyzc on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//归类的字典
@property (strong,nonatomic) NSMutableDictionary * allNames;
//关键字
@property (strong,nonatomic) NSMutableSet * allKeys;
@end


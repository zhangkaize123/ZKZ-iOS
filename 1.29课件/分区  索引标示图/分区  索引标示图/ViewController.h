//
//  ViewController.h
//  分区  索引标示图
//
//  Created by 张凯泽 on 15-1-29.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//归类的字典
@property(strong,nonatomic)NSMutableDictionary *allnames;
//关键字
@property(strong,nonatomic)NSMutableSet *allkeys;

@end
